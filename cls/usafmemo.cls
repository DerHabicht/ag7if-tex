\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{usafmemo}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}
\DeclareOption{mr}{%
    \newcommand{\MR}{}
}
\DeclareOption{fouo}{%
    \newcommand{\FOUO}{}
}
\ProcessOptions\relax

\LoadClass[12pt]{article}

\RequirePackage{enumerate}
\RequirePackage{usafpub}
\ifdefined\FOUO
    \RequirePackage{fouo}
    \securityMark{\FouoMark}
\fi
\ifdefined\DRAFT
    \RequirePackage{draftwatermark}
\fi

\pagestyle{usaf}

% Header
% Paragraphs
\newcounter{memopar}
\renewcommand{\thememopar}{\arabic{memopar}.}
\newenvironment{body}{
    \setlength{\parindent}{0pt}
    \setcounter{memopar}{0}
    \bigskip
    \renewcommand{\item}{
        \par
        \refstepcounter{memopar}
        \makebox[2ex][l]{\thememopar}
    }
}{
    \bigskip
    \noindent
    \ignorespacesafterend
}

% Commands
\renewcommand{\date}[1]{%
    \def\@date{#1}
}

\renewcommand{\maketitle}{%
    \thispagestyle{letterhead}

    \ifdefined\FOUO
        \vspace*{0.5in}
    \else
        \vspace*{0.25in}
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

    \ifdefined\MR\else
        FROM:\hspace{0.25em}
        \begin{minipage}[t]{0.75\textwidth}
        \@memofrom
        \end{minipage}
    \fi

    SUBJECT:~ \@subject
}

\newcommand{\memofor}[1]{%
    \def\@memofor{#1}
}

\newcommand{\memofrom}[1]{%
    \def\@memofrom{#1}
}

\newcommand{\subject}[1]{%
    \def\@subject{#1}
}
