\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ag7ifbook}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}

\DeclareOption{compliance}{%
    \newcommand{\COMPLIANCE}{}
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
\RequirePackage[notes,backend=biber]{biblatex-chicago}
\RequirePackage{booktabs}
\RequirePackage{chngcntr}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{glossaries}
\RequirePackage{makeidx}
\RequirePackage{titlesec}
\RequirePackage[tablegrid]{vhistory}
\usepackage{longtable}
\ifdefined\DRAFT
    \RequirePackage[scale=8]{draftwatermark}
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

% General Book Formatting
%% Front Matter
\newcommand{\FrontMatter}{%
    \maketitle
    \frontmatter
    \ifdefined\MANUSCRIPT\else
        \ifdefined\COMPLIANCE
            \include{compliance.tex}
        \else\fi
        \include{version_history.tex}
    \fi
    \tableofcontents
    \ifdefined\MANUSCRIPT\else
        \listoffigures
        \listoftables
    \fi
}

%% Back Matter
%%% Build Back Matter
\newcommand{\BuildBackMatter}{%
    \input{glossary.tex}
    \makeglossaries%
    \addbibresource{references.bib}
    \makeindex
}

%%% Insert Back Matter
\newcommand{\BackMatter}{%
    \backmatter%
    \ifdefined\MANUSCRIPT\else
        \printglossaries%
        \printbibliography%
        \printindex
        \BackPage{}
    \fi
}

% List formatting
%% Enumerated lists
\newcounter{usaflisti}
\renewcommand{\theusaflisti}{\alph{usaflisti}.}
\newcounter{usaflistii}
\renewcommand{\theusaflistii}{(\arabic{usaflistii})}
\newcounter{usaflistiii}
\renewcommand{\theusaflistiii}{(\alph{usaflistiii})}
\newcounter{usaflistiv}
\renewcommand{\theusaflistiv}{\underline{\arabic{usaflistiv}}}
\newcounter{usaflistv}
\renewcommand{\theusaflistv}{\underline{\alph{usaflistv}}}
\newcounter{usaflistvi}
\renewcommand{\theusaflistvi}{[\arabic{usaflistvi}]}

\renewenvironment{enumerate}{
    \ifdefined\@usaflistv
        \def\@usaflistvi{}
        \setlength{\parindent}{12em}
        \setcounter{usaflistvi}{0}
        \renewcommand{\item}{
            \par
            \refstepcounter{usaflistvi}
            \makebox[3ex][l]{\theusaflistvi}
        }
    \else\ifdefined\@usaflistiv
        \def\@usaflistv{}
        \setlength{\parindent}{10em}
        \setcounter{usaflistv}{0}
        \renewcommand{\item}{
            \par
            \refstepcounter{usaflistv}
            \makebox[3ex][l]{\theusaflistv}
        }
    \else\ifdefined\@usaflistiii
        \def\@usaflistiv{}
        \setlength{\parindent}{8em}
        \setcounter{usaflistiv}{0}
        \renewcommand{\item}{
            \par
            \refstepcounter{usaflistiv}
            \makebox[3ex][l]{\theusaflistiv}
        }
    \else\ifdefined\@usaflistii
        \def\@usaflistiii{}
        \setlength{\parindent}{6em}
        \setcounter{usaflistiii}{0}
        \renewcommand{\item}{
            \par
            \refstepcounter{usaflistiii}
            \makebox[3ex][l]{\theusaflistiii}
        }
    \else\ifdefined\@usaflisti
        \def\@usaflistii{}
        \setlength{\parindent}{4em}
        \setcounter{usaflistii}{0}
        \renewcommand{\item}{
            \par
            \refstepcounter{usaflistii}
            \makebox[3ex][l]{\theusaflistii}
        }
    \else
        \def\@usaflisti{}
        \setlength{\parindent}{2em}
        \setcounter{usaflisti}{0}
        \renewcommand{\item}{
            \par
            \refstepcounter{usaflisti}
            \makebox[3ex][l]{\theusaflisti}
        }
    \fi\fi\fi\fi\fi
}{
    \noindent
    \ignorespacesafterend
}

%% Bullets
\setlist[itemize]{leftmargin=*,topsep=0pt}

%% Outlines
\setlistdepth{7}
\ifdefined\@SHORT
    \newlist{outline}{enumerate}{5}
    \setlist[outline, 1]{label=\arabic*.}
    \setlist[outline, 2]{label=\alph*)}
    \setlist[outline, 3]{label=(\arabic*)}
    \setlist[outline, 4]{label=(\alph*)}
    \setlist[outline, 5]{label=(\roman*)}
\else
    \newlist{outline}{enumerate}{7}
    \setlist[outline, 1]{label=\Roman*.}
    \setlist[outline, 2]{label=\Alph*.}
    \setlist[outline, 3]{label=\arabic*.}
    \setlist[outline, 4]{label=\alph*)}
    \setlist[outline, 5]{label=(\arabic*)}
    \setlist[outline, 6]{label=(\alph*)}
    \setlist[outline, 7]{label=(\roman*)}
\fi



