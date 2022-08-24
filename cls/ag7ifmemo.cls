\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ag7ifmemo}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}
\DeclareOption{pm}{%
    \newcommand{\PM}{}
}
\DeclareOption{mr}{%
    \newcommand{\MR}{}
}
\DeclareOption{rfc}{%
    \newcommand{\RFC}{}
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
\DeclareOption{fouo}{%
    \newcommand{\@FOUO}{}
}
\ProcessOptions\relax

\ifdefined\@FOUO
    \LoadClass[fouo]{usafmemo}
\else
    \LoadClass{usafmemo}
\fi

\ifdefined\@INFOSEC
    \RequirePackage{infosec}
    \securityMark{\InfosecLevel}
\fi

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
    \ifdefined\PM
        POLICY MEMORANDUM
    \else\ifdefined\RFC
        REQUEST FOR COMMENT
    \else
        MEMORANDUM FOR\hspace{0.25em}
    \fi\fi
    \ifdefined\MR
        RECORD
    \else
        \begin{minipage}[t]{0.75\textwidth}
        \MakeUppercase{\@memofor}
        \end{minipage}
    \fi

    \ifdefined\PM
    \else\ifdefined\MR
    \else\ifdefined\RFC
    \else
        FROM:\hspace{0.25em}
        \begin{minipage}[t]{0.75\textwidth}
        \@memofrom
        \end{minipage}
    \fi\fi\fi

    SUBJECT:~ \@subject
}

\newcommand{\controlnumber}[1]{%
    \def\@controlnumber{#1}
}