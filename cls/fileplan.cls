\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fileplan}

\DeclareOption{DRAFT}{%
    \newcommand{\DRAFT}{}
}

\ProcessOptions\relax

\LoadClass[12pt]{article}

\RequirePackage{fancyhdr}
\RequirePackage[
    top=1.0in,
    bottom=0.75in,
    left=0.25in,
    right=0.25in,
    headheight=15pt
]{geometry}
\RequirePackage{lastpage}
\RequirePackage{longtable}

\ifdefined\DRAFT
    \RequirePackage[scale=8]{draftwatermark}
\fi

\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\fancyhead[L]{\@title}
\fancyhead[R]{Page\ \thepage\ of\ \pageref{LastPage}}
\fancyfoot[L]{Prepared by: \@author}
\fancyfoot[R]{Date Prepared: \@date}
\pagestyle{fancy}

\setlength{\parindent}{0pt}

\newenvironment{fpTable}{%
    \begin{longtable}{lp{6.25in}rr}
}{%
    \end{longtable}
}