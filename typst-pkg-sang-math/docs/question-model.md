# Structured question API (1.1)

`question(...)` creates a dictionary of content and optional teaching metadata. It does not render PDF or change counters. The student, teacher, and solution modes of `render-question(q, mode: ...)` use the existing exam layout and record answers in the legacy exam states, so `print-answer-key()` and `sang-omr-qr()` continue to work.

## Kinds and answers

| Kind | Required content | Answer options |
|---|---|---|
| `QUESTION_MC` (`"mcq"`) | `prompt`, nonempty `choices` | Mark one `choice(..., correct: true)` or use `answer("choice", one_based_index)` |
| `QUESTION_TF` (`"true-false"`) | `prompt`, nonempty `choices` | Mark each choice with `correct: true/false`, or provide a boolean tuple in `answer` |
| `QUESTION_SA` (`"short-answer"`) | `prompt` | `answer` can be text, content, a number, or a typed answer dictionary |
| `QUESTION_WRITTEN` (`"written-response"`) | `prompt` | Optional solution or rubric data |

`choice(content, correct: false, metadata: (:))` is the canonical choice format. `answer(kind, value, ..fields)` stores extensible typed answers, such as `answer("numeric", 3.14, tolerance: 0.001)`. PDF currently supports typed choice indices directly; specialized grading for numeric tolerance and rubrics is future work.

`solution` accepts legacy content or a tuple of `solution-step(content, title: none)` values. `hints` is a tuple of optional content and is not displayed in the PDF modes.

## Render modes

- `student`: question and answer space without correct-answer marks or solutions.
- `teacher`: question with correct-answer marks; no detailed solution.
- `solution`: answer marks and detailed solution.
- `answer-key`: one compact answer entry. Pass `num:` when a displayed number is wanted.

The PDF mode names are separate from the legacy `"dethi"`, `"loigiai"`, and `"solcolor"` macro modes. The old macros and `exam-preset` profile names are unchanged.

## Metadata and validation

All metadata is optional: `id`, `subject`, `grade`, `chapter`, `topic`, `difficulty`, `cognitive-level`, `tags`, `estimated-time`, `source`, `points`, and open `metadata: (:)`. Difficulty is an integer from 1 (very easy) to 5 (very hard). Suggested cognitive levels are `remember`, `understand`, `apply`, `analyze`, `evaluate`, and `create`.

`validate-question(q)` uses strict mode by default. It checks required prompts, supported kinds, choice structure, maximum six choices for the current PDF renderer, conflicting MCQ correct flags, out-of-range choice indices, nonnegative points, difficulty range, and metadata types. Errors include the question ID when available. Legacy macros call the validator in `legacy-compatible` mode to avoid rejecting historical documents.

## Banks and deterministic order

`question-bank(q1, q2, ...)` returns a tuple. `bank-filter(bank, grade:, topic:, difficulty:, kind:, tags:)` returns matching questions; difficulty can be a single value or tuple. `bank-select(bank, count:, seed:)` selects without replacement in reproducible order. `bank-shuffle-choices(q, seed:)` reorders a single question's choices and remaps a typed choice index.

The seed is an integer. The implementation uses a fixed Park–Miller generator so selection never depends on Typst's random state. Calling these functions does not reorder a legacy exam implicitly. If choices are shuffled, render the shuffled question and generate its answer key/OMR from that same rendering.

See [`../examples/question-bank-demo.typ`](../examples/question-bank-demo.typ) for a complete document and [`../MIGRATION.md`](../MIGRATION.md) for the 1.0.6 transition.
