\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{workbook}[2022/18/05 Math Workbook Template]

\newif\ifworksheet
\DeclareOption{worksheet}{\worksheettrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessOptions\relax

\LoadClass[letterpaper,11pt]{book}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Workbook class file
% Ver 8.0 (5/18/2022)
%
% Author: Subhadip Chowdhury
%
% License:
% CC BY-NC-SA 4.0 (https://creativecommons.org/licenses/by-nc-sa/4.0/)
% 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%======== Remove Extra Blank pages from Book class =================
\let\cleardoublepage=\clearpage

%===============FONT=====================
\RequirePackage[frenchstyle,narrowiints,nofligatures,partialup,fullintlimits,fullsumlimits,largesmallcaps,mathcalasscript]{kpfonts}

%Title Font
\RequirePackage{libris}
\renewcommand{\sfdefault}{yly}






%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%==============PACKAGES==================



%====== Graphics ===
\RequirePackage{graphicx}
\RequirePackage{subcaption}
\RequirePackage{framed}
\RequirePackage{color,xcolor}
\RequirePackage{float}

%====== TIKZ =======

\RequirePackage{tikz, tkz-euclide,tikz-3dplot}
\usetikzlibrary{fit, shapes, positioning}
\usetikzlibrary{arrows, automata}
\usetikzlibrary{decorations}


%======== GEOMETRY  ======

\RequirePackage[left=0.75in, right=0.75in, top=0.75in, bottom=0.75in]{geometry}



%========= FORMATTING ====

\RequirePackage{verbatim}
\RequirePackage{lipsum}

\RequirePackage{microtype}
\DisableLigatures{encoding = *, family = *}

\RequirePackage{todonotes}

\usepackage{anyfontsize}
\RequirePackage{xhfill}

\RequirePackage{booktabs, longtable}
\newcolumntype{P}[1]{>{\centering\arraybackslash}p{#1}}

%=========Fancy Footnote===============

%Footnote Symbol
\RequirePackage[symbol]{footmisc}

\renewcommand*{\thefootnote}{\fnsymbol{footnote}}

%===========Fancy End of Section Line using pgf-ornaments ==========================

\RequirePackage[object=vectorian]{pgfornament}
\newcommand{\chapterline}[2]{%
	\nointerlineskip \vspace{.1\baselineskip}\hspace{\fill}
	{\resizebox{0.3\linewidth}{1ex}
		{\pgfornament[color = #1]{#2}
	}}%
	\hspace{\fill}
	\par\nointerlineskip \vspace{.1\baselineskip}
}

%============= COLORS ===============

\newcommand{\blue}{\color{blue!80!black}}
\newcommand{\maroon}{\color{orange!60!black}}


\definecolor{lightgreen}{HTML}{edffed}
\definecolor{lightgreenmono}{HTML}{a8e6a8}
\definecolor{lightgreencomp}{HTML}{ffeded}

\definecolor{lightblue}{HTML}{edffff}
\definecolor{lightbluemono}{HTML}{a8e6e6}
\definecolor{lightbluecomp}{HTML}{fff2ed}
% \definecolor{lightbluecomp}{HTML}{e6b9a8}

\renewcommand{\em}{\maroon\bfseries}



%=========HYPERREF===============
\RequirePackage{hyperref}
\RequirePackage[nameinlink]{cleveref}
%\setcounter{secnumdepth}{4}

\hypersetup{
	colorlinks=true,       % false: boxed links; true: colored links
	linkcolor={blue},          % color of internal links (change box color with linkbordercolor)
	citecolor={green!50!black},        % color of links to bibliography
	filecolor=magenta,      % color of file links
	urlcolor=cyan           % color of external links
}

%============== Bibliography ========
\RequirePackage[sorting=none, backend=biber, style=numeric]{biblatex}







%===== MATH ==========

\RequirePackage{amsmath, mathtools}
\RequirePackage{amsthm, amssymb}


%========= Tables and Lists ==========
\RequirePackage{multicol,array}
\usepackage{booktabs} % This makes tables look a bit more professional!

\RequirePackage{enumitem}
\setlist[enumerate]{leftmargin=*, align=left}
% \setlist[enumerate,1]{label = \arabic*.,ref   = \arabic*}
\setlist[enumerate,1]{label = (\alph*), ref = \thequestion.\alph*}
\setlist[enumerate,2]{label = (\roman*), ref= \theenumii.\roman*}
\setlist[itemize]{leftmargin=*, align=left}
\setlist[itemize,2]{label=$\blacktriangleright$}
\setlist[itemize,1]{label=$\bullet$}

\RequirePackage{tasks}
\settasks{label=(\roman*), item-indent  = 2em , label-width  = 2em , label-offset = 0pt}





%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%========== TITLE FORMATTING ==========


\RequirePackage[explicit,toctitles,center,pagestyles]{titlesec}
% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before>}[<after>]


%=== CHAPTER ===

\titleformat{\chapter}[block]{\centering}{\huge\bfseries\sffamily\scshape\color{orange} \chaptername~\thechapter\;{\color{lightgray}\vrule width 2pt} {#1}}{0pt}{}[\chapterline{orange}{88}\thispagestyle{empty}]

\titleformat{name=\chapter, numberless}{\centering}{\huge\bfseries\sffamily\scshape\color{orange} #1}{0pt}{}[\chapterline{orange}{88}\thispagestyle{empty}]


\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}

%=== SECTION ===

\fboxrule0.5pt\fboxsep3pt
\renewcommand\thesection{\arabic{chapter}.\arabic{section}}

\titleformat{\section}{\sffamily\Large}{}{0pt}{\colorbox{orange!50}{\S\thesection~\textbf{#1}}}



%=== SUBSECTION ===

\titleformat{\subsection}{\large\sffamily}{}{0em}{\colorbox{orange!50}{\thesubsection~\textbf{#1}}}

% \titlespacing{\subsection}{0pt}{5pt plus 4pt minus 2pt}{10pt plus 2pt minus 2pt}

%=== SUBSUBSECTION ===
% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before>}[<after>]

\titleformat{\subsubsection}{\centering\sffamily}{}{0em}{\boxed{\textbf{#1}}}

\titlespacing{\subsubsection}{3pc}{*3}{*2}[3pc]




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%============== Boxes ===============

%%%%%%%%%%%%%%%%%% Numbered and non-numbered Environments %%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{environ} 
\RequirePackage[framemethod=TikZ]{mdframed}



%%%%%%%%%%%%%%%%
% Exercise %%%%%
%%%%%%%%%%%%%%%%

\newcounter{question}
\NewEnviron{exercise}[1][]
{
	\refstepcounter{question}%
	{\paragraph{}\em\large \hspace{-2em}$\blacksquare$~\othertailQ uestion~\thequestion.\hfill\fbox{#1}}\\[0.5em] {{\itshape\BODY}}
}

\crefname{question}{question}{questions}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Solution %%%%%%%%% Make Solution Invisible Based on Flag
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Usage:
% \begin{solution}
%	solution contents
% \end{solution}


\newif\ifsolution

\NewEnviron{solution}{\ifsolution\begin{proof}[Solution]\blue\BODY\end{proof}\fi}{} 
\renewcommand\qedsymbol{$\blacksquare$}  


%%%%%%%%%%%%%%%%
%Proof %%%%%%%%% Doesn't have a counter. Needs label of theorem or proposition etc.
%%%%%%%%%%%%%%%%

% Usage:
% \begin{prf}[label of theorem]
%	proof contents
% \end{prf}


\NewEnviron{prf}[2][]
{%
	\mdfsetup{%
		frametitle={%
			\tikz[baseline=(current bounding box.east),outer sep=0pt]
			\node[anchor=east,rectangle,fill=lightbluemono] {\strut Proof of~\cref{#2}.} ;},%
		innertopmargin=5pt,linecolor=lightbluemono,%
		linewidth=2pt,topline=true,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax%
	}%
	\begin{mdframed}\BODY\qed\end{mdframed}%
}



%%%%%%%%%%% All environments get the same counter, except Questions. %%%%%%%%%%%%%

\newcounter{counter} \setcounter{counter}{0}

%%%%%%%%%%%%%%%%
%Theorem %%%%%%
%%%%%%%%%%%%%%%%

% Usage:
% \begin{thm}[optional title]{label}
%	theorem contents
% \end{thm}


\newcommand{\thetheo}{\arabic{chapter}.\arabic{section}.\arabic{counter}}

\NewEnviron{theo}[2][]
{
	\refstepcounter{counter}%
	\ifstrempty{#1}%
	{%if no title
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightbluecomp]
				{\strut Theorem~\thetheo};}
		}
	}
	{%else
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightbluecomp]
				{\strut Theorem~\thetheo:~#1};}%
		}%
	}
	\mdfsetup{%common in both cases
		innertopmargin=5pt,linecolor=lightbluemono,%
		linewidth=2pt,topline=true,backgroundcolor= lightblue,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}\label[theorem]{#2}{\it \BODY}\end{mdframed}%
}

\crefname{theorem}{theorem}{theorems}



%%%%%%%%%%%%%%%%
%Axiom %%%%%%
%%%%%%%%%%%%%%%%

% Usage:
% \begin{thm}[optional title]{label}
%	theorem contents
% \end{thm}


\newcommand{\theaxiom}{\arabic{chapter}.\arabic{section}.\arabic{counter}}

\NewEnviron{axiom}[2][]
{
	\refstepcounter{counter}%
	\ifstrempty{#1}%
	{%if no title
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rounded rectangle,fill=lightbluecomp]
				{\strut Axiom~\theaxiom};}
		}
	}
	{%else
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rounded rectangle,fill=lightbluecomp]
				{\strut Axiom~\theaxiom:~#1};}%
		}%
	}
	\mdfsetup{%common in both cases
		innertopmargin=5pt,linecolor=lightbluemono,%
		linewidth=2pt,topline=true,backgroundcolor= lightblue,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}\label[axiom]{#2}{\it \BODY}\end{mdframed}%
}

\crefname{axiom}{axiom}{axioms}




%%%%%%%%%%%%%%%%
%Proposition %%%%%%
%%%%%%%%%%%%%%%%

% Usage:
% \begin{prop}[optional title]{label}
%	theorem contents
% \end{prop}


\newcommand{\theprop}{\arabic{chapter}.\arabic{section}.\arabic{counter}}

\NewEnviron{prop}[2][]
{
	\refstepcounter{counter}%
	\ifstrempty{#1}%
	{%if no title
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rounded rectangle,fill=lightbluecomp]
				{\strut Proposition~\theprop};}
		}
	}
	{%else
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rounded rectangle,fill=lightbluecomp]
				{\strut Proposition~\theprop:~#1};}%
		}%
	}
	\mdfsetup{%common in both cases
		innertopmargin=5pt,linecolor=lightbluemono,%
		linewidth=2pt,topline=true,backgroundcolor= lightblue,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}\label[proposition]{#2}{\it \BODY}\end{mdframed}%
}

\crefname{proposition}{proposition}{propositions}


%%%%%%%%%%%%%%%%
%Claim %%%%%%
%%%%%%%%%%%%%%%%

% Usage:
% \begin{claim}[optional title]{label}
%	claim contents
% \end{claim}


\newcommand{\theclaim}{\arabic{chapter}.\arabic{section}.\arabic{counter}}

\NewEnviron{claim}[2][]
{
	\refstepcounter{counter}%
	\ifstrempty{#1}%
	{%if no title
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rounded rectangle,fill=lightbluecomp]
				{\strut Claim~\theclaim};}
		}
	}
	{%else
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rounded rectangle,fill=lightbluecomp]
				{\strut Claim~\theclaim:~#1};}%
		}%
	}
	\mdfsetup{%common in both cases
		innertopmargin=5pt,linecolor=lightbluemono,%
		linewidth=2pt,topline=true,backgroundcolor= lightblue,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}\label[claim]{#2}{\it \BODY}\end{mdframed}%
}

\crefname{claim}{claim}{claims}



%%%%%%%%%%%%%%%%
%Definition %%%
%%%%%%%%%%%%%%%%

% Usage:
% \begin{defn}[optional title]{label}
%	Definition contents
% \end{defn}


\newcommand{\thedefn}{\arabic{chapter}.\arabic{section}.\arabic{counter}}

\NewEnviron{defn}[2][]
{
	\refstepcounter{counter}%
	\ifstrempty{#1}%
	{%if no title
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightgreencomp]
				{\strut Definition~\thetheo};}
		}
	}
	{%else
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightgreencomp]
				{\strut Definition~\thetheo:~#1};}%
		}%
	}
	\mdfsetup{%common in both cases
		innertopmargin=5pt,linecolor=lightgreenmono,%
		linewidth=2pt,topline=true,%
		backgroundcolor= lightgreen,%
		innerrightmargin=1em,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}\label[definition]{#2}\BODY\end{mdframed}%
}

\crefname{definition}{definition}{definitions}

%%%%%%%%%%%%%%%%
%Example
%%%%%%%%%%%%%%%%

% Usage:
% \begin{exmpl}[optional title]{label}
%	Example contents
% \end{exmpl}


\newcommand{\theexmpl}{\arabic{chapter}.\arabic{section}.\arabic{counter}}

\NewEnviron{exmpl}[2][]
{%
	\refstepcounter{counter}%
	\ifstrempty{#1}%
	{%
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightgreenmono]
				{\strut Example~\theexmpl};}
		}
	}%
	{%else
		\mdfsetup{%
			frametitle={%
				\tikz[baseline=(current bounding box.east),outer sep=0pt]
				\node[anchor=east,rectangle,fill=lightgreenmono]
				{\strut Example~\theexmpl:~#1};}
		}%
	}%
	\mdfsetup{%
		innertopmargin=5pt,innerleftmargin=1em,%
		linewidth=2pt,topline=true,%
		% backgroundcolor= black!7,%
		linecolor=lightgreenmono,%
		innerrightmargin=1em,%
		frametitleaboveskip=\dimexpr-\ht\strutbox\relax
	}
	\begin{mdframed}\label[example]{#2}\BODY\end{mdframed}%
}

\crefname{example}{example}{examples}


%%%%%%%%%%%%%%%%
%Warning
%%%%%%%%%%%%%%%%

% Usage:
% \begin{warning}[optional title, defaults to Warning:]
%	warning contents
% \end{warning}


\RequirePackage{fontawesome}

\tikzset{
	warningsymbol/.style={
		rectangle,draw=red,
		fill=white,scale=1,
		overlay}}
\mdfdefinestyle{warning}{%
	hidealllines=true,leftline=true,
	skipabove=12,skipbelow=12pt,
	innertopmargin=0.4em,%
	innerbottommargin=0.4em,%
	innerrightmargin=0.7em,%
	rightmargin=0.7em,%
	innerleftmargin=1.7em,%
	leftmargin=0.7em,%
	middlelinewidth=.2em,%
	linecolor=red,%
	fontcolor=red!70!black,%
	firstextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
		node[warningsymbol] {\faWarning};},%
	secondextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
		node[warningsymbol] {\faWarning};},%
	middleextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
		node[warningsymbol] {\faWarning};},%
	singleextra={\path let \p1=(P), \p2=(O) in ($(\x2,0)+0.5*(0,\y1)$)
		node[warningsymbol] {\faWarning};},%
}

\NewEnviron{warning}[1][Warning:]{
	\begin{mdframed}[style=warning]
		\noindent{\textbf{#1}} \BODY \end{mdframed}}

%%%%%%%%%%%%%%%%%%%%%%%%%
%% Exploration Activity
%%%%%%%%%%%%%%%%%%%%%%%%

% Usage:
% \begin{digression}
%	digression contents
% \end{digression}


\usetikzlibrary{calc,arrows}
\tikzset{
	excursus arrow/.style={%
		line width=2pt,
		draw=gray!40,
		rounded corners=2ex,
	},
	excursus head/.style={
		fill=white,
		font=\bfseries\sffamily,
		text=gray!80,
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
		\node [excursus head] at ($(Q)+(2.5em,-0.75pt)$) {Exploration Activity};},
	firstextra={%
		\path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
		\path [excursus arrow,-to]
		(O) |- %
		($(Q)+(12em,0ex)$) .. controls +(0:16em) and +(185:6em) .. %
		++(23em,2ex);
		\node [excursus head] at ($(Q)+(2.5em,-2pt)$) {Exploration Activity};},
	secondextra={%
		\path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
		\path [excursus arrow,round cap-]
		($(O)+(5em,0ex)$) -| (Q);},
	middleextra={%
		\path let \p1=(P), \p2=(O) in (\x2,\y1) coordinate (Q);
		\path [excursus arrow]
		(O) -- (Q);},
	middlelinewidth=2.5em,middlelinecolor=white,
	hidealllines=true,topline=true,
	innertopmargin=0.5ex,
	innerbottommargin=2.5ex,
	innerrightmargin=2pt,
	innerleftmargin=2ex,
	skipabove=0.87\baselineskip,
	skipbelow=0.62\baselineskip,
}


\NewEnviron{digression}{\begin{mdframed}[style=digressionarrows] \BODY \end{mdframed}}



%%%%%%%%%%%%%%%%
% COMMAND LINE ENVIRONMENT
%%%%%%%%%%%%%%%%

% Usage:
% \begin{code}
%		$ ls
%		
%		Applications	Desktop	...
% \end{code}


\RequirePackage{listings}

\lstnewenvironment{code}[1]
{%
    \mdfsetup{
		leftmargin=10pt,
		rightmargin=10pt,
		innerleftmargin=15pt,
		middlelinecolor=black!50,
		middlelinewidth=1pt,
		frametitlerule=false,
		backgroundcolor=black!5,
		frametitle={Code:},
		frametitlefont={\normalfont\sffamily\color{white}\hspace{-1em}},
		frametitlebackgroundcolor=black!50,
		nobreak,
	}
    \mdframed%
    \lstset{
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
  } {\vspace{-0.75em}\endmdframed}




%%%%%%%%%%%%%%%%%%%%%%
% Note 
%%%%%%%%%%%%%%%%%%%%%


\mdfdefinestyle{note}{%
	hidealllines=true,leftline=true,
	skipabove=12,skipbelow=12pt,
	innertopmargin=0.4em,%
	innerbottommargin=0.4em,%
	innerrightmargin=0.5em,%
	innerleftmargin=0.5em,%
	middlelinewidth=.2em,%
	linecolor=red,%
	backgroundcolor=black!5,
}


\NewEnviron{note}[1][Note:]{
	\begin{mdframed}[style=note]
		\noindent{\textbf{#1}} \BODY \end{mdframed}}

%=====================================








%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





%==================Title Page for Worksheet=================== 

\ifworksheet
%%%%%%%%%%%%%%%%%%% Beginning of worksheet specific pages %%%%%%%%%%%%%%%%%

\renewcommand{\maketitle}{
    \begin{center}
		{\maroon\Huge\scshape \@assignmentcourse}
		\vspace{1em}
		
		{\scshape\huge \@assignmenttitle}
	\end{center}
	\vspace{-0.5em}
	\noindent\hrulefill
	
	\vspace{-0.5em}
	\noindent{\bfseries\large\@assignmentsemester\hspace{10.5em}\@instructorname\hfill \@assignmentduedate}
	
	\vspace{-1em}
	\noindent\hrulefill
	\thispagestyle{empty}
}

\newcommand{\assignmenttitle}[1]{
  \gdef\@assignmenttitle{#1}}
  

\newcommand{\assignmentcourse}[1]{
  \gdef\@assignmentcourse{#1}}
  

\newcommand{\assignmentsemester}[1]{
  \gdef\@assignmentsemester{#1}}


\newcommand{\assignmentduedate}[1]{
  \gdef\@assignmentduedate{#1}}
  

\newcommand{\instructorname}[1]{
  \gdef\@instructorname{#1}}




%%%%%% End of worksheet specific pages %%%%%%%%%


\else 
%%%%%%%%%%%%%%%%%%% Beginning of Workbook specific pages %%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Title Page for Workbook %%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\maketitle}{
	\begin{center}
		{\includegraphics[width=0.9\textwidth]{\@coverimage}\par}
		\vspace{1cm}
		{\Huge\bfseries \@coursename \par}
		\vspace{2cm}
		{\scshape\huge \@coursenumber~Lecture notes\par}
		\vspace{1.5cm}
		
		{\Large \@instructorname, PhD \par}
		\vfill
		
		% Bottom of the page
		{\includegraphics[width=0.5\textwidth]{\@departmentlogo}\par}
		\vspace{1cm}
		{\Large \@coursesemester\par}
	\end{center}
	\thispagestyle{empty}
}

\newcommand{\coverimage}[1]{
	\gdef\@coverimage{#1}}

\newcommand{\department}[1]{
	\gdef\@department{#1}}
	
\newcommand{\departmentlogo}[1]{
	\gdef\@departmentlogo{#1}}

\newcommand{\coursenumber}[1]{
	\gdef\@coursenumber{#1}}

\newcommand{\coursename}[1]{
	\gdef\@coursename{#1}}

\newcommand{\coursesemester}[1]{
	\gdef\@coursesemester{#1}}

\newcommand{\instructorname}[1]{
	\gdef\@instructorname{#1}}


%%%%%%% Frontmatter %%%%%%%%%%%%%%%%%%%%%%%%%%%
% Special front matter that appears before the table of contents
\newcommand{\PreTOCMatter}[1]{
	\thispagestyle{empty}
	\vspace*{\fill}
	\begin{center}
		#1
	\end{center}
	\vspace*{\fill}
}
% Preliminary sections following the table of contents and preceding the body are front matter
\newcommand{\FrontMatter}[1]{
	\chapter*{#1}
	\addcontentsline{toc}{chapter}{#1}
}

% Epigraph
%\epigraph{epigraph text}
\newcommand{\epigraph}[1]{\newcommand{\EpigraphText}{#1}}
\newcommand{\makeepigraph}{\PreTOCMatter{\EpigraphText}}


%%%%%% Endmatter %%%%%%%%%%%%%%%%%%%%%%%%
% Bibliography
\newcommand{\makebibliography}{
	\newpage
	\addcontentsline{toc}{chapter}{References}
	\begin{singlespace}
		\bibliography{references}
		\bibliographystyle{abbrvnat}
	\end{singlespace}
}


%%%%%% End of Workbook specific pages %%%%%%%%%

\fi %End of ifworksheet











%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%% Header and Footer %%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{fancyhdr}

\pagestyle{fancy}
\fancyhf{}

\ifworksheet
    \lhead{\bf \@assignmentduedate}
\else
    \lhead{\bf \@coursenumber}
\fi
\chead{\bf \textendash\;\thepage\;\textendash}
\rhead{\bf \@instructorname}
\lfoot{}
\rfoot{}
\cfoot{}
% \lhead{%
% 		\begin{tikzpicture}[overlay,remember picture]
% 			\node[draw, fill=orange!50, text=black, draw=black,
% 			rounded rectangle, 
% 			minimum width=3cm,minimum height=2em,
% 			align = right, text width=6.5em,
% 			anchor=west] at ($ (current page.north west) + (-1.5cm, - 1in - \voffset - \topmargin - \headheight )  $)
% 			{\large\bfseries{\S\thechapter.\thesection~}};
% 		\end{tikzpicture}
% 		\bf \@coursenumber
% }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%=== Somehow moving this above breaks things ====??? ====
\RequirePackage{parskip}

















%======== Extra Useful Packages -- Remove if not needed ============
\RequirePackage{venndiagram}
\RequirePackage{cancel}
\RequirePackage{bigints}


%=========== Shortcut Commands -- Remove if not needed ==============

\renewcommand{\phi}{\varphi}
\renewcommand{\epsilon}{\varepsilon}

\newcommand{\la}{\langle}
\newcommand{\ra}{\rangle}
\newcommand{\vf}[1]{\frac{1}{#1}}
\newcommand{\X}{\times}
\newcommand{\leg}[2]{\left(\frac{#1}{#2}\right)}

\newcommand{\rh}{\rightharpoonup}
\newcommand{\xrh}{\stackrel{*}{\rightharpoonup}}
\newcommand{\blank}{\hspace{10pt}}
\newcommand{\tripnorm}{\|\hspace{-1pt}|}
\newcommand{\suchthat}{\;\ifnum\currentgrouptype=16 \middle\fi|\;}


\newcommand{\cis}{\textup{c}i\textup{s }}
\renewcommand{\d}{\partial}
\newcommand{\grad}{\nabla}
\newcommand{\tr}{\mathbf{tr}}


\DeclarePairedDelimiter{\ceil}{\lceil}{\rceil}
\DeclarePairedDelimiter{\floor}{\lfloor}{\rfloor}

\DeclareMathOperator{\arcsec}{arcsec}
\DeclareMathOperator{\arccot}{arccot}
\DeclareMathOperator{\arccsc}{arccsc}
\DeclareMathOperator{\charpoly}{charpoly}

\DeclareMathOperator{\Proj}{Proj}
\DeclareMathOperator{\curl}{curl}
\DeclareMathOperator{\mydiv}{div}

\newcommand{\myskip}{\vspace{3em}}
\newcommand{\mysskip}{\vspace{2em}}
\newcommand{\myssskip}{\vspace{1em}}

\newcommand{\Zroot}[1]{\mathbb{Z}[\sqrt{#1}]}
\newcommand{\Qroot}[1]{\mathbb{Q}(\sqrt{#1})}
\newcommand{\R}{\mathbb{R}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\U}{\mathcal{U}}

\newcommand{\ddx}{\dfrac{\D}{\D x}}
\newcommand{\ddt}{\dfrac{\D}{\D t}}
\newcommand{\dint}{\displaystyle\int}
\newcommand{\dx}{\D x}
\newcommand{\dt}{\D t}
\newcommand{\du}{\D u}
\newcommand{\du}{\D v}
\newcommand{\dz}{\D z}
\newcommand{\dy}{\D y}
\newcommand{\dA}{\D A}
\newcommand{\dr}{\D r}
\newcommand{\dtheta}{\D \theta}
\newcommand{\eval}{\biggr|}
\renewcommand{\bar}{\overline}
\newcommand{\blankfill}{\xrfill[-1em]{0.5pt}}

\newcommand{\ds}{\displaystyle}

\DeclareMathOperator{\lcm}{lcm}

\newcommand\notR{\cancel{R}}
\newcommand\notS{\cancel{S}}

\DeclareMathOperator\Dom{Dom}
\DeclareMathOperator\Rng{Rng}
\DeclareMathOperator\Codom{Codom}

%Bold Vectors
\RequirePackage{esvect,bm,bbold}
\renewcommand{\vec}[1]{\vv{\bm{{#1}}}}

\newcommand{\choicebox}{~\fbox{\begin{minipage}{0.5in}\hfill\vspace{1em}\end{minipage}}~}

