\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ag7ifref}

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

\LoadClass[10pt]{extbook}

\RequirePackage{booktabs}
\RequirePackage{fancyhdr}
\RequirePackage{graphicx}
\RequirePackage[
    paperwidth=5in, 
    paperheight=8in, 
    top=0.5in,
    bottom=0.5in,
    left=0.25in,
    right=0.25in
]{geometry}
\RequirePackage{longtable}
\RequirePackage{tocloft}
\RequirePackage[table]{xcolor}

\ifdefined\DRAFT
    \RequirePackage{draftwatermark}
\fi

% List separators
\newcommand{\ListSep}{\bottomrule\toprule}
\newcommand{\ListSepBreak}{\bottomrule\pagebreak\toprule}
\newcommand{\SublistSep}{\midrule}
\newcommand{\SublistSepBreak}{\midrule\pagebreak\midrule}

% Reference tables commands
\newenvironment{refTable}
    {\begin{longtable}{ll}\toprule}
    {\bottomrule\end{longtable}}

\newcommand{\RefCategory}[1]{%
    \multicolumn{2}{l}{%
        \large{\textbf{#1}}
    }\addcontentsline{toc}{chapter}{#1}
    \\
    \midrule
}
\newcommand{\RefGroup}[1]{%
    \multicolumn{2}{l}{%
        \textbf{#1}
    }\addcontentsline{toc}{section}{#1}
    \\
}
\newcommand{\RefEntry}[2]{#1 & #2 \\}
\newcommand{\RefComment}[1]{\multicolumn{2}{l}{\textit{#1}}\\}

% Control bank reference commands
\newenvironment{controlBank}
    {\begin{longtable}{rl}\toprule}
    {\bottomrule\end{longtable}}

\newcommand{\ControlGroup}[1]{%
    \multicolumn{2}{l}{%
        \large{\textbf{#1}}
    }\addcontentsline{toc}{chapter}{#1}
    \\
    \midrule
}
\newcommand{\ControlBank}[1]{%
    \multicolumn{2}{l}{%
        \textbf{#1}
    }\addcontentsline{toc}{section}{#1}
    \\
}
\newcommand{\ControlEntry}[2]{#1 & #2 \\}

% Checklist commands
\newenvironment{checklist}
    {\begin{longtable}{llr}\toprule}
    {\bottomrule\end{longtable}}

\newcommand{\Checklist}[1]{%
    \multicolumn{3}{l}{%
        \large{\textbf{#1}}
    }\addcontentsline{toc}{chapter}{#1}
    \\
    \midrule
}
\newcommand{\Sublist}[1]{%
    \multicolumn{3}{l}{%
        \textbf{#1}
    }\addcontentsline{toc}{section}{#1}
    \\
}
\newcommand{\Step}[3]{#1 & \if\relax\detokenize{#2}\relax\else(#2)\fi & #3\\}
\newcommand{\StepHL}[3]{\rowcolor{lightgray} #1 & \if\relax\detokenize{#2}\relax\else(#2)\fi & #3\\}
\newcommand{\ChecklistComment}[1]{\multicolumn{3}{l}{\underline{\textit{#1}}}\\}
\newcommand{\ChecklistCommentHL}[1]{\rowcolor{lightgray} \multicolumn{3}{l}{\underline{\textit{#1}}}\\}

%Page formatting
\fancypagestyle{plain}{\fancyhf{}}
\renewcommand{\headrulewidth}{0pt}
\fancyhf{}
\fancyfoot[C]{\thepage}
\pagestyle{fancy}

% TOC formatting
\renewcommand{\contentsname}{}
\renewcommand{\cftbeforetoctitleskip}{0pt}
\renewcommand{\cftaftertoctitleskip}{-20pt}
%\renewcommand{\cftparskip}{-3pt}
%\renewcommand{\cftchapfont}{\normalsize\bfseries}
%\renewcommand{\cftsecfont}{\normalsize}
%\renewcommand{\cftchappagefont}{\normalsize\bfseries}
%\renewcommand{\cftsecpagefont}{\normalsize}

% Titlepage definitions
\newcommand{\controlNumber}[1]{%
    \def\@controlNumber{#1}
}

\newcommand{\revision}[1]{%
    \def\@revision{#1}
}

\newcommand{\seal}[1]{%
    \def\@seal{#1}
}

\renewcommand{\maketitle}{%
    % TODO: Rework infosec to handle 5x8 pages
    %\ifdefined\FOUO
    %    \FouoCoverPage
    %\else\ifdefined\OplanInfosecLvlSet
    %    \InfosecCover
    %\fi\fi

    \thispagestyle{plain}
    \begin{center}
        \vspace*{\fill}

        \Large
        \@controlNumber%
        
        \vspace{1em}

        \@title%

        \vspace{4em}

        \includegraphics[height=2in]{\@seal}
        
        \vspace{2em}
        
        Revision\ \@revision

        \vfill
    \end{center}   
    
    \cleardoublepage
}
