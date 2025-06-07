\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{oplan}

% Document setup:
%
% % NOTE: declaring <tlp> without <infosec> has no effect
% \documentclass[<DRAFT>,<cap>,<vhistory>,<plan_type>,<infosec>,<tlp>]{oplan}
%
% \oplan{<OPLAN_NUMBER>}
% \incidentNumber{<INCIDENT_NUMBER>}
% \incident[<INCIDENT_TYPE>]{<INCIDENT_NAME>}
% \coverSeal%
%   {<COVER_SEAL1_PATH>}%
%   {<COVER_SEAL2_PATH>}%
%   {<COVER_SEAL3_PATH>}%
%   {<COVER_SEAL4_PATH>}
% \effective{<PLAN_EFFECTIVE_DATE>}
% \location{<INCIDENT_LOCATION>}
% \incidentDate[<END_DATE>]{<START_DATE>}
% \commander[<TITLE>]{<NAME>}{<CONTACT>}
% \sponsor{<SPONSORING_ORG_AND_UNIT>}
%
% \seal{<SEAL_PATH>} % Optional if using the <cap> document option
% \unitPatch{<UNIT_PATCH_PATH>}
% \unit{<UNIT>}
% \address{<UNIT ADDRESS> \\ <CITY>, <STATE> <ZIP>}
%
% \staffCoord{<TO>,<ACTION>,<OUTCOME>,<DATE>}
% \staffCoord{<TO>,<ACTION>,<OUTCOME>,<DATE>}
% \staffCoord{<TO>,<ACTION>,<OUTCOME>,<DATE>}
%
% \begin{document}
% \maketitle
% 
% \section{<SITUATION>}
% \subsection{<SUBSEC_HEADING>}
% \paragraph{<PARA_HEADING>}
% \begin{enumerate}
%   \titem{<ITEM_HEADER>}
% \end{enumerate}
%
% \section{<MISSION>}
%
% \section{<EXECUTION>}
%
% \section{<SUSTAINMENT>}
%
% \section{<C4>}
%
% \signature{<NAME>}{<GRADE>}{<DUTY_ASSIGNMENT>} % For hand-signing after printing
% \textsign{<NAME>}{<GRADE>}{<DUTY_ASSIGNMENT>} % Inserts "// SIGNED //" above the signature block
% \digisign{<NAME>}{<GRADE>}{<DUTY_ASSIGNMENT>}{<SIG_IMG_PATH>} % For including an image of the signature
%
% \end{document}

\DeclareOption{DRAFT}{%
    \newcommand{\@DRAFT}{}
}
\DeclareOption{bplan}{%
    \newcommand{\@BPLAN}{}
}
\DeclareOption{camplan}{%
    \newcommand{\@CAMPLAN}{}
}
\DeclareOption{conplan}{%
    \newcommand{\@CONPLAN}{}
}
\DeclareOption{opord}{%
    \newcommand{\@OPORD}{}
}
\DeclareOption{frago}{%
    \newcommand{\@FRAGO}{}
}
\DeclareOption{qplan}{%
    \newcommand{\@QPLAN}{}
}
\DeclareOption{splan}{%
    \newcommand{\@SPLAN}{}
    \def\@incidentType{Sprint}
}
\DeclareOption{stratplan}{%
    \newcommand{\@STRATPLAN}{}
}
\DeclareOption{vhistory}{%
    \newcommand{\vhistory}{}
}
\DeclareOption{refs}{%
    \newcommand{\@references}{}
}
\DeclareOption{very-sensitive}{%
    \newcommand{\@OplanInfosecLvlSet}{}
    \newcommand{\@OplanLvlVerySensitive}{}
}
\DeclareOption{sensitive}{%
    \newcommand{\@OplanInfosecLvlSet}{}
    \newcommand{\@OplanLvlSensitive}{}
}
\DeclareOption{somewhat-sensitive}{%
    \newcommand{\@OplanInfosecLvlSet}{}
    \newcommand{\@OplanLvlSomewhatSensitive}{}
}
\DeclareOption{not-sensitive}{%
    \newcommand{\@OplanInfosecLvlSet}{}
    \newcommand{\@OplanLvlNotSensitive}{}
}
\DeclareOption{tlp-red}{%
    \newcommand{\@OplanTlpLvlSet}{}
    \newcommand{\@OplanTlpRed}{}
}
\DeclareOption{tlp-amber-strict}{%
    \newcommand{\@OplanTlpLvlSet}{}
    \newcommand{\@OplanTlpAmberStrict}{}
}
\DeclareOption{tlp-amber}{%
    \newcommand{\@OplanTlpLvlSet}{}
    \newcommand{\@OplanTlpAmber}{}
}
\DeclareOption{tlp-green}{%
    \newcommand{\@OplanTlpLvlSet}{}
    \newcommand{\@OplanTlpGreen}{}
}
\DeclareOption{tlp-clear}{%
    \newcommand{\@OplanTlpLvlSet}{}
    \newcommand{\@OplanTlpClear}{}
}
\ProcessOptions\relax

