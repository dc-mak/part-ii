% Boilerplate
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{src/myclass}[29/03/2017 Dhruv Makwana Part II Project Class]
\LoadClass[12pt,a4paper,notitlepage,twoside,openright]{report}

% Standard
\RequirePackage[utf8x]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[dvipsnames]{xcolor}

% Hyperlinks
% ---
\RequirePackage[
  pdftitle={Exploring the structure of mathematical theories using graph databases},
  pdfauthor={Dhruv Makwana},
  pdfkeywords={mathematics, theorem, prover, graph, database, structure}
]{hyperref}

% Remove ugly boxes around hyperlinks
\hypersetup{%
    colorlinks=true,
    linkcolor={black},
    citecolor={green!50!black},
    urlcolor={blue!80!black}
}

% Refer to Chapters and Sections by their Title
\RequirePackage{nameref}

% Referrable enumerated lists
\RequirePackage{enumitem}

% Formatting
% ---

% Allow flexible pages
\raggedbottom{}
\sloppy
% penalise orphan lines/paragraphs
\clubpenalty1000%
\widowpenalty1000%

% Paragraph formatting
\parindent0pt%
\parskip6pt%

% Nice tables
\RequirePackage{booktabs}

% Nice captions
\RequirePackage[
  format=plain,
  labelfont=bf,
  labelsep=endash
]{caption}
\renewcommand{\captionfont}{\small\sffamily}

% Fancy headers
\RequirePackage{fancyhdr}

% Full-width footnote rule
\renewcommand{\footnoterule}{%
  \kern-3pt
  \hrule width \textwidth height 1pt
  \kern2pt
}%

% Margins
\RequirePackage[
  headheight=15pt, % 15pt for fancyhdr
  top=1.1in,
  bottom=1.25in,
  left=1.25in,
  right=1.25in
]{geometry}

% More readable; preserves hyphenation
% \RequirePackage[document]{ragged2e}

% Sans-serif section headers
\RequirePackage{sectsty}
  \allsectionsfont{\normalfont\sffamily\bfseries}% sans Sub*sections font
  \setcounter{secnumdepth}{3}% Number subsubsections
  \renewcommand{\thesubsubsection}{\Roman{subsubsection}}% with captial roman

% Control (format) table of contents, figures
\RequirePackage{tocloft}
  \setlength{\cftparskip}{6pt}% Spacing in ToC
  \renewcommand{\cfttoctitlefont}{\normalfont\Huge\sffamily\bfseries}% sans ToC Title
  \renewcommand{\cftchapfont}{\normalfont\sffamily\bfseries}% sans ToC chapter font
  \renewcommand{\cftsecfont}{\normalfont\sffamily}% sans ToC section font
  \renewcommand{\cftsubsecfont}{\normalfont\sffamily}% sans ToC subsection font

% Customise Chapter Titles
\RequirePackage{titlesec}
  % Fancy (and smaller) Chapter Heading Style
  \titleformat{\chapter}[hang]{\sffamily\Huge\bfseries}{%
  \thechapter\hspace{20pt}\textcolor{lightgray}{|}\hspace{20pt}}{0pt}{\sffamily\Huge\bfseries}

% Special features
% ---

% Maths symbols (explaining triangle for defs, square for proofs in Eval)
\RequirePackage{amssymb}

% Including stand-alone LaTeX documents as is (Proposal)
\RequirePackage{docmute}

