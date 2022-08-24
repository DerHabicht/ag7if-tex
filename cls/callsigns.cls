\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ag7ifpub}

\newif\ifALL
\ALLfalse

\DeclareOption{all}{%
    \ALLtrue
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

\LoadClass[12pt]{article}

\RequirePackage{amssymb}
\RequirePackage{booktabs}
\RequirePackage{fancyhdr}
\RequirePackage[margin=1in]{geometry}
\RequirePackage{longtable}
\RequirePackage{pifont}
\ifdefined\@INFOSEC
    \RequirePackage{infosec}
    \newcommand{\@securityMark}{\InfosecLevel}
\else\ifdefined\@FOUO
    \RequirePackage{fouo}
    \newcommand{\@securityMark}{\FouoMark}
\else
    \newcommand{\@securityMark}{}
\fi\fi


\newcommand{\callsignprefix}[1]{\def\@callsignPrefix{#1}}
\newcommand{\unit}[1]{\def\@unit{#1}}
\newcommand{\license}[1]{\def\@license{#1}}

\newcommand{\unchecked}{$\square$}
\newcommand{\cmark}{\ding{51}}%
\newcommand{\checked}{\rlap{$\square$}{\raisebox{2pt}{\large\hspace{1pt}\cmark}}\hspace{-2.5pt}}
\newcommand{\blank}{\makebox[2in]{\hrulefill}}
\newcommand{\tsh}[1]{\midrule\multicolumn{5}{c}{\textbf{#1}}\\}
\newcommand{\lic}[3]{\@callsignPrefix{} & #1 & #2 & #3 & \checked{} \\}
\newcommand{\nolic}[3]{%
    \ifALL
        \@callsignPrefix{} & #1 & #2 & #3 & \unchecked{} \\
    \fi
}

\fancyhf{}
\setlength{\headheight}{15pt}
\fancypagestyle{plain}{%
    \renewcommand{\headrulewidth}{0pt}
    \ifALL
        \lhead{\@unit~Callsigns---ALL}
    \else
        \lhead{\@unit~Callsigns---\MakeUppercase{\@license}}
    \fi
    \chead{\@securityMark}
    \rhead{\@date}
    \cfoot{\@securityMark}
}
\pagestyle{plain}
