%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Friggeri Resume/CV
% XeLaTeX Template
% Version 1.2 (3/5/15)
%
% This template has been downloaded from:
% http://www.LaTeXTemplates.com
%
% Original author:
% Adrien Friggeri (adrien@friggeri.net)
% https://github.com/afriggeri/CV
%
% License:
% CC BY-NC-SA 3.0 (http://creativecommons.org/licenses/by-nc-sa/3.0/)
%
% Important notes:
% This template needs to be compiled with XeLaTeX and the bibliography, if used,
% needs to be compiled with biber rather than bibtex.
%
% Multiple modifications:
% Miguel Angel López Hernández (miguel@gulev.org)
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{friggeri-cv}[2012/04/30 CV class]
\NeedsTeXFormat{LaTeX2e}

\DeclareOption{print}{\def\@cv@print{}}
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
}
\ProcessOptions\relax
\LoadClass{article}

% Packages
\usepackage{multicol}


%%%%%%%%%%
% Colors %
%%%%%%%%%%

\RequirePackage{xcolor}

\definecolor{white}{RGB}{255,255,255}

\definecolor{darkgray}{HTML}{333333}
\definecolor{gray}{HTML}{4D4D4D}
\definecolor{lightgray}{HTML}{999999}

\definecolor{green}{HTML}{C2E15F}
\definecolor{orange}{HTML}{FDA333}
\definecolor{purple}{HTML}{D3A4F9}
\definecolor{red}{HTML}{FB4485}
\definecolor{blue}{HTML}{6CE0F1}

\ifdefined\@cv@print
  \colorlet{green}{gray}
  \colorlet{orange}{gray}
  \colorlet{purple}{gray}
  \colorlet{brown}{gray}
  \colorlet{red}{gray}
  \colorlet{blue}{gray}
  \colorlet{fillheader}{white}
  \colorlet{header}{gray}
\else
  \colorlet{fillheader}{gray}
  \colorlet{header}{white}
\fi
\colorlet{textcolor}{gray}
\colorlet{headercolor}{gray}

%%%%%%%%%
% Fonts %
%%%%%%%%%

\RequirePackage[quiet]{fontspec}
\RequirePackage{unicode-math}

\RequirePackage[activate={true,nocompatibility},final,factor=1100,stretch=10,shrink=10,expansion=false,verbose=silent]{microtype}


\newfontfamily\bodyfont[]{Roboto}
\newfontfamily\thinfont[]{Roboto Thin}
\newfontfamily\headingfont[]{Roboto Condensed}
% \newfontfamily\bodyfont[]{Open Sans Condensed}
% \newfontfamily\thinfont[]{Open Sans Condensed Light}
% \newfontfamily\headingfont[]{Open Sans Condensed}

\defaultfontfeatures{Mapping=tex-text}
\setmainfont[
  Mapping=tex-text,
  Color=textcolor,
  ItalicFont={Roboto Light Italic},
  BoldItalicFont={Roboto Medium Italic}
]{Roboto Light}
% \setmainfont[Mapping=tex-text, Color=textcolor]{Open Sans Condensed Light}

%\setmathfont{XITS Math}

\DeclareSymbolFont{extraup}{U}{zavm}{m}{n}
\DeclareMathSymbol{\varheart}{\mathalpha}{extraup}{86}
\DeclareMathSymbol{\vardiamond}{\mathalpha}{extraup}{87}

%%%%%%%%%%
% Language %
%%%%%%%%%%
\RequirePackage{polyglossia}
\setdefaultlanguage[variant=us]{english}


%%%%%%%%%%
% Header %
%%%%%%%%%%

\RequirePackage{tikz}

\newcommand{\rolefont}{%
  \fontsize{14pt}{24pt}\selectfont%
  \thinfont%
  \color{white}%
}

\newcommand{\header}[3]{%
  \begin{tikzpicture}[remember picture,overlay]
    \node [rectangle, fill=fillheader, anchor=north, minimum width=\paperwidth, minimum height=4cm] (box) at (current page.north){};
    \node [anchor=center] (name) at (box) {%
      \fontsize{40pt}{72pt}\color{header}%
      {\thinfont #1} {\bodyfont  #2}
    };
    \node [anchor=north] at (name.south) {%
      \fontsize{14pt}{24pt}\color{header}%
      \thinfont #3%
    };
  \end{tikzpicture}
  \vspace{2.5cm}
  \vspace{-2\parskip}
}


%%%%%%%%%%%%%
% Structure %
%%%%%%%%%%%%%
\RequirePackage{parskip}

\newcounter{colorCounter}
\def\@sectioncolor#1#2#3{%
  {%
    \color{%
      \ifcase\value{colorCounter}%
        blue\or%
        red\or%
        orange\or%
        purple\or%
        green\or%
        brown\else%
        headercolor\fi%
    } #1#2#3%
  }%
  \stepcounter{colorCounter}%
}

