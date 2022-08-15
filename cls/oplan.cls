\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oplan}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}
\DeclareOption{summary}{%
    \newcommand{\SUMMARY}{}
}
\DeclareOption{camplan}{%
    \newcommand{\CAMPLAN}{}
}
\DeclareOption{conplan}{%
    \newcommand{\CONPLAN}{}
}
\DeclareOption{opord}{%
    \newcommand{\OPORD}{}
}
\DeclareOption{frago}{%
    \newcommand{\FRAGO}{}
}
\DeclareOption{weplan}{%
    \newcommand{\WEPLAN}{}
}
\DeclareOption{very-sensitive}{%
    \newcommand{\OplanInfosecLvlSet}{}
    \newcommand{\OplanLvlVerySensitive}{}
}
\DeclareOption{sensitive}{%
    \newcommand{\OplanInfosecLvlSet}{}
    \newcommand{\OplanLvlSensitive}{}
}
\DeclareOption{somewhat-sensitive}{%
    \newcommand{\OplanInfosecLvlSet}{}
    \newcommand{\OplanLvlSomewhatSensitive}{}
}
\DeclareOption{not-sensitive}{%
    \newcommand{\OplanInfosecLvlSet}{}
    \newcommand{\OplanLvlNotSensitive}{}
}
\DeclareOption{fouo}{%
    \newcommand{\FOUO}{}
}
\ProcessOptions\relax

\LoadClass[12pt]{book}

\RequirePackage{afterpage}
\RequirePackage{booktabs}
\RequirePackage{emptypage}
\RequirePackage{enumerate}
\RequirePackage{tabularx}
\RequirePackage{titlecaps}
\RequirePackage{tocloft}
\RequirePackage[dvipsnames,table]{xcolor}

\ifdefined\FOUO
    \RequirePackage{fouo}
    \def\@securityMark{\FouoMark}
\else\ifdefined\OplanInfosecLvlSet
    \def\@securityMark{PLACEHOLDER}
    \RequirePackage{usafpub}
    \ifdefined\OplanLvlVerySensitive
        \RequirePackage[very-sensitive]{infosec}
    \else\ifdefined\OplanLvlSensitive
        \RequirePackage[sensitive]{infosec}
    \else\ifdefined\OplanLvlSomewhatSensitive
        \RequirePackage[somewhat-sensitive]{infosec}
    \else\ifdefined\OplanLvlNotSensitive
        \RequirePackage[not-sensitive]{infosec}
    \fi\fi\fi\fi
    \def\@securityMark{\InfosecLevel}
\else
    \RequirePackage{usafpub}
\fi\fi

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

% Table of Contents Formatting
\setcounter{tocdepth}{5}
\cftsetindents{section}{0em}{2em}
\cftsetindents{paragraph}{0em}{2em}

% Annex Sectioning
\renewcommand{\thechapter}{\Alph{chapter}}
\titleformat{\chapter}{\normalfont\Large\bfseries}{Annex~\thechapter---}{0pt}{}

