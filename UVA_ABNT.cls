\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{UVA_ABNT}[2024/12/05 Custon class for UVA`s ABNT formating]

\LoadClass[a4paper,12pt]{article}

\newcommand{\setTitleName}[1][Title Name]{\newcommand{\TitleName}{#1}}

\newcommand{\setSubtitleName}[1][Subtitle Name]{\newcommand{\SubtitleName}{#1}}

\newcommand{\setTitleNameEnglish}[1][Title Name]{\newcommand{\TitleNameEnglish}{#1}}

\newcommand{\setSubtitleNameEnglish}[1][Subtitle Name]{\newcommand{\SubtitleNameEnglish}{#1}}


\newcommand{\setCity}[1][City Name]{\newcommand{\city}{#1}}

\newcommand{\printCity}{%%
\uppercase\expandafter{\expanded{\city}}%%
}

\newcommand{\setAuthors}[1][Author's Name]{%
    \newcommand{\printAuthors}{\uppercase{#1}}%
}