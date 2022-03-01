\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ag7ifbook}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}

\DeclareOption{very-sensitive}{%
    \newcommand{\VerySensitiveDoc}{}
}

\DeclareOption{sensitive}{%
    \newcommand{\SensitiveDoc}{}
}

\DeclareOption{somewhat-sensitive}{%
    \newcommand{\SomewhatSensitiveDoc}{}
}

\DeclareOption{not-sensitive}{%
    \newcommand{\NotSensitiveDoc}{}
}
\ProcessOptions\relax

\LoadClass{book}

\RequirePackage[tocentry]{vhistory}
\RequirePackage[margin=1in]{geometry}
\ifdefined\VerySensitiveDoc
    \RequirePackage[very-sensitive]{infosec}
\else\ifdefined\SensitiveDoc
    \RequirePackage[sensitive]{infosec}
\else\ifdefined\SomewhatSensitiveDoc
    \RequirePackage[somewhat-sensitive]{infosec}
\else\ifdefined\NotSensitiveDoc
    \RequirePackage[not-sensitive]{infosec}
\fi\fi\fi\fi
\RequirePackage{ag7ifpub}
\RequirePackage{booktabs}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\usepackage{longtable}
\ifdefined\DRAFT
    \RequirePackage{draftwatermark}

    \renewcommand{\therevision}{%
        DRAFT
}

\fi

\setcounter{secnumdepth}{4}
\counterwithout{paragraph}{subsubsection}
\titleformat{\paragraph}[runin]{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}

\providecommand{\tightlist}{%
    \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}
}

\renewcommand{\headrulewidth}{0pt}



\fancypagestyle{plain}{%
    \fancyhf{}
    \ifdefined\InfosecLevel
        \chead{\large\InfosecLevel}
        \cfoot{\large\InfosecLevel}
    \fi
    \fancyfoot[RO,LE]{\thepage}
}

\fancyhf{}
\ifdefined\InfosecLevel
    \chead{\large\InfosecLevel}
    \cfoot{\large\InfosecLevel}
\fi
\fancyhead[RO,LE]{\chaptermark}
\fancyfoot[RO,LE]{\thepage}

\pagestyle{fancy}
