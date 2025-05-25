\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ag7ifform}

\DeclareOption{quarto}{%
    \newcommand{\QUARTO}{}
}

\DeclareOption{landscapeForm}{%
    \newcommand{\LSCAPE}{}
}
\ProcessOptions\relax

\LoadClass[12pt]{article}

\RequirePackage[hidelinks]{hyperref}
\RequirePackage{tabularx}
\RequirePackage{ag7ifform}
\ifdefined\QUARTO
    \ifdefined\LSCAPE
        \RequirePackage[
            paperheight=5.5in,
            paperwidth=8.5in,
            top=1.0in,
            bottom=1.0in,
            left=0.5in,
            right=0.5in
        ]{geometry}
    \else
        \RequirePackage[
            paperheight=8.5in,
            paperwidth=5.5in,
            top=1.0in,
            bottom=1.0in,
            left=0.5in,
            right=0.5in
        ]{geometry}
    \fi
\else
    \ifdefined\LSCAPE
        \RequirePackage[
            paperheight=8.5in,
            paperwidth=11in,
            top=1.0in,
            bottom=1.0in,
            left=0.5in,
            right=0.5in
        ]{geometry}
    \else
        \RequirePackage[
            paperheight=11in,
            paperwidth=8.5in,
            top=1.0in,
            bottom=1.0in,
            left=0.5in,
            right=0.5in
        ]{geometry}
    \fi
\fi    

\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\renewcommand{\headrulewidth}{0pt}
\setlength{\headheight}{25pt}

\newcommand{\IncidentHeader}{%
    \begin{tabularx}{\textwidth}{|p{2.1in}|X|}
        \hline
        \textbf{Incident Name:}
            \newline
            \FormTextBoxL{2.1in}{incident}
        &
        \textbf{Operational Period:}
            ~Date From: \FormTextBoxR{0.75in}{datefrom}
            ~Date To: \FormTextBoxR{0.75in}{dateto}
            \newline
            \hspace*{1.6in}
            ~Time From: \FormTextBoxR{0.75in}{timefrom}
            ~Time To: \FormTextBoxR{0.75in}{timeto}
         \\ \hline
    \end{tabularx}
}

\newcommand{\FormHeader}{%
    \chead{\Large{\@title}}%
}

\fancypagestyle{numall}{%
    \fancyhf{}
    \FormHeader%
    \lfoot{\@controlNumber, Page~\thepage~of~\pageref{LastPage}}
    \rfoot{Rev.~\@revision}
}

\fancypagestyle{formtotal}{%
    \fancyhf{}
    \FormHeader%
    \lfoot{%
        \begin{Form}
        \@controlNumber, Page~\thepage~of~\FormTextBoxU{0.2in}{totalpgs}
        \end{Form}
    }
    \rfoot{Rev.~\@revision}
}

\fancypagestyle{formall}{%
    \fancyhf{}
    \FormHeader%
    \lfoot{%
        \begin{Form}
        \@controlNumber, Page~\FormTextBoxU{0.2in}{pg}~of~\FormTextBoxU{0.2in}{totalpgs}
        \end{Form}
    }
    \rfoot{Rev.~\@revision}
}

\pagestyle{numall}

\newcommand{\controlNumber}[1]{%
    \def\@controlNumber{#1}%
}

\newcommand{\revision}[1]{%
    \def\@revision{#1}%
}
