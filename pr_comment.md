Hi @saecki, sorry for missing the PR template initially! Here is the completely filled PR template with a detailed description of the package's capabilities and the explanation for the package name:

<!--
Thanks for submitting a package! Please read and follow the submission guidelines detailed in the repository's README and check the boxes below. Please name your PR as `name:version` of the submitted package.

If you want to make a PR for something other than a package submission, just delete all this and make a plain PR.
-->

I am submitting
- [x] a new package
- [ ] an update for a package

<!--
Please add a brief description of your package below and explain why you think it is useful to others. If this is an update, please briefly say what changed.
-->

**Description:** 
`sang-math` is a comprehensive toolkit and macro library designed primarily for typesetting high school mathematics (focusing on the Vietnamese educational curriculum - Toán THPT) and general mathematical documents. 

It provides not just macros, but **a complete suite of document templates** that users can invoke out-of-the-box:
1. **Exam Templates (`exam-preset`):** Highly customizable exam paper layouts featuring 18+ beautiful built-in color themes. It supports multiple output profiles from a single source file:
   - `profile: "dethi"`: Standard exam paper for students.
   - `profile: "loigiai"`: Exam paper with integrated step-by-step solutions and an automatically generated Answer Key table at the end.
   - `profile: "compact"`: Two-column layout for saving paper.
   - `profile: "draft"`: Adds a scratch workspace/drafting column next to each question.
   - `profile: "beamer"`: Strips out print headers/footers to seamlessly transition the content into presentation slides.
2. **Advanced Math Macros:** 
   - `bbtv2` / `bbbt`: Macros for beautifully rendering function variation tables (bảng biến thiên) effortlessly.
   - `bxd`: Macros for sign charts (bảng xét dấu).
   - Macros for typesetting Multiple-Choice Questions (`tn`) with customizable option labels (circles, hexagons, solid badges, etc.) and Essay/Short-answer questions (`tl`).
3. **Geometry:** Wrappers around CeTZ for drawing common geometric figures (e.g., standard triangles, cones, spheres).
4. **Math Symbols:** Convenient shortcuts for commonly used mathematical notations.

**Why it's useful:** 
It drastically reduces the boilerplate required for teachers, tutors, and content creators to typeset high-quality, professional-looking math exams, books, and study materials. It standardizes the workflow from writing exam drafts to creating final print materials and presentation slides.

**Package Name Explanation:** 
The package name `sang-math` combines my personal name (`sang` from Sang Nguyen) and the package's primary domain (`math`). It avoids generic or canonical names like `math-exam`, `vietnam-math`, or `high-school-math` while remaining clear about its purpose and identity, strictly adhering to the Typst package naming guidelines.

<!--
These things need to be checked for a new submission to be merged. If you're just submitting an update, you can delete the following section.
-->

I have read and followed the submission guidelines and, in particular, I
- [x] selected a name that isn't the most obvious or canonical name for what the package does
- [x] added a `typst.toml` file with all required keys
- [x] added a `README.md` with documentation for my package
- [x] have chosen a license and added a `LICENSE` file or linked one in my `README.md`
- [x] tested my package locally on my system and it worked
- [x] `exclude`d PDFs or README images, if any, but not the LICENSE

<!--
The following box only needs to be checked for **template** submissions. If you're submitting a package that isn't a template, you can delete the following section. See the guidelines section about licenses in the README for more details.
-->
- [x] ensured that my package is licensed such that users can use and distribute the contents of its template directory without restriction, after modifying them through normal use.
