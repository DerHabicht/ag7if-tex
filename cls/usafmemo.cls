\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{usafmemo}

% Document Setup:
%
% \documentclass[<DRAFT>,<cap>,<mr>,<fouo>]{usafmemo}
%
% \seal{<SEAL_PATH>} % Optional if using the <cap> document option
% \unitPatch{<UNIT_PATCH_PATH>}
% \unit{<UNIT>}
% \address{<UNIT_ADDRESS> \\ <CITY>, <STATE> <ZIP>}
%
% \memofor{<MEMO_FOR_LINE>} % Ignored if using the <mr> document option
% \memofrom{<MEMO_FROM_LINE>}
% \subject{<SUBJECT>}
%
% \begin{document}
% \maketitle
%
% \paragraph{} <CONTENT>
%
% \paragraph{} <CONTENT>
%
% \signature{<NAME>}{<GRADE>}{<DUTY_ASSIGNMENT>} % For hand-signing after printing
% \textsign{<NAME>}{<GRADE>}{<DUTY_ASSIGNMENT>} % Inserts "// SIGNED //" above the signature block
% \digisign{<NAME>}{<GRADE>}{<DUTY_ASSIGNMENT>}{<SIG_IMG_PATH>} % For including an image of the signature
%
% \attachment{<ATTACHMENT>} % For a single attachment
% \attachments{%
%   \item <ATTACHMENT_1>
%   \item <ATTACHMENT_2>
% } % For multiple attachments
%
% \cc{%
%   <CC_TO_1> \\
%   <CC_TO_2>
% }
%
% \distribution{%
%   <DIST_TO_1> \\
%   <DIST_TO_2>
% }
% \end{document}

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
\RequirePackage[
    margin=1in,
    headheight=15pt,
    footskip=0.5in
]{geometry}
\RequirePackage{nth}
\RequirePackage{usafpub}
\RequirePackage{xstring}
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

% Environments
%% Indorsement Format
\newcounter{indorsement}
\newenvironment{indorsement}[7][reg]{%
\stepcounter{indorsement}
\def\@sigType{#1}
\def\@indName{#5}
\def\@indRank{#6}
\def\@indTitle{#7}
\vspace{2em}

\nth{\arabic{indorsement}} Ind, #2\hfill{}#3

MEMORANDUM FOR \MakeUppercase{#4}
}{%
    \IfEq{\@sigType}{text}{%
        \textsign{\@indName}{\@indRank}{\@indTitle}
    }{%
        \ifx\@indRank\empty
            \signature{\@indName}{}{\@indTitle}
        \else
            \signature{\@indName}{\@indRank}{\@indTitle}
        \fi
    }
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
