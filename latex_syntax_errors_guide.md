# CAPE Review App — Guide to LaTeX Syntax Errors & Solutions

This document details all the LaTeX formatting errors, rendering bugs, and command syntax collisions identified across the CAPE examination question database (Paper 1 & Paper 2) and provides the exact fixes and regex patterns used to resolve them.

---

## Overview of Identified Errors

| # | Error Category | Sample Broken Syntax | Fixed Corrected Syntax | Affected Systems |
|---|---|---|---|---|
| **1** | **Unspaced Coefficients / Digits Before Commands** | `4\sqrt{x}`, `2\pi`, `4\cos x`, `2\mathbf{i}` | `4 \sqrt{x}`, `2 \pi`, `4 \cos x`, `2 \mathbf{i}` | KaTeX, LaTeXSwiftUI |
| **2** | **Unbracketed Arrow Subscripts in Limits** | `\lim_{x \to 3}`, `\lim_{n \to \infty}` | `\lim_{(x \to 3)}`, `\lim_{(n \to \infty)}` | KaTeX, LaTeXSwiftUI |
| **3** | **Unparenthesized Exponents in Inverse Functions** | `\cos^{-1}(\frac{x}{2})`, `\sin^{-1}(0.2)` | `\cos^{(-1)}(\frac{x}{2})`, `\sin^{(-1)}(0.2)` | LaTeXSwiftUI, Equation Parser |
| **4** | **Escaped Dollar Sign (`\$`) Delimiter Collision** | `collected \$6\,000 from clients` | Strip `\$` before math mode delimiter check | Mobile & Web Math Mode |
| **5** | **Plain Text Prose Wrapped in Math Delimiters** | `$Which of the following is correct?$` | Keep as plain text prose without `$ ... $` | Mobile Typography / Spacing |
| **6** | **Unspaced Chemical Formulas & Physical Units** | `\text{NH}_3\text{Cl}`, `27\,ms^{-1}` | `\text{NH}_3 \text{Cl}`, `27 \, \text{ms}^{(-1)}` | Chemistry & Physics Papers |

---

## Detailed Error Breakdown & Fix Guide

### 1. Unspaced Coefficients Before LaTeX Commands

#### The Problem
When numbers or coefficients are written directly attached to LaTeX commands without an intervening space (e.g. `4\sqrt`, `2\pi`, `4\cos`), equation parsers treat the digit and command as an invalid token or collapse text spacing.

#### Examples & Fixes
- ❌ **Broken**: `4\sqrt{5}`
  - ✅ **Fixed**: `4 \sqrt{5}`
- ❌ **Broken**: `2\pi r`
  - ✅ **Fixed**: `2 \pi r`
- ❌ **Broken**: `4\cos 5x`
  - ✅ **Fixed**: `4 \cos 5x`
- ❌ **Broken**: `2\mathbf{i} + 3\mathbf{j}`
  - ✅ **Fixed**: `2 \mathbf{i} + 3 \mathbf{j}`

#### Solution & Regex
```regex
Pattern: (\d)(\\+(?:log|ln|alpha|beta|theta|pi|gamma|sigma|mu|lambda|delta|omega|phi|psi|Phi|Theta|Pi|Sigma|Omega|Lambda|Delta|sin|cos|tan|sec|csc|cot|arcsin|arccos|arctan|sinh|cosh|tanh|sqrt|frac|lim|int|sum|prod|cdot|times|div|pm|mp|partial|infty))(?![a-zA-Z])
Replacement: $1 $2
```

---

### 2. Unbracketed Arrow Subscripts in Limits (`\lim_{x \to 3}`)

#### The Problem
In limit expressions e.g. `\lim_{x \to 3}` or `\lim_{n \to \infty}`, when the arrow expression inside the subscript `{x \to 3}` is not enclosed in parentheses `{(x \to 3)}`, iOS `LaTeXSwiftUI` fails equation mode parsing, leading to blank math blocks or raw string output.

#### Examples & Fixes
- ❌ **Broken**: `\lim_{x \to 3} \frac{x^2 - 9}{x - 3}`
  - ✅ **Fixed**: `\lim_{(x \to 3)} \frac{x^2 - 9}{x - 3}`
- ❌ **Broken**: `\lim_{n \to \infty} S_n`
  - ✅ **Fixed**: `\lim_{(n \to \infty)} S_n`
