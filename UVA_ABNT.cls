\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UVA_ABNT}[2024/12/05 Custon class for UVA`s ABNT formating]

\LoadClass[a4paper,12pt]{article}

% Re-sets font size
\makeatletter %only needed in preamble
\renewcommand\large{\@setfontsize\large{14pt}{19}}
\makeatother

\makeatletter %only needed in preamble
\renewcommand\Large{\@setfontsize\Large{16pt}{22}}
\makeatother

\makeatletter %only needed in preamble
\renewcommand\large{\@setfontsize\small{10pt}{12}}
\makeatother



\newcommand{\setTitle}[1][Title Name]{\newcommand{\TitleName}{#1}}

\newcommand{\setSubtitle}[1][Subtitle Name]{\newcommand{\SubtitleName}{#1}}


\newcommand{\setCity}[1][City Name]{\newcommand{\city}{#1}}

\newcommand{\printCity}{%%
\uppercase\expandafter{\expanded{\city}}%%
}

% \newcommand{\setAuthors}[1][Author's Name]{%
%     \newcommand{\printAuthors}{\uppercase{#1}}%
% }

% ---------------------------------------------------------------------------
% Name list handling (datatool)
% ---------------------------------------------------------------------------
\RequirePackage{datatool}

% Database that holds the names
\DTLnewdb{authorList}

% \newAuthor{<name>, <studentNumber>} : appends a name to the list
\newcommand{\newAuthor}[2]{%
    \DTLnewrow{authorList}%
    \DTLnewdbentry{authorList}{name}{#1}%
    \DTLnewdbentry{authorList}{studentNumber}{#2}%
}

% \printAuthors : prints the newAuthor list alphabetically
\newcommand{\printAuthors}{%
    \DTLsortdata{authorList}{name, studentNumber}%

    \DTLforeach*{authorList}{
        \thename=name,\theStudentNumber=studentNumber
    }{%
        \uppercase\expandafter{\expanded{\thename}} - \theStudentNumber \\
    }%
}
