import { useEffect, useRef, useState, type DragEvent } from "react";
import JSZip from "jszip";
import { doc, setDoc, increment } from "firebase/firestore";
import { db } from "./config/firebase";
import { saveToHistory, getHistory, deleteFromHistory, type HistoryEntry } from "./features/cache/history";
import type { QuizDocument, Question, QuestionGroup, QuestionType, ContentBlock } from "./models/quiz";
import { uid } from "./models/quiz";
import { demoQuiz } from "./demo/demoData";
import { importDocx } from "./features/import-docx/importDocx";
import { QuestionEditor } from "./features/editor/QuestionEditor";
import { QuestionPlayer } from "./features/interaction/QuestionPlayer";
import { LandingTabs, type SampleCard } from "./components/LandingTabs";
import { PricingModal } from "./components/PricingModal";
import { SubjectOnboarding } from "./components/SubjectOnboarding";
import { SubjectGuideCard } from "./components/SubjectGuideCard";
import { SourceProtectionNotice } from "./components/SourceProtectionNotice";
import { TYPE_LABELS } from "./config/questionPatterns";
import { createTeacherKey, exportHtml, exportJson, exportZip, exportTypst, exportExTest, exportDocx } from "./features/export/exporters";
import { PresentationDeck } from "./components/PresentationDeck";
import { ClassroomTools } from "./components/ClassroomTools";
import {
  AI_MODE_INFO,
  importWithAi,
  type AiMode,
  type OcrProvider,
} from "./features/import-ai/aiImport";
import { useAuth } from "./hooks/useAuth";
import { DEFAULT_PROFILE_ID, ENGLISH_CORE_PROFILE_IDS, SUBJECT_PROFILES, defaultProfileForSubject, getSubjectProfile, makeProfileRef, profileLevelLabel, profilesForSubject, withProfile } from "./config/subjectProfiles";
import { createProfileSample } from "./demo/profileSamples";
import { questionAnswerStatus } from "./utils/questionStatus";

