\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ag7ifbook}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}

\DeclareOption{letter}{%
    \newcommand{\LetterPageSize}{}
}

\DeclareOption{quarto}{%
    \newcommand{\QuartoPageSize}{}
}

\DeclareOption{index58}{%
    \newcommand{\FiveByEightPageSize}{}
}

\DeclareOption{index46}{%
    \newcommand{\FourBySixPageSize}{}
}

\DeclareOption{index35}{%
    \newcommand{\ThreeByFivePageSize}{}
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

\ifdefined\LetterPageSize
    \RequirePackage[paperheight=11in,paperwidth=8.5in,margin=1in]{geometry}
\else\ifdefined\QuartoPageSize
    \RequirePackage[paperheight=8.5in,paperwidth=5.5in,margin=0.5in]{geometry}
\else\ifdefined\FiveByEightPageSize
    \RequirePackage[paperheight=8in,paperwidth=5in,margin=0.5in]{geometry}
\else\ifdefined\FourBySixPageSize
    \RequirePackage[paperheight=6in,paperwidth=4in,margin=0.25in]{geometry}
\else\ifdefined\ThreeByFivePageSize
    \RequirePackage[paperheight=5in,paperwidth=3in,margin=0.1in]{geometry}
\else
    \RequirePackage[margin=1in]{geometry}
\fi\fi\fi\fi\fi

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
\RequirePackage{chngcntr}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\usepackage{longtable}
\ifdefined\DRAFT
    \RequirePackage[scale=8]{draftwatermark}

    % TODO: Check if vhistory is loaded
    \renewcommand{\therevision}{Revision~\vhCurrentVersion{}~(DRAFT)}
    \renewcommand{\@date}{\vhCurrentDate}
\else
    \renewcommand{\therevision}{Revision~\vhCurrentVersion}
    \renewcommand{\@date}{\vhCurrentDate}

\fi

\setcounter{secnumdepth}{4}
\counterwithout{paragraph}{subsubsection}
\titleformat{\paragraph}[runin]{\normalfont\normalsize\bfseries}{\theparagraph}{1em}{}
\counterwithin{paragraph}{section}

\providecommand{\tightlist}{%
    \setlength{\itemsep}{0pt}\setlength{\parskip}{0pt}
}

\renewcommand{\headrulewidth}{0pt}
\setlength{\headheight}{14pt}
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