% Source code highlighting
\RequirePackage[outputdir=build]{minted}
  % Magic incantation to stop minted from putting red boxes around shit
  \RequirePackage{etoolbox}
  \makeatletter
  \AtBeginEnvironment{minted}{\dontdofcolorbox}
  \def\dontdofcolorbox{\renewcommand\fcolorbox[4][]{##4}}
  \makeatother

% Graphs
\RequirePackage{pgfplots}
\usetikzlibrary{shapes.geometric, arrows, intersections}

% Evaluation table
\RequirePackage{adjustbox}
\RequirePackage{array}

  % Rotated table headers
  % http://tex.stackexchange.com/questions/32683/rotated-column-titles-in-tabular#32690
  \newcolumntype{R}[2]{%
      >{\adjustbox{angle=#1,lap=\width- (#2)}\bgroup}%
      l%
      <{\egroup}%
  }%
  \newcommand*\rot{\multicolumn{1}{R{90}{0.8em}}}

  % Fancy coloured boxes
  \newcommand{\Y}{\tikz\fill [ForestGreen] (-0.3ex,0) rectangle (1.3ex,0.7em); }
  \newcommand{\M}{\tikz\fill [YellowOrange]  (-0.3ex,0) rectangle (1.3ex,0.7em); }
  \newcommand{\N}{\tikz\fill [Red]   (-0.3ex,0) rectangle (1.3ex,0.7em); }

% Per Chapter Mini Table of Contents (load after titlesec)
\RequirePackage{minitoc}

% Conveniences
% ---

% Include pink book guidance or not
\newif\ifguidance%
\guidancefalse%
\newcommand{\guidance}[1]{%
  \ifguidance%
  \textsf{\color{red}{#1}}
  \newpage
  \fi%
}%

% At the start of each chapter
\renewcommand{\mtctitle}{}
\newcommand*{\prechapter}[1]{%
\minitoc%
\bigskip%
\begin{center}%
  \begin{minipage}[h][][c]{0.8\linewidth}%
	#1
  \end{minipage}%
\end{center}

\newpage%
}

% Graph colours - RegExp
\definecolor{graphlgreen}{RGB}{78,215,62}
\newcommand*{\glgreen}[1]{\textcolor{graphlgreen}{#1}}

\definecolor{graphlblue}{RGB}{67,139,236}
\newcommand*{\glblue}[1]{\textcolor{graphlblue}{#1}}

\definecolor{graphlpurple}{RGB}{229,67,242}
\newcommand*{\glpurple}[1]{\textcolor{graphlpurple}{#1}}

\definecolor{graphviolet}{RGB}{68,34,251}
\newcommand*{\gviolet}[1]{\textcolor{graphviolet}{#1}}

\definecolor{graphorange}{RGB}{255,168,7}
\newcommand*{\gorange}[1]{\textcolor{graphorange}{#1}}

% Graph colours - OOT
\definecolor{graphyellow}{RGB}{255,165,0}
\newcommand*{\gyellow}[1]{\textcolor{graphyellow}{#1}}

\definecolor{graphpink}{RGB}{251,126,129}
\newcommand*{\gpink}[1]{\textcolor{graphpink}{#1}}

\definecolor{graphdblue}{RGB}{0,14,161}
\newcommand*{\gdblue}[1]{\textcolor{graphdblue}{#1}}

\definecolor{graphpurple}{RGB}{0,14,161}
\newcommand*{\gpurple}[1]{\textcolor{graphpurple}{#1}}

\definecolor{graphdgreen}{RGB}{37,92,3}
\newcommand*{\gdgreen}[1]{\textcolor{graphdgreen}{#1}}

\definecolor{graphmagenta}{RGB}{255,0,126}
\newcommand*{\gmagenta}[1]{\textcolor{graphmagenta}{#1}}

% Graph references
\newcommand*{\gridgraph}{\hyperref[fig:oot:grid]{grid graph}}
\newcommand*{\modulegraph}{\hyperref[fig:oot:module]{module graph}}
\newcommand*{\circlegraph}{\hyperref[fig:oot:circleflip]{flipped circular graph}}
\newcommand*{\hiergraph}{\hyperref[fig:oot:hier]{hierarchical graph}}
\newcommand*{\hierflipgraph}{\hyperref[fig:oot:hierflip]{flipped hierarchical graph}}
\newcommand*{\directgraph}{\hyperref[fig:oot:direct]{force-directed graph}}

% End
\endinput