\renewcommand{\section}[1]{
  \par\vspace{\parskip}
  {%
    \Large\headingfont\color{headercolor}%
    \@sectioncolor #1%
  }
  \par\vspace{\parskip}
}

\renewcommand{\subsection}[1]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #1}
  \par\vspace{.25\parskip}%
}

\renewcommand{\subsubsection}[2]{
  \par\vspace{.5\parskip}%
  {\Large\headingfont\color{headercolor} #2}
  \par\vspace{.25\parskip}%
}

\pagestyle{empty}


%%%%%%%%%%%%%%%%%%%%
% List environment %
%%%%%%%%%%%%%%%%%%%%

\setlength{\tabcolsep}{0pt}
\newenvironment{entrylist}{%
  \begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}
}{%
  \end{tabular*}
}
\renewcommand{\bfseries}{\headingfont\color{headercolor}}
\newcommand{\entry}[4]{%
  #1&\parbox[t]{11.8cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\\%
    #4\vspace{\parsep}%
  }\\}
  \newcommand{\entryedu}[3]{%
  #1&\parbox[t]{11cm}{%
    \textbf{#2}%
    \hfill%
    {\footnotesize\addfontfeature{Color=lightgray} #3}\vspace{\parsep}%
  }\\}

%%%%%%%%%%%%%%
% Side block %
%%%%%%%%%%%%%%

\RequirePackage[absolute,overlay]{textpos}
\setlength{\TPHorizModule}{1cm}
\setlength{\TPVertModule}{1cm}
\newenvironment{aside}{%
  \let\oldsection\section
  \renewcommand{\section}[1]{
    \par\vspace{\baselineskip}{\Large\headingfont\color{headercolor} ##1}
  }
  \begin{textblock}{3.6}(1.5, 4.33)
  \begin{flushright}
  \obeycr
}{%
  \restorecr
  \end{flushright}
  \end{textblock}
  \let\section\oldsection
}


%%%%%%%%%%%%%%%%
% Social icons %
%%%%%%%%%%%%%%%%

\RequirePackage{fontawesome}

% Add telegram logo to fontawesome
\expandafter\def\csname faicon@telegram\endcsname {\symbol{"F2C6}}\def\faTelegram {{\FA\csname faicon@telegram\endcsname}}

% Add instagram logo to fontawesome
\expandafter\def\csname faicon@instagram\endcsname {\symbol{"F16D}}  \def\faInstagramSquare {{\FA\csname faicon@instagram\endcsname}}

\newcommand{\email}[1]{%
  \href{mailto:#1}{{\nfEnvelopeSquare} #1}
}

\newcommand{\website}[1]{%
  \href{http://#1}{{\nfWebsite} #1}
}

\newcommand{\twitter}[1]{%
  \social{https://twitter.com}{\faTwitterSquare}{#1}
}

\newcommand{\telegram}[1]{%
  \social{https://t.me}{\faTelegram}{#1}
}

\newcommand{\instagram}[1]{%
  \social{https://instagram.com}{\faInstagramSquare}{#1}
}

\newcommand{\facebook}[1]{%
  \social{https://facebook.com}{\faFacebookSquare}{#1}
}

\newcommand{\linkedin}[1]{%
  \social{https://linkedin.com/in}{\faLinkedinSquare}{#1}
}

\newcommand{\github}[1]{%
  \social{https://github.com}{\faGithubSquare}{#1}
}

\newcommand{\youtube}[1]{%
  % \social{https://www.youtube.com/channel/UC65BfP4-btyd6MfQtBSEceA}{\faYoutubeSquare}{#1}
  \href{https://www.youtube.com/channel/UC65BfP4-btyd6MfQtBSEceA}{{\faYoutubeSquare} / #1}
}

\newcommand{\social}[3]{
  \href{#1/#3}{#2 \raisebox{0.1ex}{\scriptsize/} #3}
}

%%%%%%%%%%%%%%%
\newfontfamily{\NF}{Hack Nerd Font}

\def\nfWebsite{{\NF \symbol{"FA9E}}}
\def\nfEnvelopeSquare{{\NF \symbol{"F199}}}

\def\nfDebian{{\NF \symbol{"F306}}}
\def\nfRedHat{{\NF \symbol{"F316}}}
\def\nfArchLinux{{\NF \symbol{"F303}}}
\def\nfBsd{{\NF \symbol{"F30C}}}
\def\nfWindows{{\NF \symbol{"F17A}}}
\def\nfURL{{\NF \symbol{"F08E}}}

%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%
% Other tweaks %
%%%%%%%%%%%%%%%%

\RequirePackage[left=6.1cm,top=2cm,right=1.5cm,bottom=1cm,nohead,nofoot]{geometry}
\RequirePackage[hidelinks]{hyperref}
\hypersetup{
    colorlinks=false,
    linkcolor=red,
    citecolor=red,
    filecolor=red,
    urlcolor = red}

% A fix for \href{}{} colors not working with fontspec
\makeatletter
\def\HyColor@@@@UseColor#1\@nil{\addfontfeatures{Color=#1}}
\makeatother
