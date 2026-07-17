export function createReleasePreview(release) {
  if (!release || typeof release !== 'object' || Array.isArray(release)) {
    throw new Error('Bản phát hành xem trước không hợp lệ.');
  }
  const publicPackage = release.publicPackage;
  if (!publicPackage || typeof publicPackage !== 'object' || !Array.isArray(publicPackage.publicItems)) {
    throw new Error('Bản phát hành chưa có gói câu hỏi công khai.');
  }
  const counts = { tn: 0, ds: 0, tln: 0, tl: 0 };
  for (const item of publicPackage.publicItems) {
    if (Object.hasOwn(counts, item?.type)) counts[item.type] += 1;
  }
  // Deliberately project only release metadata and publicItems. Top-level
  // privatePackage/answerKey fields are ignored even if a malformed response
  // were ever supplied to this UI.
  return {
    id: String(release.id || ''),
    title: String(publicPackage.title || release.title || 'Đề chưa đặt tên'),
    description: String(publicPackage.description || release.description || ''),
    version: String(publicPackage.version || release.version || '1'),
    maximumScore: release.maximumScore,
    questionCount: publicPackage.publicItems.length,
    counts,
    publicItems: publicPackage.publicItems,
  };
}
