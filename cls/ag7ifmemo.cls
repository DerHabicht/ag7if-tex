\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ag7ifmemo}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}
\DeclareOption{mr}{%
    \newcommand{\MR}{}
}
\DeclareOption{very-sensitive}{%
    \newcommand{\@INFOSEC}{}
}
\DeclareOption{sensitive}{%
    \newcommand{\@INFOSEC}{}
}
\DeclareOption{somewhat-sensitive}{%
    \newcommand{\@INFOSEC}{}
}
\DeclareOption{not-sensitive}{%
    \newcommand{\@INFOSEC}{}
}
\ProcessOptions\relax

\LoadClass{usafmemo}

\ifdefined\@INFOSEC
    \RequirePackage{infosec}
    \securityMark{\InfosecLevel}
\fi

\pagestyle{usaf}

\renewcommand{\maketitle}{%
    \thispagestyle{letterhead}

    \ifdefined\FOUO
        \vspace*{0.5in}
    \else
        \vspace*{0.25in}
    \fi
    \ifdefined\@controlnumber
        \hfill\@controlnumber \par
    \fi
    \hfill\@date

    \vspace*{1em}
    MEMORANDUM FOR\hspace{0.25em}
    \ifdefined\MR
        RECORD
    \else
        \begin{minipage}[t]{0.75\textwidth}
        \MakeUppercase{\@memofor}
        \end{minipage}
    \fi

    \ifdefined\MR
    \else
        FROM:\hspace{0.25em}
        \begin{minipage}[t]{0.75\textwidth}
        \@memofrom
        \end{minipage}
    \fi

    SUBJECT:~ \@subject
}

\newcommand{\controlnumber}[1]{%
    \def\@controlnumber{#1}
}
