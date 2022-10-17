%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Doctoral/Master's Thesis
% Class File
% Version 1 (2022/10/11)
%
% Note:
% This class file defines the structure and design of the template file (template.tex).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%----------------------------------------------------------------------------------------
%	REQUIRED PACKAGES
%----------------------------------------------------------------------------------------



%----------------------------------------------------------------------------------------
%	CLASS DEFINITION AND PARAMETERS
%----------------------------------------------------------------------------------------
%Class definition
%required to create a class
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{guelphthesis}[2022/10/11] %info in square brackets specifies release date

%Parameters
\let\cleardoublepage\clearpage  %#removes blank pages in dissertation preamble

\providecommand{\baseclass}{book} %define \baseclass command

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\baseclass}}
\ProcessOptions\relax
\LoadClass{\baseclass}

\usepackage{titlecaps} %capitalizes first letter of words (needed to toc entries when using \addcontentsline)
\usepackage{titlesec}
\usepackage{fancyhdr}
\usepackage{etoolbox}
\usepackage{multicol} %needed for multicolumn layout in abstract papge
\usepackage[hyperfootnotes=false]{hyperref} %turn off footnote hyperlinking (doesn't work well and also not necessary)
\usepackage[multiple, hang,flushmargin]{footmisc}  %removes indentation in footnotes
%\renewcommand{\footnotesize}{\mdseries\fontsize{10pt}{10pt}\selectfont}%footnotesize

%place footnoterule definition into  new command, then modify spacing between footnoterule and footnotetext with \vskip10pt
\let\newfootnoterule\footnoterule
\def\footnoterule{\newfootnoterule \vskip10pt}
\counterwithout*{footnote}{chapter} %stops footnote counter from resetting in new chapters

%allows linespacing to be specified using YAML of linespacing
\newcommand{\setFrontmatterLinespacing}[1]{
    \setstretch{#1}
}

\def\degree#1{\gdef \@degree{#1}}
\def\year#1{\gdef \@year{#1}}
\def\@degree{\@latex@warning@no@line{No \noexpand\degree given}}
\def\institution#1{\gdef \@institution{#1}}
\def\@institution{\@latex@warning@no@line{No \noexpand\institution given}}
\def\department#1{\gdef \@department{#1}}
\def\@department{\@latex@warning@no@line{No \noexpand\department given}}
\def\advisor#1{\gdef \@advisor{#1}}
\def\@advisor{\@latex@warning@no@line{No \noexpand\advisor given}}

\def\specialization#1{\gdef \@specialization{#1} \@specializationtrue}
\global\let\@specialization\@empty
\newif\if@specialization
\@specializationfalse

\def\altadvisor#1{\gdef \@altadvisor{#1} \@altadvisortrue}
\global\let\@altadvisor\@empty
\newif\if@altadvisor
\@altadvisorfalse

\def\field#1{\gdef \@field{#1} \@fieldtrue}
\global\let\@field\@empty
\newif\if@field
\@fieldfalse


\renewcommand{\title}[1]{\def\@title{#1}}
\newcommand{\linespacing}[1]{\def \@linespacing{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Acknowledgements}[1]{\def\@Acknowledgements{#1}}
\newcommand{\Dedication}[1]{\def\@Dedication{#1}}
\newcommand{\Preface}[1]{\def\@Preface{#1}}



%----------------------------------------------------------------------------------------
%	GLOBAL SETTINGS
%----------------------------------------------------------------------------------------

\AtBeginDocument{%


  \setlength{\parindent}{1cm} %indentation of first line of paragraphs (important to load indentfirst for first-paragraph indentation)
}

%necessar to define tighlist
%\providecommand{\tightlist}{%
%  \setlength{\itemsep}{0pt}
%  \setlength{\parskip}{0pt}
%  }
\def\tightlist{}

%----------------------------------------------------------------------------------------
% HEADER LEVEL FORMATTING
%----------------------------------------------------------------------------------------
%follows heading format specified in ETD_template_monograph; note that formatting has been done until Heading 6 style
%(to add more heading styles, see https://tex.stackexchange.com/questions/60209/how-to-add-an-extra-level-of-sections-with-headings-below-subsubsection)

\renewcommand*{\@seccntformat}[1]{\csname the#1\endcsname\hspace{0.3cm}} %sets spacing between section number and section title

%section (heading level 1 from Word)
\renewcommand\chapter{
 \@startsection{chapter}
 {0} %level
 {0cm}%indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{16pt}{16pt}\selectfont\bfseries}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}


%section (heading level 2 from Word)
\renewcommand\section{
 \@startsection{section}
 {1} %level
 {0cm}%indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{14pt}{14pt}\selectfont\bfseries}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}

%subsection (heading level 3 from Word)
\renewcommand\subsection{
 \@startsection{subsection}
 {2} %level
 {0cm} %indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{12pt}{14pt}\selectfont\bfseries}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}

%subsubsection (heading level 4 from Word)
\renewcommand\subsubsection{
 \@startsection{subsubsection}
 {3} %level
 {0cm} %indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{12pt}{14pt}\selectfont\bfseries}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}

%para (heading level 5 from Word)
\renewcommand\paragraph{
 \@startsection{paragraph}
 {4} %level
 {0cm} %indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{12pt}{14pt}\selectfont\bfseries}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}


%subparagraph (heading level 6 from Word)
%%command is redefined so that built-in defaults can be reset (e.g., indentation, vertical spacing after text + heading).
\renewcommand\subparagraph{
 \@startsection{subparagraph}
 {5} %level
 {0cm} %indentation
 {0.1cm}%vertical space after text
 {0.1cm} % vertical space after heading; trick is to set it so a very small value so that, in compilation, the space between the title and text
%defaults to the linespacing value set in the YAML header
 {\fontsize{12pt}{14.6pt}\selectfont}%styling; note space between number and title is a bit too large (can't figure out how to decrease it).
}


%----------------------------------------------------------------------------------------
%	MARGINS
%----------------------------------------------------------------------------------------

%command called at beginning of document
\RequirePackage{geometry}
\newcommand{\setGeometry}{
\geometry{
	paper=a4paper, % Default paper size, change to "letterpaper" for US Letter (you'll need to adjust margins after)
	inner=2.54cm,
	outer=2.54cm,
	top=2.54cm,
	bottom=3.54cm,
	headheight=0cm, % Header height
	headsep=1.252cm, % Header separation
	foot = 0.75cm, %space between text and page number in bottom
	footskip = 1cm,  %space between footnote and page number
	footnotesep = 1cm
}
}

\setGeometry{}



%----------------------------------------------------------------------------------------
%	TITLEPAGE
%----------------------------------------------------------------------------------------
\usepackage[absolute]{textpos} %allows everything below title on titlepage to be positioned regardless of how long the title is

\renewcommand{\maketitle}{%

  \begin{titlepage}
  \newgeometry{top = 2.52cm, bottom = 2.52cm, right = 2.52cm,left = 2.52cm}

  \begin{center}

     \vspace*{3cm}
     \setstretch{1.25}
        {\fontsize{14pt}{14pt}\selectfont\textbf{\@title}}
    \vspace{2cm}

      \setstretch{2}

      by \\
      \@author
   \vspace{2cm}

    \setstretch{1.25}

    A Thesis \\
    presented to \\
    The \@institution \\

  \vspace{2cm}

     \setstretch{1}
    In partial fulfilment of requirements \\
    for the degree of
    \\
     \setstretch{1.5}
   \@degree \\
   in \\
   \@department \\

   %optional field and specialization entreies
  \if@field in the field of \@field \\ \fi
   \if@specialization (Specialization in \@specialization) \\ \fi


  %has to be absolutely positioned at the bottom of the page so that longer titles do not cause it to go to the next page
  %block width just has to be wide enough to fit contents on each line
  %to position textblock absolutely,  it is defined with respect to a refrence point of the middle of the page (i.e., [0.5, 0.5])
  \setstretch{2}
  \begin{textblock*}{10cm}[0.5, 0.5](10.5cm, 26.5cm) % {block width} (coords)(⟨hpos⟩,⟨vpos⟩)
      Guelph, Ontario, Canada \\
  \textcopyright\hspace{0.25em}\@author, \@date
  \end{textblock*}

 \end{center}
 \restoregeometry  %changes geometry back to what was defined
  \end{titlepage}
}


%----------------------------------------------------------------------------------------
%	Abstract
%----------------------------------------------------------------------------------------

\newenvironment{abstract}[2]{%
 \addcontentsline{toc}{chapter}{\titlecap{abstract}}  %adds abstract to toc
  \begin{center}

  {\fontsize{14}{14}\textbf{\selectfont ABSTRACT}}

   \vspace{1.5cm}

	  {\normalsize \MakeUppercase{\@title}} % University name in capitals

	   \vspace{1cm}

  \end{center}


    \setlength{\columnsep}{1.1cm} %sets spacing between columns of text
    \setstretch{1.5}
	  \begin{multicols}{2}
	  \raggedright

	  \@author \\
	  \@institution, \@year \\
	  \columnbreak

    Advisor(s): \\
	  \@advisor
	  \if@altadvisor \\ \@altadvisor  \fi

    \end{multicols}

     \setFrontmatterLinespacing{#1}

    \vspace{0.5cm}

    #2  %prints abstract
}

%----------------------------------------------------------------------------------------
%	ACKNOWLEDGEMENTS & DEDICATION
%----------------------------------------------------------------------------------------

\newenvironment{preambleItem}[3]{  %{linespacing}{title}{contents}

  \setFrontmatterLinespacing{#1}

  \begin{center}
     \fontsize{14}{14}{\textbf{\MakeUppercase{#2}}}
  \end{center}

  %settings needed for text
  \setlength{\parindent}{1cm} %paragraph indentation
  \addcontentsline{toc}{chapter}{\titlecap{#2}}

 #3
}


%newpages after end of each preamble entry
\AfterEndEnvironment{preambleItem}{\newpage}
\AfterEndEnvironment{abstract}{\newpage}


%----------------------------------------------------------------------------------------

 % Required for customising links and the PDF
\hypersetup{pdfpagemode={UseOutlines},
bookmarksopen=true, %allows bookmarks in pdf
bookmarksopenlevel=0,
hypertexnames=true, %enables counting when referencing to sections
colorlinks=true, % Set to true to enable coloring links, a nice option, false to turn them off
citecolor=green, % The color of citations
linkcolor=blue, % The color of references to document elements (sections, figures, etc)
urlcolor=magenta, % The color of hyperlinks (URLs)
pdfstartview={FitV},
unicode,
breaklinks=true
}


