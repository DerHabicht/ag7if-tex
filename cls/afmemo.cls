\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{afmemo}

\DeclareOption{cap}{%
    \newcommand{\CAP}{}
}
\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}
\DeclareOption{fouo}{%
    \newcommand{\FOUO}{}
}
\DeclareOption{mr}{%
    \newcommand{\MR}{}
}
\ProcessOptions\relax

\LoadClass[12pt]{article}

\RequirePackage{enumerate}
\RequirePackage{fancyhdr}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{mathptmx}
\RequirePackage[absolute]{textpos}
\RequirePackage[dvipsnames]{xcolor}

\ifdefined\DRAFT
    \RequirePackage{draftwatermark}
\fi

\ifdefined\FOUO
    \RequirePackage[%
        top=0.5in, 
        bottom=1.0in, 
        left=1in, 
        right=1in, 
        includehead,
        voffset=-0.25in,
        footskip=1.0in
    ]{geometry}
\else
    \RequirePackage[%
        top=0.5in, 
        bottom=1.0in, 
        left=1in, 
        right=1in, 
        includehead,
        footskip=0in
    ]{geometry}
\fi

% Formatting
\setlength{\parskip}{10pt}
\setlength{\parindent}{0pt}

\newlength{\sigoffset}
\setlength{\sigoffset}{3.75in}

\renewcommand{\headrulewidth}{0pt}

\fancypagestyle{letterhead}{%
    \fancyhf{}
    \ifdefined\CAP
        \def\@seal{CAP_Seal.jpg}       
        \fancyhead[C]{\CapLetterHead}
        \LetterHeadSeal{}
        \LetterHeadPatch{}
    \else
        \fancyhead[C]{\PlainLetterHead}
        \LetterHeadSeal{}
    \fi
}

\fancyhf{}
\fancyhead[R]{\thepage}
\ifdefined\FOUO
    \fancyhead[C]{\FouoMark}
    \fancyfoot[C]{\FouoMark}
\fi

\pagestyle{fancy}

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

\newcounter{usaflist}
\renewcommand{\theusaflist}{\alph{usaflist}.}
\newenvironment{UsafList}{
    \setlength{\parindent}{2em}
    \setcounter{usaflist}{0}
    \renewcommand{\item}{
        \par
        \refstepcounter{usaflist}
        \makebox[2ex][l]{\theusaflist}
    }
}{
    \bigskip
    \noindent
    \ignorespacesafterend
}

\newenvironment{UsafMemo}{%
	\begin{textblock*}{6.75in}(.75in,1.75in)
}{%
	\end{textblock*}
}

\newenvironment{UsafSignature}{%

    \vspace{5ex}

	\TPoptions{absolute=false}
	\begin{flushleft}
	\begin{textblock*}{3.5in}(3.75in,4em)
}{%
	\end{textblock*}
	\end{flushleft}
}

% Commands

\newcommand{\address}[1]{%
    \def\@address{#1}
}

\newcommand{\attachment}[1]{%
    \def\ATTACHMENT
    \vspace{2em}
    \noindent
    Attachment: \\
    #1
}

\newcommand{\attachments}[1]{%
    \def\ATTACHMENT
    \vspace{2em}
    \noindent
    Attachments:
    \begin{enumerate}
    #1
    \end{enumerate}
}

\newcommand{\CapLetterHead}{
    \ifdefined\FOUO
        \FouoMark\\
        \vspace{1ex}
        \UsafLetterHeadFont{%
            HEADQUARTERS \MakeUppercase{\@unit}\\
            CIVIL AIR PATROL\\
            UNITED STATES AIR FORCE AUXILIARY\\
            \@address
        }
    \else
        \UsafLetterHeadFont{%
            HEADQUARTERS \MakeUppercase{\@unit}\\
            CIVIL AIR PATROL\\
            UNITED STATES AIR FORCE AUXILIARY\\
            \@address
        }
    \fi
}

\newcommand{\cc}[1]{%
    \ifdefined\ATTACHMENT
        \vspace{2em}
    \else
        \vspace{1em}
    \fi

    \noindent
    cc:\\
    #1
}

\renewcommand{\date}[1]{%
    \def\@date{#1}
}

\newcommand{\digisign}[4]{%
    \vspace{2em}
    \hspace{\sigoffset}\includegraphics[scale=0.2]{#4}\\
    \sigblock{#1}{#2}{#3}
}

\newcommand{\FouoMark}{%
    \textcolor{Green}{UNCLASSIFIED//FOUO}
}

\newcommand{\LetterHeadPatch}{%
    \ifdefined\@unitPatch
        \ifdefined\FOUO
            \fancyhead[R]{%
                \begin{textblock*}{1in}(7in,.75in)
                    \includegraphics[height=1in]{\@unitPatch}
                \end{textblock*}
            }
        \else
            \fancyhead[R]{%
                \begin{textblock*}{1in}(7in,.5in)
                    \includegraphics[height=1in]{\@unitPatch}
                \end{textblock*}
            }
        \fi
    \fi
}

\newcommand{\LetterHeadSeal}{%
    \ifdefined\@seal
        \ifdefined\FOUO
            \fancyhead[L]{%
                \begin{textblock*}{1in}(.5in,.75in)
                    \includegraphics[width=1in]{\@seal}
                \end{textblock*}
            }
        \else
            \fancyhead[L]{%
                \begin{textblock*}{1in}(.5in,.5in)
                    \includegraphics[width=1in]{\@seal}
                \end{textblock*}
            }
        \fi
    \fi
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

\newcommand{\PlainLetterHead}{
    \ifdefined\FOUO
        \FouoMark\\
        \vspace{1ex}
        \UsafLetterHeadFont{%
            \MakeUppercase{\@unit}\\
            \@address
        }
    \else
        \UsafLetterHeadFont{%
            \MakeUppercase{\@unit}\\
            \@address
        }
    \fi
}

\newcommand{\seal}[1]{%
    \def\@seal{#1}
}

\newcommand{\sigcont}{%
    \hspace*{\sigoffset}\hspace{2ex}
}

\newcommand{\sigblock}[3]{%
    \ifdefined\CAP
        \hspace*{\sigoffset}\MakeUppercase{#1}, {#2}, CAP\\
    \else
        \hspace*{\sigoffset}\MakeUppercase{#1}\\
    \fi
    \hspace*{\sigoffset}#3
}

\newcommand{\signature}[3]{%
    \vspace{4em}
    \sigblock{#1}{#2}{#3}
}

\newcommand{\subject}[1]{%
    \def\@subject{#1}
}

\newcommand{\unit}[1]{%
    \def\@unit{#1}
}

\newcommand{\unitPatch}[1]{%
    \def\@unitPatch{#1}
}

\newcommand{\UsafLetterHeadFont}[1]{
	\textcolor{Blue}{\textsf{\textbf{#1}}}\rm
}

