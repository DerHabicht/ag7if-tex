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
\ProcessOptions\relax

\ifdefined\@papertype\else
    \newcommand{\@papertype}{POINT}
\fi

\LoadClass[12pt]{article}

\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{titlesec}
\RequirePackage{usafpub}
\ifdefined\DRAFT
    \RequirePackage{draftwatermark}
\fi

% Formatting
\titleformat{\section}{\normalfont\MakeUppercase}{\thesection}{0pt}{}
\titlespacing{\section}{0pt}{0pt}{0pt}

\fancypagestyle{firstpage}{%
    \fancyhf{}
    \fancyfoot[L]{\@author}
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
        \@papertype~PAPER\vspace{1em}

        ON\vspace{1em}

        \MakeUppercase{\@title}
    \end{center}
}

% Bullets
\setlist[itemize]{leftmargin=*,topsep=0pt}
\renewcommand{\labelitemi}{-}
\renewcommand{\labelitemii}{-{}-}
\renewcommand{\labelitemiii}{-{}-{}-}
\renewcommand{\labelitemiv}{-{}-{}-{}-}