type Stats = {
  paragraphs: number;
  images: number;
  math: number;
  questions: number;
  warnings: number;
};
const blankQuestion = (n: number, type: QuestionType = "single-choice") => ({
  id: uid("q"),
  number: n,
  type,
  stem: [{ id: uid("p"), kind: "paragraph" as const, text: "Câu hỏi mới" }],
  choices: "ABCD".split("").map((label) => ({
    id: uid("c"),
    label,
    content: [{ id: uid("p"), kind: "paragraph" as const, text: "" }],
    isCorrect: null,
  })),
  attachments: [],
  confidence: "high" as const,
  warnings: [],
});
export default function App() {
  const [quiz, setQuiz] = useState<QuizDocument | null>(null),
    [selected, setSelected] = useState(""),
    [files, setFiles] = useState<File[]>([]),
    [progress, setProgress] = useState(0),
    [status, setStatus] = useState(""),
    [error, setError] = useState(""),
    [stats, setStats] = useState<Stats | null>(null),
    [mode, setMode] = useState<AiMode>("auto"),
    [profileId, setProfileId] = useState(() => localStorage.getItem("conic_subject_profile") || DEFAULT_PROFILE_ID),
    [grade, setGrade] = useState(() => localStorage.getItem("conic_subject_grade") || getSubjectProfile(localStorage.getItem("conic_subject_profile") || DEFAULT_PROFILE_ID).defaultGrade),
    [generateSolutions, setGenerateSolutions] = useState(true),
    [customApiKey, setCustomApiKey] = useState(() => localStorage.getItem("conic_custom_api_key") || ""),
    [useCustomKey, setUseCustomKey] = useState(() => Boolean(localStorage.getItem("conic_custom_api_key"))),
    [importMeta, setImportMeta] = useState<{ provider: OcrProvider | "docx-local"; pages: number; cost: number } | null>(null),
    [teacherKey] = useState(() => createTeacherKey()),
    [present, setPresent] = useState(false),
    [showEnglishVariants, setShowEnglishVariants] = useState(false);
  const file = files[0] || null;
  const { user, isAdmin, isPaid, daysLeft, usageCount, userPreferences, userPreferencesReady, savePreferredSubject, signInWithGoogle, logout } = useAuth();
  const fileRef = useRef<HTMLInputElement>(null);
  const dropzoneRef = useRef<HTMLDivElement>(null);
  const [showPricing, setShowPricing] = useState(false);
  const [showSupport, setShowSupport] = useState(false);
  const [showSourceWarning, setShowSourceWarning] = useState(false);
  const [paymentMessage, setPaymentMessage] = useState("");
  const [history, setHistory] = useState<HistoryEntry[]>([]);
  const [sidebarCollapsed, setSidebarCollapsed] = useState(false);
  const [aiGenerating, setAiGenerating] = useState(false);
  const selectedProfile = getSubjectProfile(profileId);
  const preferredSubject = isAdmin ? "" : userPreferences.preferredSubject || "";
  const subjectLocked = Boolean(user && !isAdmin && userPreferencesReady && preferredSubject);
  const needsSubjectOnboarding = Boolean(user && !isAdmin && userPreferencesReady && !preferredSubject);
  const subjectProfiles = subjectLocked ? profilesForSubject(preferredSubject) : SUBJECT_PROFILES;
  const visibleProfiles = subjectLocked && preferredSubject === "Tiếng Anh" && !showEnglishVariants
    ? subjectProfiles.filter((profile) => ENGLISH_CORE_PROFILE_IDS.includes(profile.id as typeof ENGLISH_CORE_PROFILE_IDS[number]) || profile.id === profileId)
    : subjectProfiles;
  const visibleSampleProfileIds = visibleProfiles.map((profile) => profile.id);
  // Every selected subject gets the same local-first DOCX/editor path. The
  // parser chooses an official adapter where one exists, otherwise the
  // profile-aware fallback keeps sections and shared data ready for review.
  const localDocxCandidate = files.length === 1 && Boolean(file) && file.name.toLowerCase().endsWith(".docx") && (mode === "auto" || mode === "economy");

  const requestSignIn = async () => {
    try {
      await signInWithGoogle();
    } catch (error) {
      const code = error && typeof error === "object" && "code" in error ? String((error as { code?: string }).code) : "";
      if (code === "auth/unauthorized-domain") {
        setError(`Firebase chưa cho phép domain hiện tại (${window.location.hostname}). Hãy thêm domain này vào Authentication → Settings → Authorized domains.`);
      } else {
        setError(error instanceof Error ? error.message : "Không thể đăng nhập Google.");
      }
    }
  };

  const selectProfile = (nextProfileId: string) => {
    const next = getSubjectProfile(nextProfileId);
    if (subjectLocked && next.subject !== preferredSubject) return;
    setProfileId(next.id);
    setGrade(next.defaultGrade);
    localStorage.setItem("conic_subject_profile", next.id);
    localStorage.setItem("conic_subject_grade", next.defaultGrade);
  };

  useEffect(() => {
    if (!subjectLocked || !preferredSubject || selectedProfile.subject === preferredSubject) return;
    const next = defaultProfileForSubject(preferredSubject);
    setProfileId(next.id);
    setGrade(next.defaultGrade);
    localStorage.setItem("conic_subject_profile", next.id);
    localStorage.setItem("conic_subject_grade", next.defaultGrade);
  }, [preferredSubject, selectedProfile.subject, subjectLocked]);

  const selectGrade = (nextGrade: string) => {
    setGrade(nextGrade);
    localStorage.setItem("conic_subject_grade", nextGrade);
  };

  const createAiVariantQuestion = (original: Question, newNumber: number): Question => {
    const copy: Question = structuredClone(original);
    copy.id = uid("q_ai");
    copy.number = newNumber;
    copy.isAiGenerated = true;

    const varMap: Record<string, string> = {
      "ABC": "MNP",
      "MNP": "EFG",
      "f(x)": "g(x)",
      "g(x)": "h(x)",
    };

    const variateText = (text: string): string => {
      let res = text;
      res = res.replace(/\b(\d+)\b/g, (match, num) => {
        const val = parseInt(num, 10);
        if (val >= 1 && val <= 100) {
          return String(val + Math.floor(Math.random() * 3) + 1);
        }
        return match;
      });
      for (const [k, v] of Object.entries(varMap)) {
        res = res.replaceAll(k, v);
      }
      return res;
    };

    copy.stem = copy.stem.map((b: ContentBlock) => {
      if (b.kind === "paragraph") return { ...b, text: variateText(b.text) };
      if (b.kind === "math") return { ...b, latex: variateText(b.latex) };
      return b;
    });

    if (copy.choices) {
      copy.choices = copy.choices.map((c) => ({
        ...c,
        id: uid("c"),
        content: c.content.map((b: ContentBlock) => {
          if (b.kind === "paragraph") return { ...b, text: variateText(b.text) };
          if (b.kind === "math") return { ...b, latex: variateText(b.latex) };
          return b;
        }),
      }));
    }

    if (copy.statements) {
      copy.statements = copy.statements.map((s) => ({
        ...s,
        id: uid("s"),
        content: s.content.map((b: ContentBlock) => {
          if (b.kind === "paragraph") return { ...b, text: variateText(b.text) };
          if (b.kind === "math") return { ...b, latex: variateText(b.latex) };
          return b;
        }),
      }));
    }

    if (copy.solution) {
      copy.solution = copy.solution.map((step) => ({
        ...step,
        id: uid("sol"),
        content: step.content.map((b: ContentBlock) => {
          if (b.kind === "paragraph") return { ...b, text: variateText(b.text) };
          if (b.kind === "math") return { ...b, latex: variateText(b.latex) };
          return b;
        }),
      }));
    }

    return copy;
  };

  const handleAiDuplicateQuestion = () => {
    if (!quiz) return;
    const selectedIdx = quiz.questions.findIndex((x) => x.id === selected);
    if (selectedIdx === -1) return;
    const currentQ = quiz.questions[selectedIdx];
    setAiGenerating(true);
    setTimeout(() => {
      const newQ = createAiVariantQuestion(currentQ, selectedIdx + 2);
      const newQuestions = [...quiz.questions];
      newQuestions.splice(selectedIdx + 1, 0, newQ);
      const renumbered = newQuestions.map((q, idx) => ({ ...q, number: idx + 1 }));
      setQuiz({
        ...quiz,
        questions: renumbered,
        groups: (quiz.groups || []).map((group) => group.id === currentQ.groupId ? { ...group, questionIds: [...new Set([...group.questionIds, newQ.id])] } : group),
        sections: (quiz.sections || []).map((section) => section.id === currentQ.sectionId ? { ...section, questionIds: [...new Set([...section.questionIds, newQ.id])] } : section),
      });
      setSelected(newQ.id);
      setAiGenerating(false);
    }, 350);
  };

  useEffect(() => {
    getHistory().then(setHistory);
  }, []);

  useEffect(() => {
    if (isAdmin) return undefined;
    const warnSourceAccess = (event: MouseEvent | KeyboardEvent) => {
      if (event instanceof MouseEvent) {
        const target = event.target instanceof HTMLElement ? event.target : null;
        if (target?.closest('input, textarea, select, [contenteditable="true"]')) return;
        event.preventDefault();
        setShowSourceWarning(true);
        return;
      }
      const key = event.key.toLowerCase();
      const sourceShortcut = (event.ctrlKey || event.metaKey) && key === 'u';
      const developerShortcut = event.key === 'F12' || ((event.ctrlKey || event.metaKey) && event.shiftKey && ['i', 'j', 'c'].includes(key));
      if (sourceShortcut || developerShortcut) {
        event.preventDefault();
        setShowSourceWarning(true);
      }
    };
    document.addEventListener('contextmenu', warnSourceAccess);
    window.addEventListener('keydown', warnSourceAccess);
    return () => {
      document.removeEventListener('contextmenu', warnSourceAccess);
      window.removeEventListener('keydown', warnSourceAccess);
    };
  }, [isAdmin]);

  const handleCustomKeyChange = (key: string) => {
    setCustomApiKey(key);
    if (key.trim()) {
      localStorage.setItem("conic_custom_api_key", key.trim());
    } else {
      localStorage.removeItem("conic_custom_api_key");
    }
  };

  const handlePricingSelect = async (planId: string, _price: number) => {
    if (!user) {
      setShowPricing(false);
      setError("Hãy đăng nhập Gmail trước khi mua gói để hệ thống cấp quyền đúng tài khoản.");
      void requestSignIn();
      return;
    }
    try {
      const idToken = await user.getIdToken();
      const response = await fetch('/api/payos-create', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json', Authorization: `Bearer ${idToken}` },
        body: JSON.stringify({ 
          planId,
          subject: preferredSubject || "Tiếng Anh",
        })
      });
      const data = await response.json().catch(() => ({}));
      if (data.checkoutUrl) {
        window.location.href = data.checkoutUrl;
      } else {
        setPaymentMessage(data.error || "Không tạo được link thanh toán. Vui lòng thử lại sau.");
      }
    } catch (e) {
      console.error(e);
      setPaymentMessage(e instanceof Error ? e.message : "Hệ thống thanh toán đang được bảo trì.");
    }
  };

  useEffect(() => {
    const params = new URLSearchParams(window.location.search);
    const payment = params.get("payment");
    const orderCode = params.get("orderCode");
    if (!payment || !orderCode) return undefined;
    if (payment === "cancel") {
      setPaymentMessage("Bạn đã hủy thanh toán. Gói chưa được kích hoạt.");
      window.history.replaceState({}, document.title, window.location.pathname);
      return undefined;
    }
    if (payment !== "success" || !user) return undefined;

    let cancelled = false;
    let timer: ReturnType<typeof setTimeout> | undefined;
    let attempts = 0;
    const checkPayment = async () => {
      try {
        const token = await user.getIdToken();
        const response = await fetch(`/api/payos-status?orderCode=${encodeURIComponent(orderCode)}`, {
          headers: { Authorization: `Bearer ${token}` },
        });
        const payload = await response.json().catch(() => ({}));
        if (cancelled) return;
        if (payload.status === "paid" || payload.subscriptionActive) {
          setPaymentMessage("Thanh toán thành công. Gói đã được kích hoạt cho tài khoản Gmail này.");
          window.history.replaceState({}, document.title, window.location.pathname);
          return;
        }
        attempts += 1;
        if (attempts < 8) {
          setPaymentMessage("Đã nhận thanh toán. Đang chờ PayOS xác nhận và kích hoạt gói…");
          timer = setTimeout(() => void checkPayment(), 2000);
        } else {
          setPaymentMessage("Thanh toán đã trở về hệ thống. Nếu chưa thấy gói, hãy tải lại trang sau ít phút hoặc liên hệ hỗ trợ.");
          window.history.replaceState({}, document.title, window.location.pathname);
        }
      } catch {
        if (!cancelled) setPaymentMessage("Không kiểm tra được trạng thái thanh toán. Vui lòng tải lại trang sau ít phút.");
      }
    };
    void checkPayment();
    return () => {
      cancelled = true;
      if (timer) clearTimeout(timer);
    };
  }, [user]);

  useEffect(() => {
    if (quiz && !quiz.questions.some((q) => q.id === selected))
      setSelected(quiz.questions[0]?.id || "");
  }, [quiz, selected]);
  const openDemo = () => {
    const copy = structuredClone(demoQuiz);
    setQuiz(copy);
    setSelected(copy.questions[0].id);
    setStats({ paragraphs: 15, images: 1, math: 4, questions: 4, warnings: 1 });
  };
  const sampleQuiz = (sample: SampleCard): QuizDocument => {
    return createProfileSample(sample.profileId, sample.gradeValue);
  };
  const openDocxSample = async (sample: SampleCard) => {
    if (!sample.docxUrl) return;
    selectProfile(sample.profileId);
    setError("");
    setProgress(3);
    try {
      const response = await fetch(sample.docxUrl);
      if (!response.ok) throw new Error("Không tải được file Word mẫu.");
      const file = new File([await response.blob()], sample.docxFileName || "english-sample.docx", { type: "application/vnd.openxmlformats-officedocument.wordprocessingml.document" });
      const result = await importDocx(file, (value, message) => {
        setProgress(value);
        setStatus(message);
      }, { profileId: sample.profileId });
      const importedQuiz = { ...withProfile(result.quiz, sample.profileId, sample.gradeValue), title: sample.title };
      setQuiz(importedQuiz);
      setSelected(importedQuiz.questions[0]?.id || "");
      setStats({
        paragraphs: result.inspection.paragraphs,
        images: result.inspection.images.length,
        math: result.inspection.math.length + result.inspection.oleCount,
        questions: importedQuiz.questions.length,
        warnings: importedQuiz.warnings.length,
      });
      setImportMeta({ provider: "docx-local", pages: 0, cost: 0 });
      window.scrollTo({ top: 0, behavior: "smooth" });
    } catch (error) {
      setError(error instanceof Error ? error.message : "Không mở được file Word mẫu.");
      setProgress(0);
    }
  };
  const openSample = (sample: SampleCard) => {
    if (sample.docxUrl) {
      void openDocxSample(sample);
      return;
    }
    const copy = sampleQuiz(sample);
    selectProfile(sample.profileId);
    if (copy.profile?.grade) selectGrade(copy.profile.grade);
    setQuiz(copy);
    setSelected(copy.questions[0]?.id || "");
    setStats({ paragraphs: 15, images: 1, math: 4, questions: copy.questions.length, warnings: 0 });
    setImportMeta({ provider: "local", pages: 0, cost: 0 });
    window.scrollTo({ top: 0, behavior: 'smooth' });
  };
  const downloadSample = (sample: SampleCard) => {
    if (sample.docxUrl) {
      const link = document.createElement("a");
      link.href = sample.docxUrl;
      link.download = sample.docxFileName || "english-sample.docx";
      document.body.appendChild(link);
      link.click();
      link.remove();
      return;
    }
    // Xuất một tệp Word mẫu thật từ cùng cấu trúc mà giáo viên sẽ biên tập.
    exportDocx(sampleQuiz(sample));
  };
  const handlePremiumAction = (action: () => void) => {
    if (!user) {
      alert("Vui lòng đăng nhập để tiếp tục!");
      void requestSignIn();
      return;
    }
    if (!isAdmin && (daysLeft <= 0 || usageCount >= 10)) {
      setShowPricing(true);
      return;
    }
    action();
  };

  const read = async () => {
    if (files.length === 0 || !file) return;
    
    // DOCX starts locally. Automatic cloud verification remains protected by
    // the same trial/subscription gate as every other AI/OCR request.
    if (!user && !localDocxCandidate) {
      alert("Vui lòng đăng nhập để bắt đầu dùng thử 7 ngày miễn phí!");
      void requestSignIn();
      return;
    }
    if (!localDocxCandidate && !isAdmin && !(useCustomKey && customApiKey) && usageCount >= 10) {
      setShowPricing(true); // Exceeded 10 free uses
      return;
    }

    setError("");
    setProgress(2);
    try {
      const report = (n: number, s: string) => {
        setProgress(n);
        setStatus(s);
      };
      // Luồng DOCX local cũ được giữ nguyên cho Toán. Các profile môn khác cần
      // AI hậu xử lý để nhận phần thi, tư liệu và câu hỏi chùm theo đúng môn.
      const localDocx = localDocxCandidate;
      if (localDocx) {
        const result = await importDocx(file, report, { profileId });
        const needsCloudVerification = mode === "auto" && result.assessment.shouldUseCloudVerification;
        const canUseCloudVerification = Boolean(user) && (isAdmin || useCustomKey || usageCount < 10);
        if (needsCloudVerification && canUseCloudVerification) {
          report(38, "DOCX có cấu trúc rủi ro · Mistral đang đối chiếu toàn bộ tài liệu…");
          const activeCustomKey = useCustomKey && customApiKey.trim() ? customApiKey.trim() : undefined;
          const authToken = user ? await user.getIdToken() : undefined;
          const verified = await importWithAi(file, "balanced", report, generateSolutions, activeCustomKey, { profileId, grade, authToken });
          setQuiz(verified.quiz);
          setSelected(verified.quiz.questions[0]?.id || "");
          setStats({
            paragraphs: verified.quiz.questions.reduce((sum, question) => sum + question.stem.filter((block) => block.kind === "paragraph").length, 0),
            images: verified.quiz.questions.reduce((sum, question) => sum + question.stem.filter((block) => block.kind === "image").length, 0),
            math: verified.quiz.questions.reduce((sum, question) => sum + question.stem.filter((block) => block.kind === "math").length, 0),
            questions: verified.quiz.questions.length,
            warnings: verified.quiz.warnings.length,
          });
          setImportMeta({ provider: verified.provider, pages: verified.pageCount, cost: verified.estimatedOcrUsd });
          await saveToHistory(verified.quiz);
          setHistory(await getHistory());
          if (user && !isAdmin && !activeCustomKey && verified.estimatedOcrUsd > 0) {
            await setDoc(doc(db, "users", user.uid), { aiImportCount: increment(1) }, { merge: true });
          }
          return;
        }
        const profiledQuiz = withProfile(result.quiz, profileId, grade);
        setQuiz(profiledQuiz);
        setSelected(result.quiz.questions[0]?.id || "");
        setStats({
          paragraphs: result.inspection.paragraphs,
          images: result.inspection.images.length,
          math: result.inspection.math.length + result.inspection.oleCount,
          questions: result.quiz.questions.length,
          warnings: result.quiz.warnings.length,
        });
        setImportMeta({ provider: "docx-local", pages: 0, cost: 0 });
        return;
      }
      const activeCustomKey = useCustomKey && customApiKey.trim() ? customApiKey.trim() : undefined;
      const targetInput = files.length > 1 ? files : file;
      const authToken = user ? await user.getIdToken() : undefined;
      const result = await importWithAi(targetInput, mode, report, generateSolutions, activeCustomKey, { profileId, grade, authToken });
      setQuiz(result.quiz);
      setSelected(result.quiz.questions[0]?.id || "");
      setStats({
        paragraphs: result.quiz.questions.reduce((sum, question) => sum + question.stem.filter((block) => block.kind === "paragraph").length, 0),
        images: result.quiz.questions.reduce((sum, question) => sum + question.stem.filter((block) => block.kind === "image").length, 0),
        math: result.quiz.questions.reduce((sum, question) => sum + question.stem.filter((block) => block.kind === "math").length, 0),
        questions: result.quiz.questions.length,
        warnings: result.quiz.warnings.length,
      });
      setImportMeta({ provider: result.provider, pages: result.pageCount, cost: result.estimatedOcrUsd });
      
      // Save to history
      await saveToHistory(result.quiz);
      setHistory(await getHistory());

      // Update usage count if it cost something and they don't have custom key
      if (user && !isAdmin && !activeCustomKey && result.estimatedOcrUsd > 0) {
        try {
          await setDoc(doc(db, "users", user.uid), { aiImportCount: increment(1) }, { merge: true });
        } catch (e) {
          console.error("Failed to update usage count", e);
        }
      }
    } catch (e) {
      setError(e instanceof Error ? e.message : "Không đọc được tài liệu.");
      setProgress(0);
    }
  };
  const importJson = async (f: File) => {
    try {
      let content = "";
      if (f.name.toLowerCase().endsWith(".zip") || f.type === "application/zip") {
        const zip = new JSZip();
        const loaded = await zip.loadAsync(f);
        const jsonFile = loaded.file("quiz-data.json");
        if (!jsonFile) throw new Error("Không tìm thấy quiz-data.json trong file zip.");
        content = await jsonFile.async("text");
      } else {
        content = await f.text();
      }
      
      const q = JSON.parse(content) as QuizDocument;
      if (!Array.isArray(q.questions)) throw 0;
      if (!q.profile) q.profile = makeProfileRef(DEFAULT_PROFILE_ID, "12");
      q.sections ||= [];
      q.groups ||= [];
      selectProfile(q.profile.id);
      selectGrade(q.profile.grade);
      setQuiz(q);
      setSelected(q.questions[0]?.id || "");
      await saveToHistory(q);
      setHistory(await getHistory());
    } catch (e) {
      setError(e instanceof Error ? e.message : "File không đúng định dạng quiz-data.");
    }
  };
  const dropOnQuestion = (
    event: DragEvent,
    targetId: string,
    targetIndex: number,
  ) => {
    if (!quiz) return;
    const imageData = event.dataTransfer.getData("application/x-quiz-image");
    if (imageData) {
      try {
        const parsed = JSON.parse(imageData) as { sourceQuestionId: string; blockIndex: number };
        const sourceQuestionIndex = quiz.questions.findIndex((item) => item.id === parsed.sourceQuestionId);
        if (sourceQuestionIndex < 0) return;
        const sourceQuestion = quiz.questions[sourceQuestionIndex];
        const blockToMove = sourceQuestion.stem[parsed.blockIndex];
        if (!blockToMove || blockToMove.kind !== "image") return;

        const nextQuestions = quiz.questions.map((question, index) => {
          if (index === sourceQuestionIndex) {
            const nextStem = [...question.stem];
            nextStem.splice(parsed.blockIndex, 1);
            return { ...question, stem: nextStem };
          }
          if (index === targetIndex) {
            const nextStem = [...question.stem];
            nextStem.push(blockToMove);
            return { ...question, stem: nextStem };
          }
          return question;
        });

        setQuiz({ ...quiz, questions: nextQuestions });
        setSelected(targetId);
      } catch {
        // Fallback for raw image drop
      }
    }
    const sourceId = event.dataTransfer.getData("text/plain");
    const sourceIndex = quiz.questions.findIndex(
      (question) => question.id === sourceId,
    );
    if (sourceIndex < 0) return;
    const questions = [...quiz.questions],
      moved = questions.splice(sourceIndex, 1)[0];
    questions.splice(targetIndex, 0, moved);
    setQuiz({
      ...quiz,
      questions: questions.map((question, index) => ({
        ...question,
        number: index + 1,
      })),
    });
  };
  const handleAiSolve = async (question: Question, group?: QuestionGroup) => {
    const activeCustomKey = useCustomKey && customApiKey.trim() ? customApiKey.trim() : undefined;
    const authToken = user ? await user.getIdToken() : undefined;
    const response = await fetch("/api/solve", {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        ...(authToken ? { Authorization: `Bearer ${authToken}` } : {}),
      },
      body: JSON.stringify({
        profileId: quiz?.profile?.id || profileId,
        grade: quiz?.profile?.grade || grade,
        customApiKey: activeCustomKey,
        question,
        group,
      }),
    });
    let payload: { ok?: boolean; solution?: string; error?: string } = {};
    try { payload = await response.json(); } catch { /* handled below */ }
    if (!response.ok || !payload.solution) throw new Error(payload.error || "AI chưa tạo được lời giải. Bạn có thể tự nhập lời giải bên dưới.");
    return payload.solution;
  };
  if (needsSubjectOnboarding)
    return <SubjectOnboarding email={user?.email} onChoose={savePreferredSubject} onLogout={logout} />;
  if (present && quiz)
    return <PresentationDeck quiz={quiz} onExit={() => setPresent(false)} />;
  return (
    <div className="app">
      <ClassroomTools />
      {showSourceWarning && <SourceProtectionNotice onClose={() => setShowSourceWarning(false)} />}
      {showPricing && <PricingModal onSelectPlan={handlePricingSelect} onClose={() => setShowPricing(false)} />}
      {paymentMessage && <div className="payment-notice" role="status">{paymentMessage}<button onClick={() => setPaymentMessage("")} aria-label="Đóng">×</button></div>}
      <header>
        <div className="brand" style={{ display: 'flex', alignItems: 'center', gap: '10px' }}>
          <img src="/logo.png" alt="AI Lesson Studio Logo" style={{ width: '40px', height: '40px', objectFit: 'contain', borderRadius: '8px' }} />
          <div>
            <b>Trình Chiếu</b>
            <small>AI Lesson Studio</small>
          </div>
        </div>
        <nav>
          {quiz && (
            <>
              <button onClick={() => setPresent(true)}>▶ Trình chiếu</button>
              <button onClick={() => handlePremiumAction(() => exportTypst(quiz))} title="Xuất file .typ chuẩn">📄 Xuất .typ</button>
              <button onClick={() => handlePremiumAction(() => exportExTest(quiz))} title="Xuất LaTeX theo cấu trúc ex_test.sty">📐 Xuất .tex</button>
              <button onClick={() => handlePremiumAction(() => exportDocx(quiz))} title="Xuất file Word chứa công thức Toán">📝 Xuất Word</button>
              <button onClick={() => handlePremiumAction(() => void exportHtml(quiz, teacherKey))}>Xuất HTML</button>
              <button onClick={() => handlePremiumAction(() => void exportZip(quiz, teacherKey))}>Xuất ZIP</button>
              <button onClick={() => handlePremiumAction(() => exportJson(quiz))}>Xuất JSON</button>
            </>
          )}
          {!isAdmin && (
            <button className="upgrade-btn" onClick={() => setShowPricing(true)} style={{ marginLeft: '1rem', background: '#ff9800', color: '#fff', border: 'none', padding: '8px 16px', borderRadius: '4px', fontWeight: 'bold', cursor: 'pointer' }}>🚀 Nâng cấp</button>
          )}
          {isAdmin && (
            <button onClick={() => { window.location.href = '/admin.html'; }} title="Mở bảng điều khiển quản trị">
              📊 Quản trị
            </button>
          )}
          {user && !isAdmin && (
            <div 
              className={isPaid ? "" : "animate-pulse"}
              style={{ 
                marginLeft: '1rem', 
                background: isPaid ? 'linear-gradient(135deg, #10b981 0%, #059669 100%)' : 'linear-gradient(135deg, #f59e0b 0%, #ea580c 100%)', 
                color: 'white', 
                padding: '8px 16px', 
                borderRadius: '20px', 
                fontSize: '13px', 
                fontWeight: 700, 
                boxShadow: '0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06)', 
                display: 'flex', 
                alignItems: 'center', 
                gap: '6px', 
                letterSpacing: '0.3px',
                border: isPaid ? '1px solid #34d399' : '1px solid #fbbf24'
              }}>
              {isPaid ? `✨ Đã kích hoạt: Còn ${daysLeft} ngày` : `🎁 Dùng thử miễn phí: Còn ${Math.max(0, 10 - usageCount)} lượt`}
            </div>
          )}
          {user ? (
            <div className="user-profile" style={{ display: 'flex', alignItems: 'center', gap: '10px', marginLeft: '1rem' }} title={user.email || ""}>
              <img src={user.photoURL || ""} alt="Avatar" style={{ width: 32, height: 32, borderRadius: '50%' }} />
              {isAdmin && <span style={{ fontSize: '0.8rem', background: '#ffd700', color: '#000', padding: '2px 6px', borderRadius: '4px', fontWeight: 'bold' }}>👑 Admin</span>}
              <button onClick={logout}>Đăng xuất</button>
            </div>
          ) : (
            <button onClick={() => void requestSignIn()} style={{ marginLeft: '1rem', background: 'var(--primary)', color: 'black' }}>Đăng nhập Gmail</button>
          )}
        </nav>
      </header>
      {!quiz ? (
        <main className="landing">
          <div className="landing-top">
            <section className="hero">
              <p className="eyebrow"><span /> CONIC LESSON STUDIO · ENTERPRISE AI PLATFORM</p>
              <h1>
                Số Hóa Đề Thi & Bài Giảng Trình Chiếu AI
              </h1>
              <p>
                Tự động chuyển đổi tài liệu PDF, Word hoặc hàng loạt ảnh chụp thành bài giảng trình chiếu tương tác đẳng cấp 4K. Xuất mã nguồn Typst và Word công thức chuẩn Bộ Giáo Dục.
              </p>
              <div className="hero-proof">
                <span>✦ Tốc độ Local-First</span>
                <span>✦ Chuẩn BGD 2025</span>
                <span>✦ Xuất Typst & Word</span>
                <span>✦ Nạp nhiều ảnh cùng lúc</span>
              </div>
              
              <img src="/hero.png" alt="Minh họa AI Lesson Studio" className="hero-illustration" />
            </section>
            <section className="drop-card">
              <div
                ref={dropzoneRef}
                className={`dropzone${files.length > 0 ? ' has-file' : ''}`}
                onDragOver={(e) => e.preventDefault()}
                onDrop={(e) => {
                  e.preventDefault();
                  const dropped = Array.from(e.dataTransfer.files);
                  if (dropped.length) setFiles(dropped);
                }}
                onClick={() => fileRef.current?.click()}
              >
                <div className="upload-icon">↥</div>
                <b>
                  {files.length > 1
                    ? `📸 Đã chọn ${files.length} ảnh/tệp (${files.map(f => f.name).slice(0, 2).join(', ')}${files.length > 2 ? '...' : ''})`
                    : (file?.name || "Tải lên hoặc kéo thả tệp PDF, Word hoặc nhiều Ảnh cùng lúc vào đây")}
                </b>
                <span>
                  {files.length > 0
                    ? `${(files.reduce((s, f) => s + f.size, 0) / 1024 / 1024).toFixed(2)} MB (${files.length} tệp)`
                    : "Hỗ trợ định dạng .pdf, .docx, .png, .jpg, .webp (Cho phép chọn/kéo nhiều ảnh cùng lúc)"}
                </span>
                <input
                  ref={fileRef}
                  hidden
                  type="file"
                  multiple
                  accept=".docx,.doc,.pdf,.png,.jpg,.jpeg,.webp,application/pdf,image/png,image/jpeg,image/webp"
                  onChange={(e) => {
                    const selected = Array.from(e.target.files || []);
                    if (selected.length) setFiles(selected);
                  }}
                />
              </div>

              <div className="ai-routing">
                <div className="ai-row" style={{ display: 'grid', gridTemplateColumns: 'repeat(auto-fit,minmax(145px,1fr))', gap: '12px', alignItems: 'end' }}>
                  <label>
                    Môn và cấu trúc đề
                    <select value={profileId} onChange={(event) => selectProfile(event.target.value)}>
                      {visibleProfiles.map((profile) => (
                        <option value={profile.id} key={profile.id}>{profile.icon} {profile.label}</option>
                      ))}
                    </select>
                    {subjectLocked && preferredSubject === "Tiếng Anh" && (
                      <button type="button" className="profile-variants-toggle" onClick={() => setShowEnglishVariants((current) => !current)}>
                        {showEnglishVariants ? "Thu gọn cấu trúc nâng cao" : "Mở cấu trúc tỉnh khác"}
                      </button>
                    )}
                  </label>
                  <label>
                    Khối
                    <select value={grade} onChange={(event) => selectGrade(event.target.value)}>
                      {selectedProfile.grades.map((value) => <option value={value} key={value}>{selectedProfile.displayLevel || `Lớp ${value}`}</option>)}
                    </select>
                  </label>
                  <label>
                    Chế độ phân tích
                    <select value={mode} onChange={(event) => setMode(event.target.value as AiMode)}>
                      {(Object.keys(AI_MODE_INFO) as AiMode[]).map((value) => (
                        <option value={value} key={value}>{AI_MODE_INFO[value].label}</option>
                      ))}
                    </select>
                  </label>
                </div>
                <div className="profile-summary" style={{ marginTop: '16px', padding: '16px 20px', borderRadius: '16px', border: `1px solid ${selectedProfile.accent}33`, background: `${selectedProfile.accent}0d` }}>
                  <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', gap: '10px' }}>
                    <b style={{ color: selectedProfile.accent }}>{selectedProfile.icon} {selectedProfile.label} · {profileLevelLabel(selectedProfile, grade)}</b>
                    <small>{selectedProfile.groupMode === 'central' ? 'Câu hỏi chùm là cấu trúc chính' : selectedProfile.groupMode === 'recommended' ? 'Có hỗ trợ dữ kiện chung' : 'Chùm câu tùy chọn'}</small>
                  </div>
                  <p style={{ margin: '8px 0 12px', fontSize: '13px', color: 'var(--n600)', lineHeight: 1.55 }}>{selectedProfile.description}</p>
                  <div style={{ display: 'flex', flexWrap: 'wrap', gap: '8px' }}>
                    {selectedProfile.sections.map((section) => <span key={section.id} style={{ padding: '6px 10px', borderRadius: '999px', background: '#fff', border: '1px solid var(--n200)', fontSize: '11px', fontWeight: 700 }}>{section.title.replace(/^Phần\s+[IVX]+\s*·\s*/i, '')}</span>)}
                  </div>
                </div>
                <SubjectGuideCard profile={selectedProfile} grade={grade} />

                <div className="turbo-card" style={{ marginTop: '20px', padding: '20px', borderRadius: '16px', background: 'linear-gradient(135deg, rgba(16, 185, 129, 0.05) 0%, rgba(5, 150, 105, 0.1) 100%)', border: '1px solid rgba(16, 185, 129, 0.2)' }}>
                  <div style={{ display: 'flex', justifyContent: 'space-between', alignItems: 'center', marginBottom: '12px' }}>
                    <div style={{ display: 'flex', alignItems: 'center', gap: '8px' }}>
                      <span style={{ fontSize: '18px' }}>🚀</span>
                      <div>
                        <h4 style={{ margin: 0, color: 'var(--g700)', fontSize: '14px', fontWeight: 800 }}>Chế độ Tăng tốc (Turbo Mode)</h4>
                        <p style={{ margin: '2px 0 0', fontSize: '11px', color: 'var(--n600)' }}>Sử dụng API Key cá nhân để tốc độ xử lý nhanh nhất và 100% Miễn phí.</p>
                      </div>
                    </div>
                    <label className="switch">
                      <input type="checkbox" checked={useCustomKey} onChange={(e) => setUseCustomKey(e.target.checked)} />
                      <span className="slider round"></span>
                    </label>
                  </div>
                  
                  {useCustomKey && (
                    <div style={{ display: 'flex', flexDirection: 'column', gap: '8px', marginTop: '12px', animation: 'slideUpFade 0.3s ease' }}>
                      <div style={{ display: 'flex', gap: '8px', alignItems: 'center' }}>
                        <div style={{ flex: 1, position: 'relative' }}>
                          <span style={{ position: 'absolute', left: '12px', top: '50%', transform: 'translateY(-50%)', opacity: 0.5 }}>🔑</span>
                          <input
                            type="password"
                            placeholder="Nhập Google Gemini API Key (AIzaSy...)"
                            value={customApiKey}
                            onChange={(e) => handleCustomKeyChange(e.target.value)}
                            style={{ width: '100%', padding: '10px 10px 10px 36px', borderRadius: '8px', border: customApiKey ? '1px solid var(--g500)' : '1px solid var(--n200)', fontFamily: 'monospace', fontSize: '13px', background: '#fff', boxShadow: '0 2px 4px rgba(0,0,0,0.02)' }}
                          />
                          {customApiKey && <span style={{ position: 'absolute', right: '12px', top: '50%', transform: 'translateY(-50%)', color: 'var(--g500)' }}>✓</span>}
                        </div>
                      </div>
                      <a href="https://aistudio.google.com/app/apikey" target="_blank" rel="noreferrer" style={{ fontSize: '12px', color: 'var(--g600)', textDecoration: 'none', display: 'inline-flex', alignItems: 'center', gap: '4px', fontWeight: 600 }}>
                        [?] Cách lấy API Key miễn phí trong 1 phút ↗
                      </a>
                    </div>
                  )}
                </div>

                <label className="solution-toggle-label" style={{ marginTop: '12px' }}>
                  <input
                    type="checkbox"
                    checked={generateSolutions}
                    onChange={(e) => setGenerateSolutions(e.target.checked)}
                  />
                  💡 Tự động tạo lời giải từng bước bằng AI
                </label>
              </div>
              {progress > 0 && (
                <>
                  <div className="progress">
                    <i style={{ width: `${progress}%` }} />
                  </div>
                  <small>{status}</small>
                </>
              )}
              {error && <div className="error">{error}</div>}
              <div className="actions">
                <button
                  className="primary"
                  onClick={() => {
                    if (files.length === 0) {
                      dropzoneRef.current?.classList.add('pulse');
                      setTimeout(() => dropzoneRef.current?.classList.remove('pulse'), 800);
                      fileRef.current?.click();
                      return;
                    }
                    read();
                  }}
                >
                  {files.length > 1
                    ? `Tạo bài trình chiếu (${files.length} ảnh)`
                    : file
                    ? 'Tạo bài trình chiếu'
                    : '↥ Chọn tệp/ảnh để bắt đầu'}
                </button>
                <button onClick={openDemo}>Mở bài demo</button>
                {files.length > 0 && (
                  <button onClick={() => { setFiles([]); setProgress(0); }}>
                    Xóa và chọn lại
                  </button>
                )}
              </div>
              <p className="privacy">
                <label className="json-import">
                  Nhập file đã xuất (.json hoặc .zip)
                  <input hidden type="file" accept="application/json,.zip,application/zip" onChange={(e) => {
                    if (e.target.files?.[0]) importJson(e.target.files[0]);
                    e.target.value = "";
                  }} />
                </label>
              </p>
            </section>
          </div>

          {history.length > 0 && (
            <section className="history-panel" style={{ maxWidth: '800px', margin: '0 auto 40px', padding: '24px', background: '#fff', borderRadius: '24px', boxShadow: '0 4px 20px rgba(0,0,0,0.03)' }}>
              <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', marginBottom: '16px' }}>
                <h3 style={{ margin: 0, fontSize: '18px', color: 'var(--g700)', display: 'flex', alignItems: 'center', gap: '8px' }}>
                  <svg width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><path d="M3 3v18h18"/><path d="M18.7 8l-5.1 5.2-2.8-2.7L7 14.3"/></svg>
                  Thư viện bài giảng của bạn
                </h3>
              </div>
              <div style={{ display: 'grid', gap: '12px', maxHeight: '300px', overflowY: 'auto', paddingRight: '8px' }}>
                {history.map((entry) => (
                  <div key={entry.id} style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', padding: '12px 16px', border: '1px solid var(--n200)', borderRadius: '12px', background: '#fafafa', cursor: 'pointer', transition: 'all 0.2s' }} onClick={() => { setQuiz(entry.quiz); setSelected(entry.quiz.questions[0]?.id || ""); }}>
                    <div>
                      <h4 style={{ margin: 0, fontSize: '15px', color: 'var(--n800)' }}>{entry.title || "Bài giảng không tên"}</h4>
                      <small style={{ color: 'var(--n500)' }}>Lưu lúc {new Date(entry.savedAt).toLocaleString('vi-VN')} · {entry.quiz.questions.length} câu</small>
                    </div>
                    <button 
                      onClick={(e) => {
                        e.stopPropagation();
                        deleteFromHistory(entry.id).then(() => getHistory().then(setHistory));
                      }}
                      style={{ background: 'transparent', border: 'none', color: '#ef4444', padding: '6px', borderRadius: '8px', cursor: 'pointer' }}
                      title="Xóa khỏi thư viện"
                    >
                      <svg width="18" height="18" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round"><polyline points="3 6 5 6 21 6"></polyline><path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path></svg>
                    </button>
                  </div>
                ))}
              </div>
            </section>
          )}

          <LandingTabs 
            onOpenSample={openSample} 
            onDownloadSample={downloadSample} 
            visibleProfileIds={isAdmin || !subjectLocked ? undefined : visibleSampleProfileIds}
            showSupport={showSupport}
            onToggleSupport={() => setShowSupport(!showSupport)}
          />
        </main>
      ) : (
        <main className={`workspace ${sidebarCollapsed ? "sidebar-collapsed" : ""}`}>
          <aside className={`question-list ${sidebarCollapsed ? "collapsed" : ""}`}>
            <div className="side-title" style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', flexWrap: 'nowrap' }}>
              {!sidebarCollapsed && (
                <div style={{ overflow: 'hidden' }}>
                  <b style={{ whiteSpace: 'nowrap', textOverflow: 'ellipsis', overflow: 'hidden', display: 'block' }}>{quiz.title}</b>
                  <small>{quiz.profile?.label || "Toán THPT"} · {profileLevelLabel(getSubjectProfile(quiz.profile?.id), quiz.profile?.grade || "12")} · {quiz.questions.length} câu</small>
                </div>
              )}
              <button
                className="collapse-btn"
                type="button"
                onClick={() => setSidebarCollapsed(!sidebarCollapsed)}
                style={{ background: '#f1f5f9', border: '1px solid #cbd5e1', borderRadius: '8px', padding: '4px 8px', fontSize: '12px', fontWeight: 700, cursor: 'pointer', color: '#334155', marginLeft: sidebarCollapsed ? 'auto' : '0', flexShrink: 0 }}
                title={sidebarCollapsed ? "Mở rộng danh sách câu hỏi" : "Thu gọn danh sách câu hỏi để tăng diện tích làm việc"}
              >
                {sidebarCollapsed ? "▶ Mở" : "◀ Thu gọn"}
              </button>
            </div>
            {quiz.questions.map((q, i) => {
              const isAi = q.isAiGenerated;
              const answerStatus = questionAnswerStatus(q);
              return (
                <button
                  draggable
                  onDragStart={(e) => e.dataTransfer.setData("text/plain", q.id)}
                  onDragOver={(e) => {
                    e.preventDefault();
                    e.dataTransfer.dropEffect = "move";
                  }}
                  onDrop={(e) => dropOnQuestion(e, q.id, i)}
                  className={`${q.id === selected ? "active" : ""} ${isAi ? "ai-generated-item" : ""} ${answerStatus === "missing" ? "answer-missing" : ""}`}
                  onClick={() => setSelected(q.id)}
                  key={q.id}
                  style={isAi && q.id !== selected ? { background: '#f5f3ff', border: '1px solid #c084fc' } : undefined}
                  title={sidebarCollapsed ? `Câu ${q.number}${isAi ? " (AI Sáng Tạo)" : ""}: ${TYPE_LABELS[q.type]}` : undefined}
                >
                  <span style={isAi ? { background: '#9333ea', color: '#fff' } : undefined}>{q.number}</span>
                  {!sidebarCollapsed && (
                    <div style={{ flex: 1 }}>
                      <div style={{ display: 'flex', alignItems: 'center', justifyContent: 'space-between', width: '100%' }}>
                        <span>{TYPE_LABELS[q.type]}</span>
                        <span style={{ display: 'flex', gap: '3px' }}>
                          {q.groupId && <small style={{ background: '#dbeafe', color: '#1d4ed8', padding: '1px 5px', borderRadius: '4px', fontWeight: 800, fontSize: '10px' }} title="Câu thuộc một chùm dữ kiện">▣ Chùm</small>}
                          {isAi && <small style={{ background: '#f3e8ff', color: '#7e22ce', border: '1px solid #d8b4fe', padding: '1px 5px', borderRadius: '4px', fontWeight: 800, fontSize: '10px' }}>✨ AI</small>}
                        </span>
                      </div>
                      <small className="answer-status">
                        {q.warnings.length ? "⚠ Cần kiểm tra" : answerStatus === "ready" ? "✓ Có đáp án" : "○ Chưa có đáp án"}
                      </small>
                    </div>
                  )}
                </button>
              );
            })}
            {!sidebarCollapsed && (
              <button
                className="add"
                onClick={() =>
                  setQuiz({
                    ...quiz,
                    questions: [
                      ...quiz.questions,
                      blankQuestion(quiz.questions.length + 1),
                    ],
                  })
                }
              >
                ＋ Thêm câu
              </button>
            )}
            {!sidebarCollapsed && (
              <>
                <div className="list-actions">
                  <button
                    onClick={handleAiDuplicateQuestion}
                    disabled={aiGenerating}
                    style={{ background: 'linear-gradient(135deg, #ecfdf5 0%, #d1fae5 100%)', border: '1px solid #6ee7b7', color: '#047857', fontWeight: 800 }}
                    title="AI sẽ tự động sáng tạo ra 1 câu hỏi tương tự cùng dạng bài"
                  >
                    {aiGenerating ? '🤖 AI đang sáng tạo…' : '✨ AI Tạo câu tương tự'}
                  </button>
                  <button
                    onClick={() => {
                      const idx = quiz.questions.findIndex((x) => x.id === selected);
                      if (idx > 0) {
                        const questions = [...quiz.questions];
                        const temp = questions[idx];
                        questions[idx] = questions[idx - 1];
                        questions[idx - 1] = temp;
                        setQuiz({
                          ...quiz,
                          questions: questions.map((q, i) => ({ ...q, number: i + 1 })),
                        });
                      }
                    }}
                    title="Di chuyển câu lên trên"
                  >
                    ⬆ Lên
                  </button>
                  <button
                    onClick={() => {
                      const idx = quiz.questions.findIndex((x) => x.id === selected);
                      if (idx >= 0 && idx < quiz.questions.length - 1) {
                        const questions = [...quiz.questions];
                        const temp = questions[idx];
                        questions[idx] = questions[idx + 1];
                        questions[idx + 1] = temp;
                        setQuiz({
                          ...quiz,
                          questions: questions.map((q, i) => ({ ...q, number: i + 1 })),
                        });
                      }
                    }}
                    title="Di chuyển câu xuống dưới"
                  >
                    ⬇ Xuống
                  </button>
                  <button
                    onClick={() =>
                      setQuiz({
                        ...quiz,
                        questions: quiz.questions
                          .filter((x) => x.id !== selected)
                          .map((x, i) => ({ ...x, number: i + 1 })),
                        groups: (quiz.groups || []).map((group) => ({ ...group, questionIds: group.questionIds.filter((id) => id !== selected) })).filter((group) => group.questionIds.length > 0),
                        sections: (quiz.sections || []).map((section) => ({ ...section, questionIds: section.questionIds.filter((id) => id !== selected) })),
                      })
                    }
                    title="Xóa câu đang chọn"
                  >
                    🗑 Xóa
                  </button>
                </div>
                <div className="shuffle-actions" style={{ display: 'flex', gap: '6px', marginTop: '8px' }}>
                  <button
                    style={{ flex: 1, padding: '8px', fontSize: '11px', fontWeight: 700, borderRadius: '8px', border: '1px solid var(--line)', background: '#fff', cursor: 'pointer' }}
                    onClick={() => {
                      const shuffled = [...quiz.questions].sort(() => Math.random() - 0.5);
                      setQuiz({
                        ...quiz,
                        questions: shuffled.map((q, i) => ({ ...q, number: i + 1 })),
                      });
                    }}
                    title="Xáo trộn ngẫu nhiên thứ tự các câu hỏi"
                  >
                    🔀 Xáo câu hỏi
                  </button>
                  <button
                    style={{ flex: 1, padding: '8px', fontSize: '11px', fontWeight: 700, borderRadius: '8px', border: '1px solid var(--line)', background: '#fff', cursor: 'pointer' }}
                    onClick={() => {
                      setQuiz({
                        ...quiz,
                        questions: quiz.questions.map((q) => {
                          if (q.type !== 'single-choice' || !q.choices?.length) return q;
                          const choicesCopy = [...q.choices].sort(() => Math.random() - 0.5);
                          const relabeled = choicesCopy.map((c, i) => ({ ...c, label: 'ABCD'[i] || String.fromCharCode(65 + i) }));
                          return { ...q, choices: relabeled };
                        }),
                      });
                    }}
                    title="Xáo trộn vị trí các phương án A, B, C, D"
                  >
                    🔀 Xáo đáp án
                  </button>
                </div>
              </>
            )}
          </aside>
          <section className="editor">
            <div className="pane-head">
              <div>
                <small>BIÊN TẬP</small>
                <h2>
                  Câu {quiz.questions.find((x) => x.id === selected)?.number}
                </h2>
              </div>
              <button onClick={() => setQuiz(null)}>Nhập tài liệu khác</button>
            </div>
            <QuestionEditor quiz={quiz} setQuiz={setQuiz} selected={selected} onAiSolve={handleAiSolve} />
          </section>
          <aside className="preview">
            <div className="pane-head">
              <div>
                <small>XEM TRƯỚC TRỰC TIẾP</small>
                <b>16:9</b>
              </div>
              <button onClick={() => setPresent(true)}>⛶ Phóng to</button>
            </div>
            {quiz.questions.find((x) => x.id === selected) && (
              <div className="slide-preview">
                <QuestionPlayer
                  question={quiz.questions.find((x) => x.id === selected)!}
                  questionGroup={quiz.groups?.find((group) => group.id === quiz.questions.find((x) => x.id === selected)?.groupId)}
                  section={quiz.sections?.find((section) => section.id === quiz.questions.find((x) => x.id === selected)?.sectionId)}
                  profileId={quiz.profile?.id}
                />
              </div>
            )}
            {stats && (
              <div className="stats">
                {Object.entries(stats).map(([k, v]) => (
                  <span key={k}>
                    <b>{v}</b>
                    {
                      (
                        {
                          paragraphs: "đoạn",
                          images: "hình",
                          math: "công thức",
                          questions: "câu",
                          warnings: "cảnh báo",
                        } as Record<string, string>
                      )[k]
                    }
                  </span>
                ))}
              </div>
            )}
            {importMeta && (
              <div className="import-meta">
                <span>✔ Đã xử lý xong</span>
                <span>{importMeta.pages > 0 ? `${importMeta.pages} trang` : "Hoàn tất"}</span>
              </div>
            )}
            {quiz.warnings.length > 0 && (
              <details className="warnings">
                <summary>
                  Cảnh báo sau khi nhập ({quiz.warnings.length})
                </summary>
                {quiz.warnings.map((w) => (
                  <p key={w.id}>⚠ {w.message}</p>
                ))}
              </details>
            )}
          </aside>
        </main>
      )}
    </div>
  );
}