% Titlepage/Header
\newcommand{\oplan}[1]{%
    \def\@oplan{#1}
}

\newcommand{\incidentNumber}[1]{%
    \def\@incidentNumber{#1}%
}

\newcommand{\incident}[2][incident]{%
    \def\@incidentType{#1}%
    \def\@incidentName{#2}%
}

\newcommand{\effective}[1]{%
    \def\@effective{#1}%
}

\newcommand{\location}[1]{%
    \def\@location{#1}%
}

\newcommand{\incidentDate}[2][]{%
    \def\@startDate{#2}%
    
    \if\relax\detokenize{#1}\relax\else
        \def\@endDate{#1}%
    \fi
}

\newcommand{\commander}[3][commander]{%
    \def\@commanderType{#1}%
    \def\@commander{#2}%
    \def\@commanderContact{#3}%
}

\newcommand{\staffCoord}[4]{%
    \ifdefined\@staffCoords
        \edef\@staffCoords{%
            \@staffCoords 
            #1 & #2 & #3 & #4 \\
        }
    \else
        \def\@staffCoords{%
            #1 & #2 & #3 & #4 \\
        }
    \fi
}

\newcommand{\tableofcoordination}{%
    \begin{center}
    \begin{tabularx}{\textwidth}{llXr}
        \toprule
        OFFICE &  ACTION &  OUTCOME &  DATE \\
        \midrule
        \@staffCoords
        \bottomrule
    \end{tabularx}
    \end{center}
}

\newcommand{\references}[1]{%
    \def\@references{#1}%
}

\newcommand{\theOplan}{%
    \ifdefined\CAMPLAN
        CAMPLAN%
    \else\ifdefined\CONPLAN
        CONPLAN%
    \else\ifdefined\OPORD
        OPORD%
    \else\ifdefined\FRAGO
        FRAGO%
    \else\ifdefined\WEPLAN
        WEPLAN%
    \else
        OPLAN%
    \fi\fi\fi\fi\fi
}

\newcommand{\theOperationsPlan}{%
    \ifdefined\CAMPLAN
        CAMPAIGN PLAN%
    \else\ifdefined\CONPLAN
        CONCEPTUAL OPERATIONS PLAN%
    \else\ifdefined\OPORD
        OPERATIONS ORDER%
    \else\ifdefined\FRAGO
        FRAGMENTARY OPERATIONS ORDER%
    \else\ifdefined\WEPLAN
        WEEKLY PLAN%
    \else
        OPERATIONS PLAN%
    \fi\fi\fi\fi\fi
}

\newcommand{\theplan}{%
    \theOperationsPlan~\@oplan%
}

\newcommand{\@SummaryOplanTitle}{%
    \setcounter{page}{1}

    \thispagestyle{letterhead}
    
    \vspace*{5ex}
    
    \ifdefined\@endDate
        \textbf{\@incidentName\hfill\@startDate--\@endDate}
    \else
        \textbf{\@incidentName\hfill\@startDate}
    \fi
}

\newcommand{\@OpordTitle}{%
    \ifdefined\FOUO
        \FouoCoverPage
    \else\ifdefined\OplanInfosecLvlSet
        \InfosecCover
    \fi\fi

    \setcounter{page}{1}

    \thispagestyle{letterhead}
    
    \vspace*{5ex}
    
    \theplan

    EFFECTIVE:~\@effective
    
    \ifdefined\@incidentNumber
        \MakeUppercase{\@incidentType}:~[\@incidentNumber]~\@incidentName
    \else
        \MakeUppercase{\@incidentType}:~\@incidentName
    \fi
    
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

\newcommand{\coverSeal}[1]{%
    \def\@coverSeal{#1}%
}

\newcommand{\@FullTitle}{%
    \thispagestyle{plain}
    \begin{center}
        \huge
        \theplan

        \ifdefined\@incidentNumber
            \MakeUppercase{\@incidentType}~\@incidentNumber
        \fi

        \MakeUppercase{\@incidentName}
        
        \vfill

        \ifdefined\@coverSeal
            \includegraphics[height=4in]{\@coverSeal}
        \else
            \includegraphics[height=4in]{\@seal}
        \fi

        \vfill

        \normalsize
        \begin{tabular}{ll}
            \theOplan~Effective:                                  & \@effective        \\
                                                                  &                    \\ 
            \titlecap{\@incidentType}~Location:                   & \@location         \\
        \ifdefined\@startDate                                 
            \titlecap{\@incidentType}~Start:                      & \@startDate        \\
        \fi
        \ifdefined\@endDate
            \titlecap{\@incidentType}~End:                        & \@endDate          \\
        \fi
                                                                  &                    \\ 
            \titlecap{\@incidentType}~\titlecap{\@commanderType}: & \@commander        \\
                                                                  & \@commanderContact \\
        \end{tabular}
    \end{center}   

    \cleardoublepage   
    \ifdefined\FOUO
        \FouoCoverPage
    \else\ifdefined\OplanInfosecLvlSet
        \InfosecCover
    \fi\fi

    \cleardoublepage   
    \chapter*{Coordination and Approval}
    \tableofcoordination
    
    \cleardoublepage
    
    \tableofcontents
    
    \cleardoublepage

    \setcounter{page}{1}

    \thispagestyle{letterhead}
    
    \vspace*{5ex}
    
    \theplan

    EFFECTIVE:~\@effective
    
    \ifdefined\@incidentNumber
        \MakeUppercase{\@incidentType}:~[\@incidentNumber]~\@incidentName
    \else
        \MakeUppercase{\@incidentType}:~\@incidentName
    \fi
    
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

\renewcommand{\maketitle}{%

    \ifdefined\SUMMARY
        \@SummaryOplanTitle%
    \else\ifdefined\OPORD
        \@OpordTitle%
    \else\ifdefined\FRAGO
        \@OpordTitle%
    \else
        \@FullTitle%
    \fi\fi\fi
}
