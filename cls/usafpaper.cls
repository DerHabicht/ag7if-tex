\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{usafpaper}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}
\DeclareOption{fouo}{%
    \newcommand{\FOUO}{}
}
\DeclareOption{talking}{%
    \newcommand{\@papertype}{TALKING}
}
\DeclareOption{background}{%
    \newcommand{\@papertype}{BULLET BACKGROUND}
}
\DeclareOption{outline}{%
    \newcommand{\OUTLINE}{}
    \newcommand{\@papertype}{OUTLINE}
}
\DeclareOption{short}{%
    \newcommand{\@SHORT}{}
}
\ProcessOptions\relax

\ifdefined\@papertype\else
    \newcommand{\@papertype}{POINT}
\fi

\LoadClass[12pt]{article}

\RequirePackage[
    margin=1in,
    headheight=15pt,
    footskip=0.5in
]{geometry}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{usafpub}
\ifdefined\DRAFT
    \RequirePackage{draftwatermark}
\fi

% Class Commmands
\newcommand{\authorOffice}[1]{\def\@authorOffice{#1}}
\newcommand{\authorPhone}[1]{\def\@authorPhone{#1}}
\newcommand{\typist}[1]{\def\@typist{#1}}
\newcommand{\IdentLine}{\@author/\@authorOffice/\@authorPhone/\@typist/\@date}

% Formatting
\titleformat{\section}{\normalfont\MakeUppercase}{\thesection}{0pt}{}
\titlespacing{\section}{0pt}{0pt}{0pt}

\fancypagestyle{firstpage}{%
    \fancyhf{}
    \fancyfoot[L]{\IdentLine}
}

\fancyhf{}
\fancyhead[R]{\thepage}
\ifdefined\FOUO
    \fancyhead[C]{\FouoMark}
    \fancyfoot[C]{\FouoMark}
\fi

\pagestyle{fancy}

\renewcommand{\maketitle}{%
    \thispagestyle{firstpage}
    \begin{center}
        \ifdefined\OUTLINE
            OUTLINE\vspace{1em}

            FOR\vspace{1em}

            \MakeUppercase{\@title}
        \else
            \@papertype~PAPER\vspace{1em}

            ON\vspace{1em}

            \MakeUppercase{\@title}
        \fi
    \end{center}
}

