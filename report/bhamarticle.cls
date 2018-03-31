% Thesis class definition. Modified by Benjamin Nickolls
% (msc47bgn@bham.ac.uk) for Birmingham Univesity's guidelines from:

% University of Birmingham Thesis LaTex2e Class definition.
% Written by Benjamin Nickolls 2007, based on
% the thesis.sty written at UofT by fpitt.
% (bernecky@acm.org)

% Revised by Joe Groocock (2017) for use with articles

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{bhamarticle}[1997/07/15 University of Birmingham Article class
definition]
\RequirePackage{setspace,graphicx}

% The following options are what you get if you do not specify ANY options.
% E.g., \documentclass{utthesis}
% Basically, it is your camera copy.
\ExecuteOptions{a4paper,oneside,12pt,onecolumn,final,openany}

% If you want a cheap-and-cheerful draft copy, try options such
%% \documentclass[draft,twoside,11pt]{utthesis}

% Set up handling of "draft" option.
\DeclareOption{draft}{%
  \PassOptionsToPackage{all}{draftcopy}%
  \PassOptionsToClass{draft}{article}%
  \AtEndOfClass{%
    \RequirePackage{draftcopy}%
    % I wanted to print timestamp of each file, but I don't see
    % how to do that...
    \draftcopyName{DRAFT: \today}{60 } % text for overprinting if in "draft" mode
  }%
}

% Pass ALL options to article.cls.
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}
}

\ProcessOptions


\LoadClass{article}
% Set up environments for thesis sections.

% clearemptydoublepage from page 92 of The LaTeX Companion 1993.
\newcommand{\clearemptydoublepage}{\newpage{\pagestyle{empty}\cleardoublepage}}

% \renewenvironment{abstract}
% {%
%   \clearemptydoublepage
%   \null\vspace{\fill}
%   \small
%   \begin{center}
%     {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
%   \end{center}
%   \begingroup
% }{%
%   \endgroup
%   \vspace{\fill}
%   \newpage
% }

\renewenvironment{abstract}
{\begin{center}\begin{minipage}{0.9\columnwidth}\section*{\centering\normalsize\abstractname}\vspace{0.5em}\begingroup}
{\endgroup\end{minipage}\end{center}}

\newenvironment{acknowledgments}%
{\clearemptydoublepage
  \thispagestyle{plain}
  \begin{center}
    \section*{Acknowledgments}
  \end{center}
  \hrule
  \vspace{2mm}
  \begingroup
}{\newpage\endgroup}

\newenvironment{dedication}%
{\clearemptydoublepage
  \thispagestyle{plain}
  \begin{center}
    \section*{Dedication}
  \end{center}
  \hrule
  \vspace{2mm}
  \begingroup
  }{
\newpage\endgroup}

\newenvironment{preliminary}%
{\pagestyle{plain}\pagenumbering{roman}}%
{\pagenumbering{arabic}}

% Default values for title page.

%% To produce output with the desired line spacing, the argument of
%% \spacing should be multiplied by 5/6 = 0.8333, so that 1 1/2 spaced
%% corresponds to \spacing{1.5} and double spaced is \spacing{1.66}.
\def\normalspacing{1.25} % default line spacing

\newcommand{\department}[1]{\ifx\empty#1\else\gdef\@department{#1}\fi}
\newcommand{\degree}[1]{\ifx\empty#1\else\gdef\@degree{#1}\fi}
\renewcommand{\author}[1]{\ifx\empty#1\else\gdef\@author{#1}\fi}
\newcommand{\supervisor}[1]{\ifx\empty#1\else\gdef\@supervisor{#1}\fi}
\renewcommand{\title}[1]{\ifx\empty#1\else\gdef\@title{#1}\fi}
\newcommand{\gyear}[1]{\ifx\empty#1\else\gdef\@gyear{#1}\fi}

\global\def\@department{\mbox{}}
\global\def\@degree{\mbox{}}
\global\def\@author{\mbox{}}
\global\def\@supervisor{\mbox{}}
\global\def\@title{\mbox{}}
\global\def\@gyear{\number\year} % Default year is current year


%% Change \maketitle to follow the SGS guidelines.
\renewcommand{\maketitle}
{\begin{titlepage}
    %% Set the line spacing to 1 for the title page.
    \begin{spacing}{1}
      \begin{large}
        \begin{center}
          \mbox{}
          \vfill
          \begin{sc}
            \parbox{0.9\textwidth}{\Huge\center{\@title}\\}
          \end{sc}
          \vfill
          {\@author}\\
          Supervisor: {\@supervisor}\\
          \vspace*{0.4em}
          \includegraphics[width=9em,height=9em]{crest.png}\\
          \vspace*{0.5em}
          {\@degree}\\
          \vspace*{0.5em}
          School of {\@department}\\
          University of Birmingham\\
          \vfill
          Copyright {\copyright} {\@gyear} School of {\@department}, University of Birmingham\\
          \vspace*{0.5em}
        \end{center}
      \end{large}
    \end{spacing}
  \end{titlepage}
  \pagenumbering{arabic}
}%\maketitle


%% Footnotes are always single-spaced.
%%\let\@@footnotetext=\@footnotetext
%%\def\@footnotetext{\begin{spacing}{1}\@@footnotetext\end{spacing}}

%% Define the "thesis" page style.
\if@twoside % If two-sided printing.
\def\ps@thesis{\let\@mkboth\markboth
  \def\@oddfoot{}
  \let\@evenfoot\@oddfoot
  \def\@oddhead{
    {\sc\rightmark} \hfil \rm\thepage
  }
  \def\@evenhead{
    \rm\thepage \hfil {\sc\leftmark}
  }
  \def\chaptermark##1{\markboth{\ifnum \c@secnumdepth >\m@ne
  \@chapapp\ \thechapter. \ \fi ##1}{}}
  \def\sectionmark##1{\markright{\ifnum \c@secnumdepth >\z@
\thesection. \ \fi ##1}}}
\else % If one-sided printing.
\def\ps@thesis{\let\@mkboth\markboth
  \def\@oddfoot{}
  \def\@oddhead{
    {\sc\rightmark} \hfil \rm\thepage
  }
  \def\chaptermark##1{\markright{\ifnum \c@secnumdepth >\m@ne
\@chapapp\ \thechapter. \ \fi ##1}}}
\fi

% Define subsubsubsection macro
\setcounter{secnumdepth}{4}
\makeatletter
\newcounter{subsubsubsection}[subsubsection]
\def\thesubsubsubsection{\thesubsubsection.\arabic{subsubsubsection}}
\newcommand\subsubsubsection{%
    \@startsection{subsubsubsection}{4}
        {\z@}{1.4\parskip}{0.2\parskip}
        {\normalfont\normalsize\bfseries}
}
\newcommand*\l@subsubsubsection{\@dottedtocline{3}{10.0em}{4.1em}}
\newcommand*{\subsubsubsectionmark}[1]{}
\makeatother

\pagestyle{plain}
\pagenumbering{gobble}
