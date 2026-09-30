# 1.0.6 versus 1.1 compile-time check

Measured locally with Typst 0.14.2 on the same host and cached dependencies. The 1.0.6 files came from `git archive` of the pre-refactor commit; each document was compiled once to warm caches, then five times per version. Values are medians in seconds, so small differences should not be treated as stable speedups.

| Representative document | 1.0.6 | 1.1 | Change |
|---|---:|---:|---:|
| True/false styles | 0.843 | 0.812 | -3.7% |
| Book template | 0.724 | 0.709 | -2.1% |
| Graphics gallery | 0.750 | 0.728 | -2.9% |
| Responsive BBT | 0.873 | 0.883 | +1.1% |
| Mixed exam with two answer keys and OMR QR codes | 25.374 | 26.329 | +3.8% |

No measured case exceeded the 15–20% investigation threshold in the refactor plan. The QR-heavy result includes QR generation cost and therefore should not be read as isolated Question Model overhead. These timing observations apply only to the local 0.14.2 compiler and this host. The 1.1 release CI checks Typst 0.15.0 and 0.15.1 because Touying 0.8.0 requires 0.15.0.
