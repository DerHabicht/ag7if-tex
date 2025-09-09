\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ag7ifjournal}

\DeclareOption{draft}{%
    \newcommand{\@draft}{}
}
\DeclareOption{very-sensitive}{%
    \newcommand{\@PlanInfosecLvlSet}{}
}
\DeclareOption{sensitive}{%
    \newcommand{\@PlanInfosecLvlSet}{}
}
\DeclareOption{somewhat-sensitive}{%
    \newcommand{\@PlanInfosecLvlSet}{}
}
\DeclareOption{not-sensitive}{%
    \newcommand{\@PlanInfosecLvlSet}{}
}
\DeclareOption{tlp-red}{%
    \newcommand{\@PlanTlpLvlSet}{}
    \newcommand{\@LVLRED}{}
}
\DeclareOption{tlp-amber-strict}{%
    \newcommand{\@PlanTlpLvlSet}{}
    \newcommand{\@LVLAMBERSTRICT}{}
}
\DeclareOption{tlp-amber}{%
    \newcommand{\@PlanTlpLvlSet}{}
    \newcommand{\@LVLAMBER}{}
}
\DeclareOption{tlp-green}{%
    \newcommand{\@PlanTlpLvlSet}{}
    \newcommand{\@LVLGREEN}{}
}
\DeclareOption{tlp-clear}{%
    \newcommand{\@PlanTlpLvlSet}{}
}

\ProcessOptions\relax

\LoadClass[12pt, paper=letter, BCOR=0in, DIV=calc]{scrbook}

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{booktabs}
\RequirePackage{cleveref}
\RequirePackage{nth}
\RequirePackage{tabularx}
\RequirePackage{scrlayer-scrpage}

\clearpairofpagestyles
\ifoot*{\pagemark}

\ifdefined\@PlanInfosecLvlSet
    \RequirePackage{infosec}

    \chead*{\InfosecLevel}
    \cfoot*{\InfosecLevel}

    \def\@securityMark{\InfosecLevel}
    \ifdefined\@PlanTlpLvlSet
        \RequirePackage{tlp}
        \ohead*{\TLPLevel}
        \ofoot*{\TLPLevel}
    \fi
\fi

\ifdefined\@draft
    \RequirePackage{draftwatermark}
\fi

\newcounter{ind}
\newenvironment{indorsements}{\setcounter{ind}{0}}{}
\newcommand{\Indorsement}[3]{%
    \stepcounter{ind}
    \vspace{1em}

    \begin{tabularx}{\textwidth}{rX}
        \toprule
        \multicolumn{2}{c}{\textbf{\nth{\arabic{ind}} Indorsement}} \\
        \textbf{Date}        & #1 \\
        \textbf{Indorsement} & #3 \\
        \textbf{Signed}      & #2 \\
        \bottomrule
    \end{tabularx}
}

\newcommand{\MFR}[5][]{%
    \def\temp{#1}
    \ifx\temp\empty%
        \begin{tabularx}{\textwidth}{rX}
            \toprule
            \textbf{Sensitivity} & #2 \\
            \textbf{Date}        & #3 \\
            \textbf{Subject}     & #4 \\
            \textbf{Signed}      & #5 \\
            \bottomrule
        \end{tabularx}
    \else
        \begin{tabularx}{\textwidth}{rX}
            \toprule
            \textbf{MFR}         & #1 \\
            \textbf{Sensitivity} & #2 \\
            \textbf{Date}        & #3 \\
            \textbf{Subject}     & #4 \\
            \textbf{Signed}      & #5 \\
            \bottomrule
        \end{tabularx}
    \fi
}

\newcommand{\MfrSection}[5]{%
    \section{MFR~#1}\label{mfr:#1}

    \MFR{#2}{#3}{#4}{#5}
}

