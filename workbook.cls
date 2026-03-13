% ============================================================
%  workbook.cls  —  Course Workbook / Problem Set class
%  Version 8.1  (2026/03/10)
%
%  Author:  Subhadip Chowdhury, PhD
%           University of Chicago, Dept. of Mathematics
%
%  License: CC BY-NC-SA 4.0
%           https://creativecommons.org/licenses/by-nc-sa/4.0/
%
%  Usage:
%    \documentclass{workbook}            % lecture-notes / workbook mode
%    \documentclass[worksheet]{workbook} % problem-set / handout mode
%
%  Do NOT load these packages in your document — they are already
%  loaded here: amsmath, amssymb, amsthm, hyperref, cleveref,
%  enumitem, tikz, pgfplots, mdframed, environ.
%
%  See the bottom of this file for a quick-reference list of all
%  user-facing commands and environments.
% ============================================================

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{workbook}[2026/03/10 Math Workbook Template]

\newif\ifworksheet
\DeclareOption{worksheet}{\worksheettrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[letterpaper,11pt,oneside]{book}

% === Remove extra blank pages introduced by the book class ===
\let\cleardoublepage=\clearpage

% === Default metadata ===
\gdef\@assignmentcourse{}
\gdef\@assignmenttitle{}
\gdef\@assignmentquarter{}
\gdef\@assignmentduedate{}
\gdef\@instructorname{}
\gdef\@coverimage{}
\gdef\@departmentlogo{}
\gdef\@coursenumber{}
\gdef\@coursename{}
\gdef\@coursequarter{}
\gdef\EpigraphText{}


% ============================================================
% Fonts
% ============================================================
%
% kpfonts options used:
%   frenchstyle     — upright lowercase Greek in math
%   partialup       — upright ∂ symbol
%   narrowiints     — narrower multiple integrals
%   nofligatures    — disable text ligatures
%   fullintlimits   — limits on integrals in display mode
%   fullsumlimits   — limits on sums in display mode
%   largesmallcaps  — larger small caps
%
% NOTE: kpfonts defines \D as the upright differential "d".
% Use \D (or the shorthands \dx, \dt, etc.) for differentials.

\RequirePackage[frenchstyle,narrowiints,nofligatures,partialup,fullintlimits,fullsumlimits,largesmallcaps]{kpfonts}
\linespread{1.05}
% \RequirePackage{adobeornaments}

% Title font
\RequirePackage{libris}
\renewcommand{\sfdefault}{yly}

\RequirePackage[scr]{rsfso}


% ============================================================
% Packages
% ============================================================

% ====== Graphics ======
\RequirePackage{graphicx, svg}
\RequirePackage{subcaption}
\RequirePackage{framed}
\RequirePackage{xcolor}
\RequirePackage{float}

% ====== TikZ ======
\RequirePackage{tikz, tkz-euclide,tikz-3dplot,pgfplots}
\usetikzlibrary{fit, shapes, positioning}
\usetikzlibrary{arrows.meta, automata, patterns, patterns.meta}
% decorations.pathmorphing supersedes the old 'snakes' library
\usetikzlibrary{decorations, decorations.pathmorphing, decorations.markings}
\usetikzlibrary{pgfplots.groupplots, calc, arrows}

\tikzset{
  jumpdot/.style={mark=*,solid},
  excl/.append style={jumpdot,fill=white},
  incl/.append style={jumpdot,fill=black},
}

\usepgfplotslibrary{fillbetween}
\pgfplotsset{compat=1.17}
\usepgfplotslibrary{polar}

\newcommand*{\longleadsto}[1]{%
  \raisebox{0.24em}{%
    \tikz \draw [->,
      line join=round,
      decorate,
      decoration={
        zigzag,
        segment length=4,
        amplitude=.9,
        post=lineto,
        post length=2pt
      }
    ] (0,0) -- (#1,0);%
  }%
}

% ======== Geometry ========
\RequirePackage[
  left=0.1\paperwidth,
  right=0.1\paperwidth,
  top=0.07\paperheight,
  bottom=0.08\paperheight,
  headsep=5pt
]{geometry}

% ======== Formatting ========
\RequirePackage{verbatim}
\RequirePackage{lipsum}
\RequirePackage{setspace}
\RequirePackage{microtype}
% \DisableLigatures{encoding = *, family = *}

\RequirePackage{siunitx}
\RequirePackage[textsize=tiny, textwidth=1in]{todonotes}
\RequirePackage{anyfontsize}
\RequirePackage{xhfill}

\RequirePackage{booktabs, longtable, array, multirow}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

\RequirePackage[export]{adjustbox}

\RequirePackage{soul} % \ul gives consistent underline height across fonts
\setuldepth{Berlin}

% ======== Fancy footnote ========

% Footnote symbol
\RequirePackage[symbol]{footmisc}
\renewcommand*{\thefootnote}{\fnsymbol{footnote}}

% ======== Fancy end-of-section line using pgf-ornaments ========
\RequirePackage[object=vectorian]{pgfornament}

\newcommand{\chapterline}[2]{%
	\nointerlineskip \vspace{.1\baselineskip}\hspace{\fill}
	{\resizebox{0.3\linewidth}{1ex}
		{\pgfornament[color = #1]{#2}
	}}%
	\hspace{\fill}
	\par\nointerlineskip \vspace{.1\baselineskip}
}


% ============================================================
% Colors
% ============================================================

\newcommand{\blue}{\color{blue!80!black}}

\definecolor{maroon}{rgb}{0.502,0,0}
\definecolor{lightterracotta}{RGB}{236,161,84}
\definecolor{lightgray}{HTML}{D9D9D9}
\definecolor{darkgray}{HTML}{737373}
\definecolor{lake}{rgb}{0,0.45,0.59}

\definecolor{lightgreen}{HTML}{edffed}
\definecolor{lightgreenmono}{HTML}{a8e6a8}
\definecolor{lightgreencomp}{HTML}{ffeded}

\definecolor{lightblue}{HTML}{edffff}
\definecolor{lightbluemono}{HTML}{a8e6e6}
\definecolor{lightbluecomp}{HTML}{fff2ed}

\newcommand{\maroon}{\color{maroon}}
\newcommand{\lake}{\color{lake}}


% ============================================================
% Math
% ============================================================

\RequirePackage{mathtools}
\RequirePackage{amsthm, amssymb}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ============================================================
% Title formatting
% ============================================================

\RequirePackage[explicit,toctitles,center,pagestyles]{titlesec}
% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before>}[<after>]

% === Chapter ===
\renewcommand{\chaptername}{Module}

\titleformat{\chapter}[block]
  {\centering}
  {\huge\bfseries\sffamily\scshape\color{maroon} \chaptername~\thechapter\;{\color{darkgray}\vrule width 2pt} {#1}}
  {0pt}
  {}
  [\chapterline{maroon}{88}\thispagestyle{empty}]

\titleformat{name=\chapter, numberless}[block]
  {\centering}
  {\huge\bfseries\sffamily\scshape\color{maroon} #1}
  {0pt}
  {}
  [\chapterline{maroon}{88}\thispagestyle{empty}]

\let\wb@origappendix\appendix
\renewcommand{\appendix}{%
  \wb@origappendix
  \renewcommand{\chaptername}{Appendix}%
}

\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}

% === Section ===
\fboxrule0.5pt\fboxsep3pt

\ifworksheet
  \renewcommand\thesection{\arabic{section}}
\else
  \renewcommand\thesection{\thechapter.\arabic{section}}
\fi

\titleformat{\section}{\sffamily\Large}{}{0pt}{\colorbox{lightterracotta}{\S\thesection~\textbf{#1}}}

% === Subsection ===
\titleformat{\subsection}{\large\sffamily}{}{0em}{\colorbox{lightterracotta}{\thesubsection~\textbf{#1}}}

% === Subsubsection ===
% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before>}[<after>]
\titleformat{\subsubsection}{\centering\sffamily}{}{0em}{\boxed{\textbf{#1}}}
\titlespacing{\subsubsection}{3pc}{*3}{*2}[3pc]

% ======== Bibliography ========
\RequirePackage[sorting=none, backend=biber, style=numeric]{biblatex}

% ======== Hyperref ========
\RequirePackage{hyperref}
\RequirePackage[nameinlink,noabbrev]{cleveref}
% \setcounter{secnumdepth}{4}

\hypersetup{
  colorlinks=true,       % false: boxed links; true: colored links
  linkcolor={blue},      % color of internal links (change box color with linkbordercolor)
  citecolor={green!50!black}, % color of links to bibliography
  filecolor=magenta,     % color of file links
  urlcolor=lake          % color of external links
}

% ======== Including PDFs ========
\RequirePackage{pdfpages}

% ======== Tables and lists ========

% multicol for multi-column layouts; array/booktabs already loaded above
\RequirePackage{multicol}

% C column type: fixed-width centred with line-break support
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash\hspace{0pt}}m{#1}}

\RequirePackage[inline]{enumitem}
\setlist[1]{labelindent=\parindent}
\setlist[itemize]{leftmargin=*}
\setlist[itemize,1]{label=$\bullet$}
\setlist[itemize,2]{label=$\sqcdot$}

\setlist[enumerate]{labelindent=\parindent, leftmargin=*}
\setlist[enumerate,1]{label = \textbf{(\alph*)}, ref = \thequestion.\alph*}
\setlist[enumerate,2]{label = \textbf{(\roman*)}, ref= \theenumii.\roman*}
\setlist[enumerate]{itemjoin={{ \hspace{10em} }}}

%%%%% Custom square bullet %%%
\DeclareFontFamily{U}{mathb}{}
\DeclareFontShape{U}{mathb}{m}{n}{
  <-5.5> mathb5
  <5.5-6.5> mathb6
  <6.5-7.5> mathb7
  <7.5-8.5> mathb8
  <8.5-9.5> mathb9
  <9.5-11.5> mathb10
  <11.5-> mathbb12
}{}

\DeclareRobustCommand{\sqcdot}{%
  \mathbin{\text{\usefont{U}{mathb}{m}{n}\symbol{"0D}}}%
}


% ============================================================
% Theorem-style environments
% ============================================================

\RequirePackage{environ}
\RequirePackage{etoolbox}
\RequirePackage[framemethod=TikZ]{mdframed}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solution — make solution invisible based on flag
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Usage:
% \begin{solution}
%   solution contents
% \end{solution}

\newif\ifsolution

\NewEnviron{solution}{%
  \ifsolution
    \begin{proof}[Solution]\blue\BODY\end{proof}%
  \fi
}
\renewcommand\qedsymbol{$\blacksquare$}


%%%%%%%%%%%%%%%%
% Proof — doesn't have a counter; needs label of theorem or proposition, etc.
%%%%%%%%%%%%%%%%

% Usage:
% \begin{prf}{label of theorem}
%   proof contents
% \end{prf}

\NewEnviron{prf}[2][]
{%
  \mdfsetup{%
    frametitle={%
      \tikz[baseline=(current bounding box.east),outer sep=0pt]
      \node[anchor=east,rectangle,fill=lightbluemono] {\strut Proof of~\cref{#2}.};
    },%
    innertopmargin=5pt,
    linecolor=lightbluemono,
    linewidth=2pt,
    topline=true,
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax%
  }%
  \begin{mdframed}\BODY\qed\end{mdframed}%
}


%%% -------------------------------------------------------
%%% Shared counter and display macro for all formal environments.
%%% theo, axiom, prop, claim, defn, exmpl all share ONE counter
%%% called `wbformal`. Questions use a separate counter `question`.
%%% -------------------------------------------------------

\newcounter{wbformal}
\setcounter{wbformal}{0}

% \wb@num — the formatted number label used in all environment titles.
% In workbook mode it expands to chapter.section.counter (e.g. "22.1.3").
% In worksheet mode it expands to section.counter (e.g. "1.3").
\newcommand{\wb@num}{%
  \ifworksheet
    \arabic{section}.\arabic{wbformal}%
  \else
    \thechapter.\arabic{section}.\arabic{wbformal}%
  \fi
}

% -------------------------------------------------------
% Internal helpers — not for direct use in documents.
%
% \wb@frametitle{shape}{fillcolor}{display text}
%   Builds the TikZ node used as an mdframed frametitle.
%   shape     = rectangle | rounded rectangle
%   fillcolor = e.g. lightbluecomp, lightgreencomp
%   text      = the full label string, e.g. "Theorem 22.1.3: Title"
% -------------------------------------------------------
\newcommand{\wb@frametitle}[3]{%
  \tikz[baseline=(current bounding box.east),outer sep=0pt]
  \node[anchor=east,#1,fill=#2]{\strut #3};%
}

% \wb@bluestyle — common mdframed settings for blue-family boxes
% (theo, axiom, prop, claim)
\newcommand{\wb@bluestyle}{%
  \mdfsetup{%
    innertopmargin=5pt,
    linecolor=lightbluemono,
    linewidth=2pt,
    topline=true,
    backgroundcolor=lightblue,
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax
  }%
}

% \wb@greenstyle{extra key=val,...} — common settings for green-family
% boxes (defn, exmpl). Pass any environment-specific overrides as #1.
\newcommand{\wb@greenstyle}[1]{%
  \mdfsetup{%
    innertopmargin=5pt,
    linecolor=lightgreenmono,
    linewidth=2pt,
    topline=true,
    frametitleaboveskip=\dimexpr-\ht\strutbox\relax,
    #1%
  }%
}


% -------------------------------------------------------
% Exercise (Question) environment — separate counter
% -------------------------------------------------------
%
% Usage:
%   \begin{exercise}[optional margin tag]
%     Question text
%   \end{exercise}
%
% Renders as: ■ Question N. (maroon, bold) with body in italics.
% Optional argument appears in a box at the right margin
% (useful for difficulty labels or Spivak problem references).

\newcounter{question}
\NewEnviron{exercise}[1][]
{%
  \refstepcounter{question}%
  {\paragraph{}%
   \maroon\large\bfseries\hspace{-2em}$\blacksquare$~\othertailQ uestion~\thequestion.%
   \hfill\fbox{#1}}\\[0.5em]
  {\itshape\BODY}%
}

\crefname{question}{question}{questions}


% -------------------------------------------------------
% Theorem — blue framed box, italic body, rectangle title node
% -------------------------------------------------------
%
% Usage:
%   \begin{theo}[Optional Title]{theo:labelname}
%     Statement of the theorem.
%   \end{theo}

\NewEnviron{theo}[2][]
{%
  \refstepcounter{wbformal}%
  \ifstrempty{#1}%
    {\mdfsetup{frametitle={\wb@frametitle{rectangle}{lightbluecomp}{Theorem~\wb@num}}}}%
    {\mdfsetup{frametitle={\wb@frametitle{rectangle}{lightbluecomp}{Theorem~\wb@num:~#1}}}}%
  \wb@bluestyle
  \begin{mdframed}\label[theorem]{#2}{\itshape\BODY}\end{mdframed}%
}

\crefname{theorem}{theorem}{theorems}


% -------------------------------------------------------
% Axiom — blue framed box, italic body, rounded rectangle title node
% -------------------------------------------------------
%
% Usage:
%   \begin{axiom}[Optional Title]{axiom:labelname}
%     Statement of the axiom.
%   \end{axiom}

\NewEnviron{axiom}[2][]
{%
  \refstepcounter{wbformal}%
  \ifstrempty{#1}%
    {\mdfsetup{frametitle={\wb@frametitle{rounded rectangle}{lightbluecomp}{Axiom~\wb@num}}}}%
    {\mdfsetup{frametitle={\wb@frametitle{rounded rectangle}{lightbluecomp}{Axiom~\wb@num:~#1}}}}%
  \wb@bluestyle
  \begin{mdframed}\label[axiom]{#2}{\itshape\BODY}\end{mdframed}%
}

\crefname{axiom}{axiom}{axioms}


% -------------------------------------------------------
% Proposition — blue framed box, italic body, rounded rectangle title
% -------------------------------------------------------
%
% Usage:
%   \begin{prop}[Optional Title]{prop:labelname}
%     Statement of the proposition.
%   \end{prop}

\NewEnviron{prop}[2][]
{%
  \refstepcounter{wbformal}%
  \ifstrempty{#1}%
    {\mdfsetup{frametitle={\wb@frametitle{rounded rectangle}{lightbluecomp}{Proposition~\wb@num}}}}%
    {\mdfsetup{frametitle={\wb@frametitle{rounded rectangle}{lightbluecomp}{Proposition~\wb@num:~#1}}}}%
  \wb@bluestyle
  \begin{mdframed}\label[proposition]{#2}{\itshape\BODY}\end{mdframed}%
}

\crefname{proposition}{proposition}{propositions}


% -------------------------------------------------------
% Claim — blue framed box, italic body, rounded rectangle title
% -------------------------------------------------------
%
% Usage:
%   \begin{claim}[Optional Title]{claim:labelname}
%     Claim body.
%   \end{claim}

\NewEnviron{claim}[2][]
{%
  \refstepcounter{wbformal}%
  \ifstrempty{#1}%
    {\mdfsetup{frametitle={\wb@frametitle{rounded rectangle}{lightbluecomp}{Claim~\wb@num}}}}%
    {\mdfsetup{frametitle={\wb@frametitle{rounded rectangle}{lightbluecomp}{Claim~\wb@num:~#1}}}}%
  \wb@bluestyle
  \begin{mdframed}\label[claim]{#2}{\itshape\BODY}\end{mdframed}%
}

\crefname{claim}{claim}{claims}


% -------------------------------------------------------
% Definition — green framed box, upright body, rectangle title node
% -------------------------------------------------------
%
% Usage:
%   \begin{defn}[Optional Title]{defn:labelname}
%     Definition body.
%   \end{defn}

\NewEnviron{defn}[2][]
{%
  \refstepcounter{wbformal}%
  \ifstrempty{#1}%
    {\mdfsetup{frametitle={\wb@frametitle{rectangle}{lightgreencomp}{Definition~\wb@num}}}}%
    {\mdfsetup{frametitle={\wb@frametitle{rectangle}{lightgreencomp}{Definition~\wb@num:~#1}}}}%
  \wb@greenstyle{backgroundcolor=lightgreen, innerrightmargin=1em}%
  \begin{mdframed}\label[definition]{#2}\BODY\end{mdframed}%
}

\crefname{definition}{definition}{definitions}


% -------------------------------------------------------
% Example — green bordered box (no fill), upright body, rectangle title
% -------------------------------------------------------
%
% Usage:
%   \begin{exmpl}[Optional Title]{exmpl:labelname}
%     Example body.
%   \end{exmpl}

\NewEnviron{exmpl}[2][]
{%
  \refstepcounter{wbformal}%
  \ifstrempty{#1}%
    {\mdfsetup{frametitle={\wb@frametitle{rectangle}{lightgreencomp}{Example~\wb@num}}}}%
    {\mdfsetup{frametitle={\wb@frametitle{rectangle}{lightgreencomp}{Example~\wb@num:~#1}}}}%
  \wb@greenstyle{innerleftmargin=1em, innerrightmargin=1em}%
  \begin{mdframed}\label[example]{#2}\BODY\end{mdframed}%
}

\crefname{example}{example}{examples}


%%%%%%%%%%%%%%%%
% Warning
%%%%%%%%%%%%%%%%

% Usage:
% \begin{warning}[optional title, defaults to Warning:]
%   warning contents
% \end{warning}

\RequirePackage{fontawesome}

\tikzset{
  warningsymbol/.style={
    rectangle,
    draw=red,
    fill=white,
    scale=1,
    overlay
  }
}

\mdfdefinestyle{warning}{%
  hidealllines=true,
  leftline=true,
  skipabove=12,
  skipbelow=12pt,
  innertopmargin=0.4em,
  innerbottommargin=0.4em,
  innerrightmargin=0.7em,
  rightmargin=0.7em,
  innerleftmargin=1.7em,
  leftmargin=0.7em,
  middlelinewidth=.2em,
  linecolor=red,
  fontcolor=red!70!black,
  firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
    node[warningsymbol] {\faWarning};},
  secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
    node[warningsymbol] {\faWarning};},
  middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
    node[warningsymbol] {\faWarning};},
  singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
    node[warningsymbol] {\faWarning};},
}

\NewEnviron{warning}[1][Warning:]{%
  \begin{mdframed}[style=warning]
    \noindent{\textbf{#1}} \BODY
  \end{mdframed}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exploration activity
%%%%%%%%%%%%%%%%%%%%%%%%%

% Usage:
% \begin{digression}
%   digression contents
% \end{digression}

% (calc and arrows loaded earlier with the rest of the TikZ libraries)
\tikzset{
  excursus arrow/.style={
    line width=2pt,
    draw=darkgray,
    rounded corners=2ex,
  },
  excursus head/.style={
    fill=white,
    font=\bfseries\scshape,
    text=darkgray,
    anchor=base west,
  },
}

\mdfdefinestyle{digressionarrows}{%
  singleextra={%
    \path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
    \path let \p1=(Q), \p2=(O) in (\x1,{(\y1-\y2)/2}) coordinate (M);
    \path [excursus arrow, round cap-to]
      ($(O)+(5em,0ex)$) -| (M) |- %
      ($(Q)+(12em,0ex)$) .. controls +(0:16em) and +(185:6em) .. %
      ++(23em,2ex);
    \node [excursus head] at ($(Q)+(2.5em,-0.75pt)$) {Digression};
  },
  firstextra={%
    \path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
    \path [excursus arrow,-to]
      (O) |- %
      ($(Q)+(12em,0ex)$) .. controls +(0:16em) and +(185:6em) .. %
      ++(23em,2ex);
    \node [excursus head] at ($(Q)+(2.5em,-2pt)$) {Digression};
  },
  secondextra={%
    \path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
    \path [excursus arrow,round cap-]
      ($(O)+(5em,0ex)$) -| (Q);
  },
  middleextra={%
    \path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
    \path [excursus arrow]
      (O) -- (Q);
  },
  middlelinewidth=2.5em,
  middlelinecolor=white,
  hidealllines=true,
  topline=true,
  innertopmargin=0.5ex,
  innerbottommargin=2.5ex,
  innerrightmargin=2pt,
  innerleftmargin=2ex,
  skipabove=0.87\baselineskip,
  skipbelow=0.62\baselineskip,
}

\NewEnviron{digression}{\begin{mdframed}[style=digressionarrows] \BODY \end{mdframed}}


%%%%%%%%%%%%%%%%
% Command-line environment
%%%%%%%%%%%%%%%%

% Usage:
% \begin{code}{Language}
%   $ ls
%
%   Applications Desktop ...
% \end{code}

\RequirePackage{listings}

\lstnewenvironment{code}[1]
{%
  \mdfsetup{%
    leftmargin=10pt,
    rightmargin=10pt,
    innerleftmargin=15pt,
    middlelinecolor=black!50,
    middlelinewidth=1pt,
    frametitlerule=false,
    backgroundcolor=black!5,
    frametitle={Code:},
    frametitlefont={\normalfont\scshape\color{white}\hspace{-1em}},
    frametitlebackgroundcolor=black!50,
    nobreak,
  }%
  \mdframed%
  \lstset{%
    mathescape,
    % backgroundcolor=\color{black!5},
    commentstyle=\color{cyan},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{black!50},
    stringstyle=\color{magenta},
    basicstyle=\ttfamily,
    breakatwhitespace=false,
    breaklines=true,
    keepspaces=true,
    language={#1},
    numbers=none,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
  }%
}
{\vspace{-0.75em}\endmdframed}


%%%%%%%%%%%%%%%%%%%%%%
% Note
%%%%%%%%%%%%%%%%%%%%%%

\mdfdefinestyle{note}{%
  hidealllines=true,
  leftline=true,
  skipabove=12,
  skipbelow=12pt,
  innertopmargin=0.4em,
  innerbottommargin=0.4em,
  innerrightmargin=0.5em,
  innerleftmargin=0.5em,
  middlelinewidth=.2em,
  linecolor=red,
  backgroundcolor=black!5,
}

\NewEnviron{note}[1][Note:]{%
  \begin{mdframed}[style=note]
    \noindent{\textbf{#1}} \BODY
  \end{mdframed}%
}

% =====================================


%%%%%%%%%%%%%%%%%%%%%%
% Proof skeleton
%%%%%%%%%%%%%%%%%%%%%%

\mdfdefinestyle{proofskeleton}{%
  hidealllines=true,
  skipabove=12pt,
  skipbelow=12pt,
  innermargin=20pt,
  outermargin=20pt,
  innertopmargin=0.4em,
  innerbottommargin=0.4em,
  innerrightmargin=0.5em,
  innerleftmargin=0.5em,
  backgroundcolor=black!5,
}

\NewEnviron{proofskeleton}{%
  \begin{mdframed}[style=proofskeleton]
    \BODY
  \end{mdframed}%
}

% =====================================


% ==============================
% Lecture Plan / Instructor Metacommentary
% ==============================
%
% Usage:
%   \begin{lectureplan}[Lecture 1 --- Mon.\ March 23]
%     \planhead{Learning Objectives}
%     ...
%     \planhead{Timing (50 min)}
%     ...
%   \end{lectureplan}
%
%   \begin{staffnote}[Optional label]
%     inline instructor annotation
%   \end{staffnote}
%
% Toggle: add \showplanfalse before \begin{document} to suppress all
% plan/note blocks in the student-facing copy. Default is \showplantrue.
% ==============================

\newif\ifshowplan
\showplantrue

% Colors (purple-slate, distinct from all existing environments)
\definecolor{plancolor}{RGB}{90,60,130}
\definecolor{planlight}{RGB}{248,244,255}

% \planhead{Section label} — bold subheading inside a lectureplan block
\newcommand{\planhead}[1]{%
  \medskip\noindent{\color{plancolor}\bfseries\scshape #1}%
  \par\nobreak\smallskip\noindent\ignorespaces
}

% Full lecture-plan block
\mdfdefinestyle{lectureplan}{%
  hidealllines=true,
  leftline=true,
  skipabove=16pt,
  skipbelow=16pt,
  innertopmargin=0.8em,
  innerbottommargin=0.9em,
  innerrightmargin=1em,
  innerleftmargin=1em,
  middlelinewidth=0.3em,
  linecolor=plancolor,
  backgroundcolor=planlight,
}

\NewEnviron{lectureplan}[1][]{%
  \ifshowplan
    \begin{mdframed}[style=lectureplan]%
      \noindent{\color{plancolor}\large\bfseries\scshape
        \faCalendar\enspace Lecture Plan%
        \ifstrempty{#1}{}{\enspace\textendash\enspace #1}}%
      \par\nobreak\vspace{0.3em}%
      \noindent{\color{plancolor!40}\rule{\linewidth}{0.5pt}}%
      \par\smallskip
      {\color{plancolor!85!black}\small\BODY}%
    \end{mdframed}%
  \fi
}

% Compact inline instructor annotation
\mdfdefinestyle{staffnote}{%
  hidealllines=true,
  leftline=true,
  skipabove=8pt,
  skipbelow=8pt,
  innertopmargin=0.3em,
  innerbottommargin=0.35em,
  innerrightmargin=0.6em,
  innerleftmargin=0.65em,
  middlelinewidth=0.18em,
  linecolor=plancolor!55,
  backgroundcolor=planlight!65,
}

\NewEnviron{staffnote}[1][Instructor note:]{%
  \ifshowplan
    \begin{mdframed}[style=staffnote]%
      {\color{plancolor}\bfseries\small #1}\enspace
      {\color{plancolor!80!black}\small\BODY}%
    \end{mdframed}%
  \fi
}

% =====================================


% ============================================================
% Title pages and front/end matter
% ============================================================

% ================== Title page for worksheet ==================
\ifworksheet

%%%%%%%%%%%%%%%%%%% Beginning of worksheet-specific pages %%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{%
  \begin{center}
    {\maroon\Huge\scshape \@assignmentcourse}
    \vspace{1em}

    {\scshape\huge \@assignmenttitle}
  \end{center}
  \vspace{-0.5em}
  \noindent\hrulefill

  \vspace{-0.5em}
  \noindent{\bfseries\large\@assignmentquarter\hfill \@instructorname}

  % \hspace{10.5em}\@instructorname
  \vspace{-1em}
  \noindent\hrulefill
  \thispagestyle{empty}
}

\newcommand{\assignmenttitle}[1]{%
  \gdef\@assignmenttitle{#1}}

\newcommand{\assignmentcourse}[1]{%
  \gdef\@assignmentcourse{#1}}

\newcommand{\assignmentsemester}[1]{%
  \gdef\@assignmentquarter{#1}}

\newcommand{\assignmentduedate}[1]{%
  \gdef\@assignmentduedate{#1}}

% \instructorname is defined outside the \ifworksheet conditional
% (see below) since it is needed in both modes.

%%%%%% End of worksheet-specific pages %%%%%%%%%

\else

%%%%%%%%%%%%%%%%%%% Beginning of workbook-specific pages %%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Title page for workbook %%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{%
  \begin{center}
    \ifx\@coverimage\@empty\else
      {\includegraphics[width=0.5\textwidth]{\@coverimage}\par}
      \vspace{1cm}
    \fi
    {\Huge\bfseries \@coursename \par}
    \vspace{2cm}
    {\scshape\huge \@coursenumber~Lecture notes\par}
    \vspace{1.5cm}

    {\Large \@instructorname, PhD \par}
    \vfill

    % Bottom of the page
    \ifx\@departmentlogo\@empty\else
      {\includegraphics[width=0.5\textwidth]{\@departmentlogo}\par}
      \vspace{1cm}
    \fi
    {\Large \@coursequarter\par}
  \end{center}
  \thispagestyle{empty}
}

\newcommand{\coverimage}[1]{%
  \gdef\@coverimage{#1}}

% Compatibility shim: currently unused by the class.
\newcommand{\department}[1]{}

\newcommand{\departmentlogo}[1]{%
  \gdef\@departmentlogo{#1}}

\newcommand{\coursenumber}[1]{%
  \gdef\@coursenumber{#1}}

\newcommand{\coursename}[1]{%
  \gdef\@coursename{#1}}

\newcommand{\coursequarter}[1]{%
  \gdef\@coursequarter{#1}}

% \instructorname is defined after \fi (shared between both modes)


%%%%%%% Frontmatter %%%%%%%%%%%%%%%%%%%%%%%%%%%
% Special front matter that appears before the table of contents
\newcommand{\PreTOCMatter}[1]{%
  \thispagestyle{empty}
  \vspace*{\fill}
  \begin{center}
    #1
  \end{center}
  \vspace*{\fill}
}

% Preliminary sections following the table of contents and preceding the body are front matter
\newcommand{\FrontMatter}[1]{%
  \chapter*{#1}
  \addcontentsline{toc}{chapter}{#1}
}

% Epigraph
% \epigraph{epigraph text}
\newcommand{\epigraph}[1]{\gdef\EpigraphText{#1}}
\newcommand{\makeepigraph}{\PreTOCMatter{\EpigraphText}}


%%%%%% Endmatter %%%%%%%%%%%%%%%%%%%%%%%%
% Bibliography
\newcommand{\makebibliography}{%
  \newpage
  \begin{singlespace}
    \printbibliography[heading=bibintoc,title={References}]
  \end{singlespace}
}

%%%%%% End of workbook-specific pages %%%%%%%%%

\fi % End of ifworksheet

% \instructorname is shared by both modes — define it once here.
\newcommand{\instructorname}[1]{\gdef\@instructorname{#1}}


% ============================================================
% Header and footer
% ============================================================

\RequirePackage{fancyhdr}
\setlength{\headheight}{13.59999pt}
\pagestyle{fancy}
\fancyhf{}

\ifworksheet
  \lhead{\textcolor{darkgray}{\bfseries \@assignmentduedate}}
  \rhead{\textcolor{darkgray}{\bfseries \@instructorname}}
\else
  \lhead{\textcolor{darkgray}{\bfseries \@coursenumber}}
  \rhead{\textcolor{darkgray}{\bfseries \@instructorname}}
\fi

\chead{\textcolor{darkgray}{\bfseries \textendash\;\thepage\;\textendash}}
\lfoot{}
\rfoot{}
\cfoot{}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% === Somehow moving this above breaks things ====??? ====
\RequirePackage{parskip}
















% ============================================================
% Optional extra packages
% Remove any of these if they are not needed for a specific course.
% ============================================================

\RequirePackage{venndiagram}  % Venn diagrams
\RequirePackage{cancel}       % \cancel{}, \bcancel{} for crossing out
\RequirePackage{bigints}      % larger integral signs


% ============================================================
% Math shortcut commands
% ============================================================

% kpfonts redefines \D as the upright differential "d".
% We follow that convention throughout: use \dx, \dt, etc. for differentials.

% --- Greek letter remappings ---
% kpfonts already provides curly variants; these ensure \phi and \epsilon
% always render as the curly forms φ and ε.
\renewcommand{\phi}{\varphi}
\renewcommand{\epsilon}{\varepsilon}

% --- Delimiter shorthands ---
\newcommand{\la}{\left\langle}
\newcommand{\ra}{\right\rangle}
\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}

% --- Miscellaneous math shorthands ---
\newcommand{\vf}[1]{\frac{1}{#1}}          % reciprocal: \vf{n} = 1/n
\newcommand{\X}{\times}                    % cross product / Cartesian product
\newcommand{\rh}{\rightharpoonup}          % weak convergence arrow
\newcommand{\xrh}{\stackrel{*}{\rightharpoonup}} % weak-* convergence
\newcommand{\blank}{\hspace{10pt}}         % short horizontal blank
\newcommand{\tripnorm}{\|\hspace{-1pt}|}  % triple norm |||·|||
\newcommand{\suchthat}{\;\ifnum\currentgrouptype=16 \middle\fi|\;} % | in set-builder

% --- Calculus operators ---
\newcommand{\cis}{\textup{c}i\textup{s }} % cis(θ) = cos θ + i sin θ
\renewcommand{\d}{\partial}                % \d = ∂ (partial derivative)
\newcommand{\grad}{\nabla}                 % gradient

% --- Derivatives (display-style fractions) ---
% \D is the upright "d" from kpfonts (used for ordinary differentials).
\newcommand{\ddx}{\dfrac{\D}{\D x}}
\newcommand{\ddy}{\dfrac{\D}{\D y}}
\newcommand{\ddt}{\dfrac{\D}{\D t}}

% --- Differential one-forms (\D = upright d from kpfonts) ---
\newcommand{\dx}{\D x}
\newcommand{\df}{\D f}
\newcommand{\dt}{\D t}
\newcommand{\dr}{\D r}
\newcommand{\du}{\D u}
\newcommand{\dv}{\D v}
\newcommand{\dz}{\D z}
\newcommand{\dy}{\D y}
\newcommand{\ds}{\D s}
\newcommand{\dA}{\D A}
\newcommand{\dV}{\D V}
\newcommand{\dtheta}{\D \theta}
\newcommand{\dsigma}{\D \sigma}

% --- Common derivative ratios ---
\newcommand{\dydx}{\dfrac{\dy}{\dx}}
\newcommand{\dxdt}{\dfrac{\dx}{\dt}}
\newcommand{\dydt}{\dfrac{\dy}{\dt}}
\newcommand{\dzdt}{\dfrac{\dz}{\dt}}
\newcommand{\dPdt}{\dfrac{\D P}{\dt}}
\newcommand{\dfdx}{\dfrac{\df}{\dx}}
\newcommand{\dvRdt}{\dfrac{\D\vec{R}}{\dt}}

% --- Display-style large operators ---
\newcommand{\dint}{\displaystyle\int}
\newcommand{\doint}{\displaystyle\oint}
\newcommand{\diint}{\displaystyle\iint}
\newcommand{\diiint}{\displaystyle\iiint}
\newcommand{\dlim}{\lim\limits}
\newcommand{\dsum}{\displaystyle\sum}

% --- Analysis / evaluation ---
\newcommand{\eval}{\biggr|}                % evaluation bar: F(x)\eval_a^b
\renewcommand{\bar}{\overline}             % \bar{A} = \overline{A}

% --- Number sets (blackboard bold) ---
\newcommand{\R}{\mathbb{R}}
\newcommand{\C}{\mathbb{C}}
\newcommand{\F}{\mathbb{F}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\U}{\mathscr{U}}    % open covers, ultrafilters, etc.
\renewcommand{\u}{\mathfrak{u}} % Lie algebra element

% Number ring/field extensions (algebra)
\newcommand{\Zroot}[1]{\mathbb{Z}[\sqrt{#1}]}
\newcommand{\Qroot}[1]{\mathbb{Q}(\sqrt{#1})}
\newcommand{\A}{\mathbf{A}}

% --- Math operators ---
\DeclareMathOperator{\tr}{tr}
\DeclareMathOperator{\Int}{Int}
\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccot}{arccot}
\DeclareMathOperator{\arccsc}{arccsc}
\DeclareMathOperator{\charpoly}{charpoly}
\DeclareMathOperator{\lcm}{lcm}
\DeclareMathOperator\Dom{Dom}
\DeclareMathOperator\Rng{Rng}
\DeclareMathOperator\Codom{Codom}
\DeclareMathOperator\Col{Col}
\DeclareMathOperator{\Nul}{Nul}
\DeclareMathOperator{\rank}{rank}
\DeclareMathOperator{\spn}{span}
\DeclareMathOperator{\proj}{proj}
\DeclareMathOperator{\Row}{Row}
\DeclareMathOperator{\erf}{erf}
\DeclareMathOperator{\diag}{diag}
\DeclareMathOperator{\Proj}{Proj}
\DeclareMathOperator{\curl}{curl}
\DeclareMathOperator{\mydiv}{div}

% --- Transforms (Laplace) ---
\renewcommand{\L}[1]{\mathscr{L}\left[#1\right]}
\newcommand{\Linv}[1]{\mathscr{L}^{-1}\left[#1\right]}

% --- Relation negation shorthands (discrete math / set theory) ---
\newcommand\notR{\cancel{R}}
\newcommand\notS{\cancel{S}}

% --- Miscellaneous ---
\newcommand{\lhequal}{%
  \stackrel{\stackrel{\tikz\node[draw,shape=circle,inner sep=0pt]{\strut L};}{\downarrow}}{=\joinrel=}}
% L'Hôpital equals sign

% --- Vertical spacing for student work areas ---
\newcommand{\myskip}{\vspace{3em}}    % large
\newcommand{\mysskip}{\vspace{2em}}   % medium
\newcommand{\myssskip}{\vspace{1em}}  % small

% --- Fill-in-the-blank rule (extends to right margin) ---
\newcommand{\blankfill}{\xrfill[-1em]{0.5pt}[darkgray]}

% --- Inline solution toggle ---
% \tsol{answer} renders green (visible) when \solutiontrue, white (invisible) otherwise.
% Useful for producing student and instructor versions from one source.
\ifsolution
  \newcommand{\tsol}[1]{\textcolor{green}{#1}}
\else
  \newcommand{\tsol}[1]{\textcolor{white}{#1}}
\fi

% --- Emphasis ---
\newcommand{\alert}[1]{{\maroon\bfseries{#1}}} % maroon bold


% ============================================================
% Vectors (esvect + bm)
% ============================================================
\newcommand\bmmax{0}
\newcommand\hmmax{0}
\RequirePackage{esvect, bm}

% \vec{v} — bold italic v with arrow (esvect \vv + bm)
\renewcommand{\vec}[1]{\vv{\bm{{#1}}}}

% \uvec{v} — bold unit vector with hat
\newcommand{\uvec}[1]{\hat{\bm{{#1}}}}


% ============================================================
% Calligraphic / special letter overrides
% ============================================================

\renewcommand{\P}{\mathcal{P}} % power set, partition
\renewcommand{\O}{\mathcal{O}} % big-O notation


% ============================================================
% Cleveref name for lab assignments (if used)
% ============================================================

\crefname{labassignment}{lab assignment}{lab assignments}


% ============================================================
% QUICK REFERENCE — User-facing commands and environments
% ============================================================
%
% MAIN-DOCUMENT HELPERS:
%   \Introduction % unnumbered introduction; next chapter starts at Module 1
%   \appendix     %subsequent chapters become Appendix A, B, ...
%
% PREAMBLE (workbook mode):
%   \coursenumber{Math 16300}
%   \coursename{Honors Calculus III}
%   \coursequarter{Spring 2026}
%   \instructorname{Subhadip Chowdhury}
%   \coverimage{path/to/image}      % optional
%   \departmentlogo{path/to/logo}   % optional
%
% PREAMBLE (worksheet mode):
%   \assignmentcourse{Math 16300}
%   \assignmenttitle{Problem Set 3}
%   \assignmentsemester{Spring 2026}
%   \assignmentduedate{April 18, 2026}
%   \instructorname{Subhadip Chowdhury}
%
% SOLUTION TOGGLE:
%   \solutiontrue   (in preamble) — show solutions
%   \solutionfalse  (default)     — hide solutions
%   \tsol{answer}                 — inline toggle
%
% INSTRUCTOR PLAN TOGGLE:
%   \showplantrue   (default)     — show lectureplan / staffnote blocks
%   \showplanfalse                — suppress them for student copies
%
% ENVIRONMENTS (all share one counter except exercise):
%   \begin{theo}[Title]{theo:label}    % Theorem     — blue, italic
%   \begin{prop}[Title]{prop:label}    % Proposition — blue, italic, rounded
%   \begin{axiom}[Title]{axiom:label}  % Axiom       — blue, italic, rounded
%   \begin{claim}[Title]{claim:label}  % Claim       — blue, italic, rounded
%   \begin{defn}[Title]{defn:label}    % Definition  — green, upright
%   \begin{exmpl}[Title]{exmpl:label}  % Example     — green border, upright
%   \begin{exercise}[tag]              % Question    — maroon, own counter
%   \begin{warning}[Header:]           % Warning     — red left border + ⚠
%   \begin{note}[Header:]              % Note        — gray background
%   \begin{digression}                 % Exploration activity — arrow frame
%   \begin{proofskeleton}              % Proof outline — gray background
%   \begin{lectureplan}[Label]         % Instructor plan block — purple
%   \begin{staffnote}[Label]           % Inline instructor note — purple
%   \begin{prf}{label}                 % Proof of <label> — auto-header + ∎
%   \begin{solution}                   % Toggled solution block
%   \begin{code}{Language}             % Code block (listings)
%
% CROSS-REFERENCING:
%   Always use \cref{label} — never \ref.
%   Label prefixes: theo: prop: axiom: claim: defn: exmpl:
%
% KEY MATH MACROS:
%   \R \N \Z \Q \C \F  — blackboard bold number sets
%   \d                 — ∂ (partial derivative)
%   \D                 — upright d (from kpfonts, for differentials)
%   \dx \dy \dt …      — differential one-forms
%   \ddx \ddy \ddt     — d/dx, d/dy, d/dt (display-style)
%   \dlim \dsum \dint  — display-style lim, Σ, ∫
%   \eval              — evaluation bar  F(x)\eval_a^b
%   \blankfill         — gray rule to right margin (fill-in-the-blank)
%   \myskip            — \vspace{3em}  (student work area)
%   \alert{text}       — maroon bold emphasis
%   \suchthat          — scaled | for set-builder notation
%   \vec{v}            — bold italic v with arrow
%   \uvec{v}           — bold unit vector with hat
%   \P \O              — (partition/power set), (big-O)
%   \U                 — (open covers)
%===========================================================

\endinput
