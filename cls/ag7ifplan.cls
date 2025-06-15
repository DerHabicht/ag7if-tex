\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ag7ifplan}

% Document setup:
%
% % NOTE: declaring <tlp> without <infosec> has no effect
% % Plan Types:
% % - stratplan
% % - camplan
% % - qplan
% % - bplan
% % - oplan
% % - opord
% % - fragord
% % - splan
% % - iap
% \documentclass[<draft>,<cap>,<vhistory>,<plan_type>,<infosec>,<tlp>]{ag7ifplan}
%
% \planNumber{<PLAN_NUMBER>}
% \supplement{<SUPPLEMENT_ID>} % Optional
% \incidentNumber{<INCIDENT_NUMBER>} % Optional
% \incident[<INCIDENT_TYPE>]{<INCIDENT_NAME>} % Ignored by QPLANs and SPLANs
% \coverSeal%
%   {<COVER_SEAL1_PATH>}%
%   {<COVER_SEAL2_PATH>}%
%   {<COVER_SEAL3_PATH>}%
%   {<COVER_SEAL4_PATH>} % Not used by SPLANs or FRAGORDs
% \effective{<PLAN_EFFECTIVE_DATE>}
% \location{<INCIDENT_LOCATION>} % Not used by STRATPLAN, CAMPLAN, QPLAN, or SPLAN
% \incidentDate[<END_DATE>]{<START_DATE>}
% \commander[<TITLE>]{<NAME>}{<CONTACT>} % Not used by SPLAN or FRAGORD
% \sponsor{<SPONSORING_ORG_AND_UNIT>} % Optional
%
% \seal{<SEAL_PATH>} % Optional if using the <cap> document option
% \unitPatch{<UNIT_PATCH_PATH>} % Optional
% \unit{<UNIT>}
% \address{<UNIT ADDRESS> \\ <CITY>, <STATE> <ZIP>}
%
% \staffCoord{<TO>,<ACTION>,<OUTCOME>,<DATE>} % Optional
% \staffCoord{<TO>,<ACTION>,<OUTCOME>,<DATE>}
% \staffCoord{<TO>,<ACTION>,<OUTCOME>,<DATE>}
%
% If vhistory option is selected, define the \vhistory command as follows
% (recommend putting this in a separate file and \input'ing it in the preamble):
%
% \newcommand{\<AUTHOR_INITIALS>}{<AUTHOR_NAME>}
% 
% \renewcommand{\vhistory}{%
% \begin{versionhistory}
%     \vhEntry{<VERSION>}{<DATE>}{<AUTHOR_INITIALS>}{Initial draft}
% \end{versionhistory}
% }
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

\DeclareOption{draft}{%
    \newcommand{\@draft}{}
}
\DeclareOption{stratplan}{%
    \newcommand{\@STRATPLAN}{}
}
\DeclareOption{camplan}{%
    \newcommand{\@CAMPLAN}{}
}
\DeclareOption{qplan}{%
    \newcommand{\@QPLAN}{}
}
\DeclareOption{bplan}{%
    \newcommand{\@BPLAN}{}
}
\DeclareOption{conplan}{%
    \newcommand{\@CONPLAN}{}
}
\DeclareOption{oplan}{%
    \newcommand{\@OPLAN}{}
}
\DeclareOption{opord}{%
    \newcommand{\@OPORD}{}
}
\DeclareOption{fragord}{%
    \newcommand{\@FRAGO}{}
}
\DeclareOption{splan}{%
    \newcommand{\@SPLAN}{}
}
\DeclareOption{iap}{%
    \newcommand{\@IAP}{}
}
\DeclareOption{vhistory}{%
    \newcommand{\vhistory}{}
}
\DeclareOption{refs}{%
    \newcommand{\@references}{}
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
}
\DeclareOption{tlp-amber-strict}{%
    \newcommand{\@PlanTlpLvlSet}{}
}
\DeclareOption{tlp-amber}{%
    \newcommand{\@PlanTlpLvlSet}{}
}
\DeclareOption{tlp-green}{%
    \newcommand{\@PlanTlpLvlSet}{}
}
\DeclareOption{tlp-clear}{%
    \newcommand{\@PlanTlpLvlSet}{}
}
\ProcessOptions\relax

\ifdefined\@STRATPLAN
\else\ifdefined\@CAMPLAN
\else\ifdefined\@QPLAN
\else\ifdefined\@BPLAN
\else\ifdefined\@CONPLAN
\else\ifdefined\@OPLAN
\else\ifdefined\@OPORD
\else\ifdefined\@FRAGORD
\else\ifdefined\@SPLAN
\else\ifdefined\@IAP
\else
    \ClassError{ag7ifplan}{no plan type defined}{Load the class with stratplan, camplan, qplan, bplan, conplan, oplan, opord, fragord, splan, or iap option}
\fi\fi\fi\fi\fi\fi\fi\fi\fi\fi

% TODO: Warn/error on multiple plan types

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

\ifdefined\@PlanInfosecLvlSet
    \def\@securityMark{PLACEHOLDER}
    \ifdefined\@PlanTlpLvlSet
        \def\@tlpMark{PLACEHOLDER}
    \fi

    \RequirePackage{usafpub}
    \RequirePackage{infosec}

    \def\@securityMark{\InfosecLevel}
    \ifdefined\@PlanTlpLvlSet
        \RequirePackage{tlp}
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

\ifdefined\@draft
    \RequirePackage{draftwatermark}
\fi

\pagestyle{usaf}
\raggedbottom

% Table of Contents Formatting
\setcounter{tocdepth}{2}

\Crefname{appendix}{Annex}{annexes}
\crefname{appendix}{annex}{annexes}

% Chapters
\newif\if@appendix \@appendixfalse

\renewcommand{\thechapter}{\arabic{chapter}}

\renewcommand{\chapter}[1]{%
    \if@appendix\else\ifnum\c@chapter=0
        \cleardoublepage
        \if@mainmatter
            \thispagestyle{letterhead}
            
            \vspace*{5ex}
            
            \theplan

            \ifdefined\@draft
                EFFECTIVE:~DRAFT
            \else
                EFFECTIVE:~\@effective
            \fi
            
            \ifdefined\@incidentNumber
                \MakeUppercase{\@incidentType}:~[\@incidentNumber]~\@incidentName
            \else
                \MakeUppercase{\@incidentType}:~\@incidentName
            \fi

            \vspace*{2ex}

            \ifdefined\@references
                \printbibliography[title={References}]
            \fi
            
            \vspace*{2ex}
        \fi
    \fi\fi

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
    %\gdef\thesection{\@Alph\c@chapter.\@Arabic\c@section}%
    %\gdef\thesubsection{\@Alph\c@chapter.\@Arabic\c@section.\@Arabic\c@subsection}%
    %\gdef\thesubsubsection{\@Alph\c@chapter.\@Arabic\c@section.\@Arabic\c@subsection.\@Arabic\c@subsubsection}%
    %\gdef\theparagraph{\@Alph\c@chapter.\@Arabic\c@section.\@Arabic\c@subsection.\@Arabic\c@subsubsection.\@Arabic\c@paragraph}%
    %\gdef\thesubparagraph{\@Alph\c@chapter.\@Arabic\c@section.\@Arabic\c@subsection.\@Arabic\c@subsubsection.\@Arabic\c@paragraph.\@Arabic\c@subparagrah}%
    \cleardoublepage
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
\newcommand{\planNumber}[1]{%
    \ifdefined\@QPLAN
        \def\@incidentType{Quarter}
        \def\@incidentName{#1}
    \else\ifdefined\@SPLAN
        \def\@incidentType{Sprint}
        \def\@incidentName{#1}
    \fi\fi
    \def\@planNumber{#1}
}

\newcommand{\supplement}[1]{%
    \def\@supplement{#1}
}

\newcommand{\incidentNumber}[1]{%
    \def\@incidentNumber{#1}%
}

\newcommand{\incident}[2][incident]{%
    \ifdefined\@QPLAN
        \ClassWarning{ag7ifplan}{incident name is ignored for QPLANs}
    \else\ifdefined\@SPLAN
        \ClassWarning{ag7ifplan}{incident name is ignored for SPLANs}
    \else
        \ifdefined\@incidentType\else
            \def\@incidentType{#1}
        \fi
        \def\@incidentName{#2}%
    \fi\fi
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

\newcommand\staffCoord[1]{%
    \ifdefined\@coordChain\else\def\@coordChain{}\fi
    \g@addto@macro\@coordChain{\hline\@gobble}%
  \@for\tmp:=#1\do{%
 \expandafter\g@addto@macro\expandafter\@coordChain
                   \expandafter{\expandafter&\tmp}%
}%
    \g@addto@macro\@coordChain{\\}%
}

\newcommand{\tableofcoordination}{%
    \begin{center}
    \begin{tabularx}{\textwidth}{|l|l|X|r|}
        \hline
        OFFICE &  ACTION &  OUTCOME &  DATE \\ \hline
        \@coordChain \hline
    \end{tabularx}
    \end{center}
}

\newcommand{\planTypeShort}{%
    \ifdefined\@STRATPLAN
        STRATPLAN
    \else\ifdefined\@CAMPLAN
        CAMPLAN
    \else\ifdefined\@QPLAN
        QPLAN
    \else\ifdefined\@BPLAN
        BPLAN
    \else\ifdefined\@CONPLAN
        CONPLAN
    \else\ifdefined\@OPLAN
        OPLAN
    \else\ifdefined\@OPORD
        OPORD
    \else\ifdefined\@FRAGORD
        FRAGORD
    \else\ifdefined\@SPLAN
        SPLAN
    \else\ifdefined\@IAP
        IAP
    \fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
}

\newcommand{\planTypeFull}{%1
    \ifdefined\@STRATPLAN
        STRATEGIC PLAN
    \else\ifdefined\@CAMPLAN
        CAMPAIGN PLAN
    \else\ifdefined\@QPLAN
        QUARTERLY PLAN
    \else\ifdefined\@BPLAN
        BASE PLAN
    \else\ifdefined\@CONPLAN
        CONCEPT PLAN
    \else\ifdefined\@OPLAN
        OPERATION PLAN
    \else\ifdefined\@OPORD
        OPERATION ORDER
    \else\ifdefined\@FRAGORD
        FRAGMENTARY OPERATION ORDER
    \else\ifdefined\@SPLAN
        SPRINT PLAN
    \else\ifdefined\@IAP
        INCIDENT ACTION PLAN
    \fi\fi\fi\fi\fi\fi\fi\fi\fi\fi
}

\newcommand{\theplan}{%
    \ifdefined\@supplement
        \@supplement~SUPPLEMENT~TO~\planTypeFull~\@planNumber
    \else
        \planTypeFull~\@planNumber
    \fi
}

\newcommand{\@FragOrdTitle}{%
    \setcounter{page}{1}
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

    \ifdefined\@PlanInfosecLvlSet
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
            \planTypeShort~Effective:                             & \ifdefined\@draft DRAFT\else\@effective\fi \\
                                                                  &                    \\
        \ifdefined\@location
            \titlecap{\@incidentType}~Location:                   & \@location         \\
        \fi
        \ifdefined\@startDate                                 
            \titlecap{\@incidentType}~Start:                      & \@startDate        \\
        \fi
        \ifdefined\@endDate
            \titlecap{\@incidentType}~End:                        & \@endDate          \\
        \fi
                                                                  &                    \\ 
        \ifdefined\@commander
            \titlecap{\@incidentType}~\titlecap{\@commanderType}: & \@commander        \\
        \fi
                                                                  & \@commanderContact \\
                                                                  &                    \\
        \ifdefined\@sponsor
            Lead Organization and Unit:                           & \@sponsor          \\
        \fi
        \end{tabular}
    \end{center}   

    \cleardoublepage   
    
    \ifdefined\@coordChain
        \chapter*{Coordination and Approval}
        \tableofcoordination
    
        \cleardoublepage
    \fi

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
    \else\ifdefined\@SPLAN
        \@FragOrdTitle%
    \else
        \@FullTitle%
    \fi\fi
}
