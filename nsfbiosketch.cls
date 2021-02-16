%% nsfbiosketch.cls 
%% Copyright 2016 Dan DeBlasio
%
% This is an extension of Paul M. Magwene's nihbiosketch.cls and is 
% extended under the LaTeX Project Public License, version 1.3
% A copy of the original work can be foun in the nihbiosketch folder
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   http://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 008/05/04 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Paul M. Magwene
%
% This work consists of the files nihbiosketch.cls


\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{nsfbiosketch}[2020 NSF Biosketch Class]

%------------------------------------------------------------------------------

\ProcessOptions\relax
\LoadClass[11pt,letterpaper]{article}

%------------------------------------------------------------------------------
% Packages

\RequirePackage{etoolbox}
\RequirePackage[letterpaper]{geometry}
\RequirePackage{ifxetex, ifluatex}   % requires fontspec, so either XeTeX or LuaTeX
\RequirePackage{fontspec}
\setmainfont{TimesNewRoman}
%\RequirePackage{microtype}
\RequirePackage{setspace}
\setstretch{.9}

\RequirePackage{tabu}
\RequirePackage{ifthen}
\RequirePackage{ulem}
\RequirePackage{fancyhdr}
\pagestyle{fancy}
\fancyhead{}
\fancyfoot{}
\lfoot{BS-\thepage{} of 2}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}


\RequirePackage{xspace}
\RequirePackage[resetlabels]{multibib}


\RequirePackage{enumitem}
\setlist[enumerate,2]{label=\alph*.,itemsep=0pt,parsep=1pt,partopsep=1pt}


\RequirePackage{titlesec}
\renewcommand{\thesection}{\Alph{section}.}
\titleformat{\section}[hang]{\normalfont\bfseries}{\thesection}{0.5em}{}  % section style
\titleformat{\subsection}[hang]{\normalfont\bfseries}{\thesubsection}{0.5em}{\uline}  % subsection style
\titleformat{\subsubsection}[hang]{\itshape}{\thesubsubsection}{0.5em}{}  % subsubsection style

\titlespacing{\section}{0pt}{2ex}{1ex}
\titlespacing{\subsection}{0pt}{1.25ex}{0.5ex}
\titlespacing{\subsubsection}{0pt}{1.25ex}{0.5ex}

\PassOptionsToPackage{urlcolor=blue,colorlinks=true,breaklinks=true}{hyperref}
\RequirePackage{hyperref}
\urlstyle{same}

\renewcommand\@biblabel[1]{#1.}

%------------------------------------------------------------------------------
% New commands and environments

\newcommand{\@name}{}
\newcommand{\@eracommons}{}
\newcommand{\@position}{}
\newcommand{\@orcid}{}
\newcommand{\@nsfid}{}

\newcommand{\name}[1]{\renewcommand{\@name}{#1}}
\newcommand{\eracommons}[1]{\renewcommand{\@eracommons}{#1}}
\newcommand{\position}[1]{\renewcommand{\@position}{#1}}
\newcommand{\orcid}[1]{\renewcommand{\@orcid}{#1}}
\newcommand{\nsfid}[1]{\renewcommand{\@nsfid}{#1}}

\newcommand{\pgline}{\noindent\makebox[\linewidth]{\rule{\textwidth}{0.5pt}}\newline}

\newcommand{\piinfo}
{
{\centering
\textbf{NSF BIOGRAPHICAL SKETCH}\\
}
\vspace{3px}
%\rule{\textwidth}{1px}
%\vspace{-7px}
%\pgline
\hrule
\vspace{2.5px}
NAME: \@name
\vspace{2.5px}
\hrule
\vspace{2.5px}
%\pgline
%\pgline
%\noindent\rule{\textwidth}{1pt}
%eRA COMMONS USER NAME (credential, e.g., agency login): \@eracommons\\
NSF ID: \@nsfid\\
ORCID: \@orcid
\vspace{2.5px}
\hrule
\vspace{2.5px}
%\pgline
POSITION TITLE \& INSTITUTION: \@position
\vspace{1px}
\hrule
\vspace{10px}
%\pgline
}

\newcommand{\grantinfo}[6]
{\begin{tabular}{@{}lll@{}}
{#1} & {#2} & {#3} \\
\end{tabular}
\newline{#4}\newline{#5}\newline{#6}}

\newenvironment{education}
{%
\bgroup\centering
\tabulinesep=1mm
\tabcolsep=0mm
\begin{tabu} to \textwidth {X[1.3,c,m]|X[.7,c,m]|X[2.5,c,m]|X[1.1,c,m]|X[0.9,c,m]}
\hline
%\rowfont[c]{}               % for the header only we want all the text centered
\footnotesize INSTITUTION &%
\footnotesize LOCATION &%
\footnotesize MAJOR / AREA OF STUDY &%
\footnotesize DEGREE&% 
\footnotesize YEAR\\
\vspace{-1.5em}
\footnotesize&\footnotesize&\footnotesize&\footnotesize(if applicable) &\footnotesize YYYY\\
\hline}
{\end{tabu}\egroup}

\newenvironment{datetbl}
{\tabulinesep=1mm
\tabcolsep=0mm
\begin{tabu} to 6in{X[1.1,l]X[4.9,l,p]}
}
{\end{tabu}}

\newenvironment{statement}
{\setlength\parindent{2em}}
{\setlength\parindent{0pt}}


%------------------------------------------------------------------------------
% setup document geometry    


% no paragraph indentation
\setlength\parindent{0pt}

\geometry{left=1in,right=1in,top=1in,bottom=1.68in} % this should be the last call

%------------------------------------------------------------------------------

\AfterEndPreamble{\piinfo}