- ❌ **Broken**: `\lim_{x \rightarrow 1} \frac{x^2 - 3x + 2}{x^2 - 4x + 3}`
  - ✅ **Fixed**: `\lim_{(x \rightarrow 1)} \frac{x^2 - 3x + 2}{x^2 - 4x + 3}`

#### Solution & Regex
```regex
Pattern: \\(lim|min|max|sup|inf|sum|prod|int)_\{(?!\()([^()}]*\\(?:to|rightarrow)[^()}]*)\}
Replacement: \\$1_{($2)}
```

---

### 3. Unparenthesized Exponents in Inverse Functions (`\cos^{-1}`)

#### The Problem
Inverse trigonometric, hyperbolic, or logarithmic functions specified as `\cos^{-1}`, `\sin^{-1}`, `\tan^{-1}`, `\sec^{-1}`, etc., without parentheses around the negative exponent e.g. `\cos^{(-1)}`, fail in equation rendering modes or break superscript alignment.

#### Examples & Fixes
- ❌ **Broken**: `\frac{d}{dx} \cos^{-1} [ \frac{x}{2} ]`
  - ✅ **Fixed**: `\frac{d}{dx} \cos^{(-1)} [ \frac{x}{2} ]`
- ❌ **Broken**: `\theta = \sin^{-1}(0.2)`
  - ✅ **Fixed**: `\theta = \sin^{(-1)}(0.2)`
- ❌ **Broken**: `\tan^{-1}(3x)`
  - ✅ **Fixed**: `\tan^{(-1)}(3x)`

#### Solution & Regex
```regex
Pattern: \\(cos|sin|tan|sec|csc|cot|arcsin|arccos|arctan|sinh|cosh|tanh|ln|log)\^\{-(?!\()([^}]+)\}
Replacement: \\$1^{(-$2)}
```

---

### 4. Escaped Dollar Sign (`\$`) Currency Delimiter Collisions

#### The Problem
Currency amounts written with escaped dollar signs (e.g. `\$6\,000` or `\$150`) were falsely recognized by the equation renderer as LaTeX math mode delimiters `$ ... $`. This caused plain prose around currency values to be incorrectly parsed as TeX equations, removing all spaces between words.

#### Examples & Fixes
- ❌ **Broken**: `collected \$6\,000 from clients` (parsed as math mode `$6\,000 from clients$`, resulting in `collected6000fromclients`)
- ✅ **Fixed**: Strip `\$` before checking math mode delimiters so currency values stay in plain text mode.

#### Implementation (JavaScript & Swift)
```javascript
// Remove escaped \$ before checking if string contains math delimiters
const sNoEscDollar = s.replace(/\\\$/g, '');
const hasMathDelimiters = sNoEscDollar.includes('$') || s.includes('\\(') || s.includes('\\[');
```

---

### 5. Plain Prose Wrapped in Math Mode Delimiters

#### The Problem
Non-mathematical text wrapped inside `$ ... $` (e.g. `$Which of the following statements is true?$`) causes browsers and mobile UI frameworks to render normal English text in italicized math fonts with collapsed whitespace.

#### Solution
Ensure `$ ... $` wrappers are only applied when the string contains actual TeX constructs (`\cmd`, `_`, `^`, `{}`):

```swift
let isBareLatexCommand = s.hasPrefix("\\") || s.contains("^") || s.contains("_") || (s.contains("{") && s.contains("}"))
if isBareLatexCommand && !hasRealMathDelimiters {
    return "$\(s)$"
}
return s // Return plain text prose as-is
```

---

## Multi-Layer System Hardening

To ensure all questions display perfectly across all platforms, these fixes are enforced at **three distinct layers**:

1. **Database Layer (Cloudflare D1)**:
   - Seeded **287 fixed questions** in `fixed_questions` queue table for review and soft-overwrite.

2. **Web Admin Dashboard (`admin-ui/app.js`)**:
   - `cleanAndRenderLatex()` automatically applies all regex transformations on-the-fly when previewing questions.

3. **iOS Mobile App (`ReviewView.swift` & `FixedQuestionsReviewView.swift`)**:
   - `stripLaTeXWrapper()` automatically cleans digits, limit subscripts, and inverse exponents before passing strings to `LaTeXSwiftUI`.