\LoadClass[12pt]{book}

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{afterpage}
\RequirePackage{booktabs}
\RequirePackage{cleveref}
\RequirePackage{emptypage}
\RequirePackage{enumerate}
\RequirePackage[
    margin=1in,
    headheight=15pt,
    footskip=0.5in
]{geometry}
\RequirePackage{suffix}
\RequirePackage{tabularx}
\RequirePackage{titlecaps}
\RequirePackage{tocloft}
\RequirePackage[dvipsnames,table]{xcolor}

\ifdefined\@OplanInfosecLvlSet
    \def\@securityMark{PLACEHOLDER}
    \ifdefined\@OplanTlpLvlSet
        \def\@tlpMark{PLACEHOLDER}
    \fi
    \RequirePackage{usafpub}
    \ifdefined\@OplanLvlVerySensitive
        \RequirePackage[very-sensitive]{infosec}
    \else\ifdefined\@OplanLvlSensitive
        \RequirePackage[sensitive]{infosec}
    \else\ifdefined\@OplanLvlSomewhatSensitive
        \RequirePackage[somewhat-sensitive]{infosec}
    \else\ifdefined\@OplanLvlNotSensitive
        \RequirePackage[not-sensitive]{infosec}
    \fi\fi\fi\fi
    \ifdefined\@OplanTlpRed
        \RequirePackage[red]{tlp}
    \else\ifdefined\@OplanTlpAmberStrict
        \RequirePackage[amber-strict]{tlp}
    \else\ifdefined\@OplanTlpAmber
        \RequirePackage[amber]{tlp}
    \else\ifdefined\@OplanTlpGreen
        \RequirePackage[green]{tlp}
    \else\ifdefined\@OplanTlpClear
        \RequirePackage[clear]{tlp}
    \fi\fi\fi\fi\fi
    \def\@securityMark{\InfosecLevel}
    \ifdefined\@OplanTlpLvlSet
        \def\@tlpMark{\TLPLevel}
    \fi
\else
    \RequirePackage{usafpub}
\fi

\ifdefined\vhistory
    \RequirePackage[nochapter,tablegrid]{vhistory}
\fi

\ifdefined\@references
    \RequirePackage[notes,backend=biber]{biblatex-chicago}
    \addbibresource{references.bib}
\fi

\ifdefined\@DRAFT
    \RequirePackage{draftwatermark}
\fi

\pagestyle{usaf}

% Table of Contents Formatting
\setcounter{tocdepth}{2}

\Crefname{appendix}{Annex}{annexes}
\crefname{appendix}{annex}{annexes}

% Chapters
\newif\if@appendix \@appendixfalse

\renewcommand{\thechapter}{\arabic{chapter}}

