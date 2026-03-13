# Math Workbook LaTeX Template

This repository is a minimal working example for the `workbook.cls` class.
It is organized as a small course repository with a main workbook, separate worksheet-style assignments, appendices, a sample image, and a bibliography file.

## Directory layout

```text
appendices/
  appendix1.tex
  appendix2.tex
assignments/
  assignment1.tex
  assignment2.tex
chapters/
  introduction.tex
  chapter1.tex
  chapter2.tex
images/
  sampleimage.png
main.tex
references.bib
workbook.cls
```

## What this template demonstrates

The sample files showcase the intended workbook workflow and exercise most user-facing commands from the class file, including:

- workbook mode via `main.tex`
- worksheet mode via the files in `assignments/`
- title metadata commands
- theorem-like environments
- warning / note / digression / proofskeleton blocks
- lecture-plan and staff-note blocks
- bibliography support
- representative math macros
- figure inclusion and cross-references

## Compile instructions

### Main workbook

From the repository root:

```bash
pdflatex main.tex
biber main
pdflatex main.tex
pdflatex main.tex
```

### Worksheet assignments

Each assignment is a standalone worksheet document. Compile from the repository root with:

```bash
pdflatex assignments/assignment1.tex
pdflatex assignments/assignment2.tex
```

Depending on your TeX setup, you may prefer to `cd` into the repository root and use your editor's standard build command.

## Notes

- `main.tex` includes the chapter and appendix files.
- The worksheet files under `assignments/` use the `worksheet` option and are compiled separately.
- The sample image lives in `images/sampleimage.png`.
- The bibliography file is `references.bib`.
- The class currently uses `biblatex` with `biber`.
- The template is intentionally small and pedagogically themed rather than visually exhaustive.

## Suggested GitHub usage

A reasonable workflow is:

1. Keep `workbook.cls` at the repository root.
2. Put lecture-note material in `chapters/` and `appendices/`.
3. Keep each worksheet or problem set as a standalone file in `assignments/`.
4. Build `main.tex` for the full workbook and compile assignment files individually as needed.

## License

See the class file header for license information.
