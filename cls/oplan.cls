\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oplan}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}
\DeclareOption{frago}{%
    \newcommand{\FRAGO}{}
}
\DeclareOption{fouo}{%
    \newcommand{\FOUO}{}
}
\ProcessOptions\relax

\LoadClass[12pt]{book}

\RequirePackage{emptypage}
\RequirePackage{enumerate}
\RequirePackage{titlecaps}
\RequirePackage{usafpub}

\ifdefined\FOUO
    \RequirePackage{fouo}
\fi

\ifdefined\DRAFT
    \RequirePackage{draftwatermark}
\fi

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

% Annex Sectioning
\renewcommand{\thesection}{Annex \Alph{section}---}
\titleformat{\section}{\cleardoublepage\normalfont\Large\bfseries}{\thesection}{0pt}{}

% Commands
\renewcommand{\author}[1]{%
    \def\@author{#1}
}

\newcommand{\commander}[1]{%
    \def\@commander{#1}
}

\newcommand{\drafted}[1]{%
    \def\@drafted{#1}
}

\newcommand{\effective}[1]{%
    \def\@effective{#1}
}

\newcommand{\execute}[1]{%
    \def\@execute{#1}
}

\renewcommand{\maketitle}{%
    \thispagestyle{empty}
    \ifdefined\FOUO
        \FouoCoverPage{}
    \fi
    \begin{center}
        \huge
        \theplan{}

        \@incidentName
        
        \vfill

        \includegraphics[height=4in]{\@seal}
        
        \vfill

        \LARGE

        \ifdefined\@execute
            Execute On:~\@execute
        \fi
        
        \ifdefined\@commander
            \titlecap{\theIncidentType}~Commander: \@commander
        \fi
        
        Prepared by: \@author
    \end{center}   

    \cleardoublepage   

    \thispagestyle{letterhead}

    \vspace*{0.75in}
    
    \theplan{}

    EFFECTIVE:~\@effective
    
    \theincident{}
    
    \ifdefined\@references
    {
        REFERENCES:
        \setlength{\parskip}{0pt}
        \begin{enumerate}
            \setlength{\itemsep}{0pt}
            \setlength{\parskip}{0pt}
            \@references
        \end{enumerate}
    }
    \fi
    
}

\newcommand{\oplan}[1]{%
    \def\@oplan{#1}
}

\newcommand{\incidentNumber}[1]{%
    \def\@incidentNumber{#1}
}

\newcommand{\incidentName}[1]{%
    \def\@incidentName{#1}
}

\newcommand{\incidentType}[1]{%
    \def\@incidentType{#1}
}

\newcommand{\references}[1]{%
    \def\@references{#1}
}

\newcommand{\theincident}{%
    \ifdefined\@incidentNumber
        \MakeUppercase{\theIncidentType}:~[\@incidentNumber] \@incidentName
    \else
        \MakeUppercase{\theIncidentType}:~\@incidentName
    \fi
}

\newcommand{\theIncidentType}{%
    \ifdefined\@incidentType
        \@incidentType
    \else
        incident
    \fi
}

\newcommand{\theplan}{%
    \ifdefined\FRAGO
        FRAGMENTARY OPERATIONS ORDER~\@oplan
    \else\ifdefined\@execute
        OPERATIONS ORDER~\@oplan
    \else
        OPERATIONS PLAN~\@oplan
    \fi\fi
}

\newcommand{\titem}[1]{%
    \item \underline{#1}
}