\renewcommand{\chapter}[1]{%
    \if@openright\cleardoublepage\else\clearpage\fi
    \if@mainmatter
        \if@appendix
            \thispagestyle{plain}%
        \else
            \ifnum\c@chapter=0
                \thispagestyle{letterhead}
                
                \vspace*{5ex}
                
                \theplan

                \ifdefined\@DRAFT
                    EFFECTIVE:~DRAFT
                \else
                    EFFECTIVE:~\@effective
                \fi
                
                \ifdefined\@SPLAN\else\ifdefined\@incidentNumber
                    \MakeUppercase{\@incidentType}:~[\@incidentNumber]~\@incidentName
                \else
                    \MakeUppercase{\@incidentType}:~\@incidentName
                \fi\fi

                \vspace*{2ex}

                \ifdefined\@references
                    \printbibliography[title={References}]
                \fi
                
                \vspace*{2ex}
            \else
                \thispagestyle{plain}%
            \fi
        \fi
    \else
        \thispagestyle{plain}%
    \fi

    \stepcounter{chapter}%
    {\normalfont\bfseries\Large\thechapter\quad#1}
    \addcontentsline{toc}{chapter}{\protect\numberline{\thechapter}#1}
}

\WithSuffix\newcommand\chapter*[1]{%
    {\normalfont\Large\bfseries#1}
}

\renewcommand\appendix{%
    \par
    \@appendixtrue%
    \setcounter{chapter}{0}%
    \setcounter{section}{0}%
    \gdef\@chapapp{\appendixname}%
    \gdef\thechapter{\@Alph\c@chapter}%
}


% Sections
\titleformat{\section}{}{\large\textbf{\thesection\hspace{1em}}}{0pt}{\large\textbf}
\titleformat{\subsection}{}{\large\textbf{\thesubsection\hspace{1em}}}{0pt}{\large\textbf}
\titleformat{\subsubsection}{}{\large\textbf{\thesubsubsection\hspace{1em}}}{0pt}{\large\textbf}

% Paragraphs
\renewcommand{\theparagraph}{\arabic{chapter}.\arabic{section}.\arabic{subsection}.\arabic{subsubsection}.\arabic{paragraph}}
\titleformat{\paragraph}[runin]{}{\textbf{\theparagraph\hspace{1em}}}{0pt}{\textbf}

% Itemized titles
\renewcommand{\titem}[1]{%
    \item \textbf{#1}
}



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

\newcommand{\sponsor}[1]{%
    \def\@sponsor{#1}%
}

\newcommand{\coordChain}{}

\newcommand\staffCoord[1]{%
    \g@addto@macro\coordChain{\hline\@gobble}%
  \@for\tmp:=#1\do{%
 \expandafter\g@addto@macro\expandafter\coordChain
                   \expandafter{\expandafter&\tmp}%
}%
    \g@addto@macro\coordChain{\\}%
}

\newcommand{\tableofcoordination}{%
    \begin{center}
    \begin{tabularx}{\textwidth}{|l|l|X|r|}
        \hline
        OFFICE &  ACTION &  OUTCOME &  DATE \\ \hline
        \coordChain \hline
    \end{tabularx}
    \end{center}
}

\newcommand{\theOplan}{%
    \ifdefined\@BPLAN
        BPLAN%
    \else\ifdefined\@CAMPLAN
        CAMPLAN%
    \else\ifdefined\@CONPLAN
        CONPLAN%
    \else\ifdefined\@OPORD
        OPORD%
    \else\ifdefined\@FRAGO
        FRAGO%
    \else\ifdefined\@QPLAN
        QPLAN%
    \else\ifdefined\@SPLAN
        SPLAN%
    \else\ifdefined\@STRATPLAN
        STRATPLAN%
    \else
        OPLAN%
    \fi\fi\fi\fi\fi\fi\fi\fi
}

\newcommand{\theOperationsPlan}{%
    \ifdefined\@BPLAN
        BASE PLAN%
    \else\ifdefined\@CAMPLAN
        CAMPAIGN PLAN%
    \else\ifdefined\@CONPLAN
        CONCEPT PLAN%
    \else\ifdefined\@OPORD
        OPERATION ORDER%
    \else\ifdefined\@FRAGO
        FRAGMENTARY OPERATION ORDER%
    \else\ifdefined\@SPLAN
        SPRINT PLAN%
    \else\ifdefined\@STRATPLAN
        STRATEGIC PLAN%
    \else\ifdefined\@QPLAN
        QUARTERLY PLAN%
    \else
        OPERATION PLAN%
    \fi\fi\fi\fi\fi\fi\fi\fi
}

\newcommand{\theplan}{%
    \theOperationsPlan~\@oplan%
}

\newcommand{\@FragOrdTitle}{%
    \ifdefined\@OplanInfosecLvlSet
        \InfosecCover
    \fi

    \setcounter{page}{1}

    \thispagestyle{letterhead}
    
    \vspace*{5ex}
    
    \theplan

    \ifdefined\@DRAFT
        EFFECTIVE:~DRAFT
    \else
        EFFECTIVE:~\@effective
    \fi
    
    \ifdefined\@incidentNumber
        \MakeUppercase{\@incidentType}:~[\@incidentNumber]~\@incidentName
    \else
        \MakeUppercase{\@incidentType}:~\@incidentName
    \fi
}

\newcommand{\coverSeal}[4]{%
    \def\tempA{#1}%
    \def\tempB{#2}%
    \def\tempC{#3}%
    \def\tempD{#4}%

    \def\@coverSealA{#1}%

    \ifx\tempB\empty\else
    \def\@coverSealB{#2}%
    \fi

    \ifx\tempC\empty\else
    \def\@coverSealC{#3}%
    \fi

    \ifx\tempD\empty\else
    \def\@coverSealD{#4}%
    \fi

}

\newcommand{\@FullTitle}{%
    \frontmatter

    \ifdefined\@OplanInfosecLvlSet
        \InfosecCover
        \cleardoublepage
    \fi

    \thispagestyle{plain}
    \begin{center}
        \huge
        \theplan

        \ifdefined\@incidentNumber
            \MakeUppercase{\@incidentType}~\@incidentNumber
        \fi

        \ifdefined\@incidentName
            \MakeUppercase{\@incidentName}
        \fi
        
        \vfill

        % NOTE: The assumption is made here that if @coverSealD is defined, so is C, B, A, etc.
        \ifdefined\@coverSealD
            \includegraphics[height=2in]{\@coverSealA}
            \hspace{0.25in} 
            \includegraphics[height=2in]{\@coverSealB}

            \includegraphics[height=2in]{\@coverSealC}
            \hspace{0.25in}
            \includegraphics[height=2in]{\@coverSealD}
        \else\ifdefined\@coverSealC
            \includegraphics[height=3in]{\@coverSealA}

            \includegraphics[height=3in]{\@coverSealB}
            \hspace{0.25in} 
            \includegraphics[height=3in]{\@coverSealC}
        \else\ifdefined\@coverSealB
            \includegraphics[height=3in]{\@coverSealA}
            \hspace{0.25in} 
            \includegraphics[height=3in]{\@coverSealB}
        \else\ifdefined\@coverSealA
            \includegraphics[height=4in]{\@coverSealA}
        \else
            \includegraphics[height=4in]{\@seal}
        \fi\fi\fi\fi

        \vfill

        \normalsize
        \begin{tabular}{ll}
            \theOplan~Effective:                                  & \ifdefined\@DRAFT DRAFT\else\@effective\fi \\
                                                                  &                    \\
            \ifdefined\@CAMPLAN\else\ifdefined\@SPLAN\else\ifdefined\@STRATPLAN\else\ifdefined\@QPLAN\else
                \titlecap{\@incidentType}~Location:               & \@location         \\
            \fi\fi\fi\fi
        \ifdefined\@startDate                                 
            \titlecap{\@incidentType}~Start:                      & \@startDate        \\
        \fi
        \ifdefined\@endDate
            \titlecap{\@incidentType}~End:                        & \@endDate          \\
        \fi
                                                                  &                    \\ 
            \titlecap{\@incidentType}~\titlecap{\@commanderType}: & \@commander        \\
                                                                  & \@commanderContact \\
                                                                  &                    \\
            Lead Organization and Unit:                           & \@sponsor          \\
        \end{tabular}
    \end{center}   

    \cleardoublepage   
    
    \chapter*{Coordination and Approval}
    \tableofcoordination
    
    \cleardoublepage

    \ifdefined\vhistory
        \chapter*{Revision History}
        \vhistory

        \cleardoublepage
    \fi
   
    \tableofcontents
    
    \cleardoublepage

    \setcounter{page}{1} 

    \mainmatter
}

\renewcommand{\maketitle}{%

    \ifdefined\@FRAGO
        \@FragOrdTitle%
    \else
        \@FullTitle%
    \fi
}
