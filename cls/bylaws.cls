\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{bylaws}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}

\ProcessOptions\relax

\LoadClass[12pt]{article}

\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{titlesec}

\ifdefined\DRAFT
    \RequirePackage[scale=8]{draftwatermark}
\fi

\setlength{\headheight}{15pt}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\fancyhead[R]{\thepage}
\pagestyle{fancy}

% Title
\newcommand{\bylaws}[1]{%
    \def\@bylaws{#1}
}

\newcommand{\society}[2][]{%
    \def\@societyType{#1}
    \def\@societyName{#2}
}

\newcommand{\adopted}[2][]{%
    \def\@amended{#1}
    \def\@adopted{#2}
}

\renewcommand{\maketitle}{%
    \newpage
    \thispagestyle{empty}
    \null
    \vspace{2em}
    \begin{center}%
        {%
            \Large%
            \ifdefined\@bylaws
                \MakeUppercase{\@bylaws}\par\vspace{1em}
            \else
                BYLAWS\par\vspace{1em}
            \fi
            OF\par\vspace{1em}
            \ifx\@societyType\empty
                \MakeUppercase{\@societyName}
            \else
                \MakeUppercase{\@societyType}
                \MakeUppercase{\@societyName}
            \fi
            \par\vspace{1.5em}
            \normalsize
            \ifdefined\@adopted
                \ifx\@amended\empty
                    Adopted~\@adopted
                \else
                    Adopted~\@adopted, Amended:~\@amended
                \fi
            \fi
        }%
    \end{center}%
    \par\vspace{2em}
}

% Article/Section setup
\newcommand{\article}[1]{%
    \section{#1}
}
\titleformat{\section}[display]{\centering\normalfont\large}{ARTICLE~\Roman{section}}{0.5em}{}

% Paragraph setup
\setcounter{secnumdepth}{4}
\counterwithin{paragraph}{section}
\counterwithout{paragraph}{subsection}
\counterwithout{paragraph}{subsubsection}
\titleformat{\paragraph}[runin]{\normalfont\normalsize\bfseries}{Section~\theparagraph.}{1em}{}

% Enumerate setup
\setlist[enumerate]{label*=(\alph*)}
