\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{contbook}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}
\DeclareOption{very-sensitive}{%
    \newcommand{\OplanInfosecLvlSet}{}
    \newcommand{\OplanLvlVerySensitive}{}
}
\DeclareOption{sensitive}{%
    \newcommand{\OplanInfosecLvlSet}{}
    \newcommand{\OplanLvlSensitive}{}
}
\DeclareOption{somewhat-sensitive}{%
    \newcommand{\OplanInfosecLvlSet}{}
    \newcommand{\OplanLvlSomewhatSensitive}{}
}
\DeclareOption{not-sensitive}{%
    \newcommand{\OplanInfosecLvlSet}{}
    \newcommand{\OplanLvlNotSensitive}{}
}
\DeclareOption{fouo}{%
    \newcommand{\FOUO}{}
}
\ProcessOptions\relax

\LoadClass[12pt]{book}

\RequirePackage[dvipsnames]{xcolor}

\RequirePackage{afterpage}
\RequirePackage{booktabs}
\RequirePackage{emptypage}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage{titlesec}

\ifdefined\FOUO
    \RequirePackage{fouo}
    \def\@securityMark{\FouoMark}
\else\ifdefined\OplanInfosecLvlSet
    \def\@securityMark{PLACEHOLDER}
    \RequirePackage{usafpub}
    \ifdefined\OplanLvlVerySensitive
        \RequirePackage[very-sensitive]{infosec}
    \else\ifdefined\OplanLvlSensitive
        \RequirePackage[sensitive]{infosec}
    \else\ifdefined\OplanLvlSomewhatSensitive
        \RequirePackage[somewhat-sensitive]{infosec}
    \else\ifdefined\OplanLvlNotSensitive
        \RequirePackage[not-sensitive]{infosec}
    \fi\fi\fi\fi
    \def\@securityMark{\InfosecLevel}
\else
    \RequirePackage{usafpub}
\fi\fi

\ifdefined\DRAFT
    \RequirePackage{draftwatermark}
    \RequirePackage[draft]{pdfpages}
\else
    \RequirePackage{pdfpages}
\fi

\renewcommand{\thesection}{\arabic{section}}
\titleformat{\section}{\cleardoublepage\normalfont\Large\bfseries}{\thesection.}{1em}{}
\renewcommand{\thesubsection}{\thesection.\alph{subsection}}
\titleformat{\subsection}{\normalfont\large\bfseries}{\thesubsection.}{1em}{}

\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancypagestyle{plain}{\fancyhf{}}
\pagestyle{fancy}

\renewcommand{\title}[2][Continuity Book]{%
    \def\@bookType{#1}
    \def\@title{#2}
}
\newcommand{\unitCharter}[1]{\def\@unitCharter{#1}}

\newcommand{\titleSeal}[1]{\def\@titleSeal{#1}}

\newcommand{\sealTopLeft}[1]{\def\@sealTopLeft{#1}}
\newcommand{\sealTopCenter}[1]{\def\@sealTopCenter{#1}}
\newcommand{\sealTopRight}[1]{\def\@sealTopRight{#1}}
\newcommand{\sealBottomLeft}[1]{\def\@sealBottomLeft{#1}}
\newcommand{\sealBottomCenter}[1]{\def\@sealBottomCenter{#1}}
\newcommand{\sealBottomRight}[1]{\def\@sealBottomRight{#1}}

\renewcommand{\maketitle}{%
\begin{titlepage}
\begin{center}
    \Huge
    \@title

    \@bookType

    \ifdefined\@sealTopLeft
        \includegraphics[height=1.5in]{\@sealTopLeft}
    \fi
    \hfill
    \ifdefined\@sealTopCenter
        \includegraphics[height=1.5in]{\@sealTopCenter}
    \fi
    \hfill
    \ifdefined\@sealTopRight
        \includegraphics[height=1.5in]{\@sealTopRight}
    \fi
    
    \vfill

    \includegraphics[height=3in]{\@titleSeal}

    \vfill

    \ifdefined\@sealBottomLeft
        \includegraphics[height=1.5in]{\@sealBottomLeft}
    \fi
    \hfill
    \ifdefined\@sealBottomCenter
        \includegraphics[height=1.5in]{\@sealBottomCenter}
    \fi
    \hfill
    \ifdefined\@sealBottomRight
        \includegraphics[height=1.5in]{\@sealBottomRight}
    \fi
    
    \Large
    \@unit

    \@unitCharter
\end{center}
\end{titlepage}

\cleardoublepage

\thispagestyle{letterhead}

\vspace*{3em}

\noindent
\MakeUppercase{\@title~\@bookType}
}
