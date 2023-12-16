% 定义模板样式
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{sysuthesis}[2022/05/06 Sun Yat-Sen University undergraduate thesis document class]
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

\LoadClass[
    fontset=fandol,  % 可用于overleaf的中文字体库
    %fontset=windows, % 出现生僻字无法显示或者需要使用windows自带字体时使用
    a4paper,
    openany
    %zihao=-4
]{ctexbook}

% 配置英文字体
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
% 解决宋体无法加粗问题（https://zhuanlan.zhihu.com/p/505601359）
% 若出现生僻字无法显示或者需要使用windows自带字体，使用下面这行
% \setCJKmainfont{SimSun}[AutoFakeBold]

\RequirePackage{fancyhdr}
\RequirePackage[margin=1in, headsep=0.2in, headheight=0.532cm, footskip=0.79cm]{geometry}
\RequirePackage{booktabs}
\RequirePackage{calc}
\RequirePackage{graphicx}
\RequirePackage[labelsep=space, justification=centering]{caption}
\RequirePackage{float}
\RequirePackage[font=footnotesize]{subcaption}
\RequirePackage{amsmath,amssymb,amsthm}
\RequirePackage{listings}
\RequirePackage{longtable}
\RequirePackage[section]{placeins}
\RequirePackage{enumitem}
\RequirePackage{bbm}
\RequirePackage{bm}
\RequirePackage[notlof,notlot,nottoc,numbib]{tocbibind} %table of content
\RequirePackage{tocloft}
\RequirePackage{wrapfig}
\RequirePackage{colortbl}
\RequirePackage{xcolor}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{makecell}
\RequirePackage[bottom, perpage]{footmisc}
\RequirePackage{setspace}
\RequirePackage{datetime}
\RequirePackage{nth}
% 引入调整段落整体宽度的宏包
\RequirePackage{changepage}
\RequirePackage{emptypage}
\RequirePackage{ulem}
% 算法、伪代码
\RequirePackage[linesnumbered,algochapter,ruled,vlined]{algorithm2e}
\renewcommand{\algorithmcfname}{算法}
\SetAlgoCaptionSeparator{\unskip\hspace*{\ccwd}}

\RequirePackage{tabularx} % for 'tabularx' env. and 'X' col. type
\RequirePackage{ragged2e} % for \RaggedRight macro

\AtBeginDocument{
    \hypersetup{CJKbookmarks=true}
}
\pagestyle{fancy}

% 有序与无序列表环境
\setlist[enumerate]{nosep}
\renewcommand\labelenumi{(\theenumi)}
\setlist[itemize]{nosep}
\setlist[description]{nosep}

% 采用带圈数字符号作脚注
\xeCJKsetcharclass{`①}{`⑩}{1}

% 默认页面页眉页脚样式
\fancypagestyle{plain}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0.5pt}
    % 页码位于页脚居中
    \fancyfoot[C]{\zihao{-5}\thepage}
    % 居中式页眉
    \fancyhead[C]{\zihao{-5}中山大学硕士学位论文}
}
\pagestyle{plain}

% 中英文摘要页面样式
\fancypagestyle{cAbstract}{}
\fancypagestyle{eAbstract}{}

% 表格拆分单元格
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}}

% 表格与图片标题设定
\renewcommand{\thefigure}{\thechapter-\arabic{figure}}
\renewcommand{\thetable}{\arabic{chapter}-\arabic{table}}
\setlength\heavyrulewidth{1.5pt}
\captionsetup{font=small,format=hang}
% 公式标题设定
\renewcommand{\theequation}{\arabic{chapter}-\arabic{equation}}

% 目录设定，使用tocloft宏包
\setcounter{secnumdepth}{3} % depth of toc, 2
\setcounter{tocdepth}{1}
% 如果要在目录中显示子章节请换用下面这行(目录中显示到x.y.z章)，如果不用这行默认显示到x.y章。
\setcounter{tocdepth}{2}

% 目录标题：小二号黑体，目录两个字中间增加空格
\renewcommand{\cfttoctitlefont}{\hfill\zihao{-2}\heiti}
\renewcommand\contentsname{\centerline{目\hspace{2em}录}}

% 目录中章标题为四号宋体，节标题为小四号宋体，小节标题为小四号仿宋
\renewcommand{\cftchapfont}{\zihao{4}\songti}
\renewcommand{\cftchappagefont}{\zihao{4}\songti}
\renewcommand{\cftsecfont}{\zihao{-4}\songti}
\renewcommand{\cftsecpagefont}{\zihao{-4}\songti}
\renewcommand{\cftsubsecfont}{\zihao{-4}\fangsong}
\renewcommand{\cftsubsecpagefont}{\zihao{-4}\fangsong}

\setlength{\cftsecindent}{2.3em}        % 小节缩进, 对齐章标题空隙
\renewcommand{\cftnodots}{\cftdotsep}     % 使用点指示页数
\renewcommand{\cftdotsep}{0.1}   % 调整指引线间距

\addtolength{\cftchapnumwidth}{3\ccwd}
\newcommand\mybold[1]{\textit{\textbf{#1}}}

\newcommand{\norm}[1]{\left\lVert#1\right\rVert}
\newtheoremstyle{dotless}{3pt}{3pt}{\kaishu}{2em}{\heiti}{}{\ccwd}{}
\theoremstyle{dotless}
\newtheorem{theorem}{{定理}}[chapter]
\newtheorem{proposition}{{命题}}[chapter]
\newtheorem{lemma}{{引理}}[chapter]
\newtheorem{corollary}{{推论}}[chapter]
\newtheorem{definition}{{定义}}[chapter]
\newtheorem{remark}{{注记}}[chapter]
\newtheorem{eg}{例}[chapter]

\renewcommand{\proofname}{{\textbf 证明}}
\renewcommand{\@biblabel}[1]{[#1]\hfill}

\renewenvironment{proof}[1][\proofname]{\par
    \pushQED{\qed}
    \kaishu \topsep6\p@\@plus6\p@\relax
    \trivlist
    \item[\hskip\labelsep
                \itshape
        #1]\ignorespaces
}{
    \popQED\endtrivlist\@endpefalse
}

% 相关信息宏定义
\newcommand\ctitle[1]{\def\@ctitle{#1}}
\newcommand\etitle[1]{\def\@etitle{#1}}
\newcommand\cauthor[1]{\def\@cauthor{#1}} % 默认中文名为封面作者名字
\newcommand\eauthor[1]{\def\@eauthor{#1}}
\newcommand\cmajor[1]{\def\@cmajor{#1}}
\newcommand\emajor[1]{\def\@emajor{#1}}
\newcommand\cmentor[1]{\def\@cmentor{#1}}
\newcommand\ementor[1]{\def\@ementor{#1}}

\newlength{\@title@width}

\renewcommand\maketitle {
    \begin{titlepage}
        \begin{center}
            \includegraphics[width=10cm]{image/SYSULogo} \\
            \vspace{\baselineskip}
            \zihao{1}{中山大学硕士学位论文} \\
            \vspace{1\baselineskip}

            % 参考：https://tex.stackexchange.com/a/324204/268488，https://tex.stackexchange.com/a/67582/268488
            {\fontsize{12}{10}\selectfont
            \begin{tabularx}{\textwidth}{>{\centering\arraybackslash\hyphenpenalty=10000\exhyphenpenalty=10000}X}
                \zihao{3}\heiti\@ctitle\\\vspace{1pt}\\
                \zihao{3}\@etitle\\\vspace{20pt}\\
            \end{tabularx}

        	\begin{tabular}{ll}
        		{\makebox[3cm][s]{\zihao{4}\heiti{专 \hfill 业 \hfill 名 \hfill 称：}}} & \zihao{4}\@cmajor \\ [-1ex] \\
        		{\makebox[3cm][s]{\zihao{4}\heiti{学 \hfill 位 \hfill 申 \hfill 请 \hfill 人：}}}& \zihao{4}\@cauthor \\ [-1ex] \\
        		{\makebox[3cm][s]{\zihao{4}\heiti{指 \hfill 导 \hfill 教 \hfill 师：}}} & \zihao{4}\@cmentor \\ 
            \end{tabular}
            }
			\vspace{\baselineskip}
			
  	    \zihao{4}{
  	    	\begin{tabular}{rr}
  	    		论文答辩委员会主席：& \raisebox{-1ex}{\underline{\makebox[6cm][c]{}}}\\
  	    		&~\\
  	    		成员：& \raisebox{-1ex}{\underline{\makebox[6cm][c]{}}}\\
  	    		&~\\
  	    		{}& \raisebox{-1ex}{\underline{\makebox[6cm][c]{}}}\\
  	    		&~\\
  	    		{}& \raisebox{-1ex}{\underline{\makebox[6cm][c]{}}}\\
  	    		&~\\
  	    		{}& \raisebox{-1ex}{\underline{\makebox[6cm][c]{}}}
  	    	\end{tabular}
  	    }
            \vfill

            \zihao{-5}
            {\centering
                {二〇二二年五月}
				% 使用全中文年月，封面会更正式
            }

        \end{center}
    \end{titlepage}
    \clearpage
}


\newcommand\etitlefirst[1]{\def\@etitlefirst{#1}}
\newcommand\etitlesecond[1]{\def\@etitlesecond{#1}}


\newcommand\makedisclaim{
    \ctexset {
        chapter = {
			titleformat = {\zihao{-2}\heiti},
            beforeskip = {10pt},
            afterskip = {30pt}
        }
    }
    \input{docs/disclaim}
    \thispagestyle{empty}
    \clearpage
}

% 摘要
\newcommand\ckeywords[1]{\def\@ckeywords{#1}}
\newcommand\ekeywords[1]{\def\@ekeywords{#1}}
\newcommand\cabstract[1]{\def\@cabstract{#1}}
\newcommand\eabstract[1]{\def\@eabstract{#1}}

% 中文摘要标题：三号黑体
% 中文摘要、关键字标题：小四号黑体
% 中文摘要、关键字内容：小四号宋体

\newcommand\makecabstract{
	\begin{center}
		\zihao{-2}
		\mbox{ }\\
		\heiti{论文题目：\@ctitle} 
		\vspace{\baselineskip}\\
		\zihao{3}\songti
		\begin{tabular}{l}
			专\hspace{2\ccwd}业：\@cmajor \\
			硕\hspace{0.5\ccwd}士\hspace{0.5\ccwd}生：\@cauthor \\
			指导教师：\@cmentor
		\end{tabular}
		\vspace{\baselineskip}\\
        \phantomsection
		{\zihao{-2}\heiti{摘\hspace{2em}要}}  % issue #4
        \addcontentsline{toc}{chapter}{摘要}
	\end{center}		
		\begin{spacing}{1.5}
			\zihao{-4} \songti\@cabstract
		\end{spacing}
        \vspace{\baselineskip}
	\zihao{-4}\textbf{关键词：}\@ckeywords
}

% 英文摘要、关键字标题：小四号新罗马体(Time New Roman)加粗并加方括号
% 英文摘要、关键字内容：小四号新罗马体(Time New Roman)
\newcommand\makeeabstract{
	\begin{center}
		\zihao{-2}
		\mbox{ }\\
		\textbf{Title: \@etitle} 
		\vspace{\baselineskip}\\
		\zihao{3}
		\begin{tabular}{ll}
			Major: \@emajor \\
			Name: \@eauthor \\
			Supervisor: \@ementor
		\end{tabular}
		\vspace{\baselineskip}\\
        \phantomsection
		{\zihao{-2}\textbf{ABSTRACT}}  % issue #4
        \addcontentsline{toc}{chapter}{ABSTRACT}
	\end{center}
		\begin{spacing}{1.5}
			\zihao{-4} \@eabstract
		\end{spacing}
        \vspace{\baselineskip}
		\zihao{-4}\textbf{Keywords: }\@ekeywords
}

\newcommand\makeabstract{
	\setcounter{page}{1}
	\pagestyle{cAbstract}
	\makecabstract
	\clearpage
	\makeeabstract
	\pagestyle{eAbstract}
	\clearpage
}
\newcommand\maketableofcontents{
    \tocloftpagestyle{plain}
    \tableofcontents
    \clearpage
}

% \newcommand\makenotation{
%     \chapter{符号说明}%
%     \pagestyle{plain}
% }
  
  
%     \pagestyle{plain}%
%   \fi
% }%
% \newcommand*\notationlabel[1]{#1\hfil}%
% \newenvironment{notationlist}[1]{%
%   \list{}{%
%     \itemsep 3bp%
%     \labelwidth #1\relax%
%     \labelsep 1em%
%     \leftmargin\labelwidth
%     \advance\leftmargin\labelsep
%     \advance\leftmargin 3em%
%     \rightmargin 3em%
%     \let\makelabel\notationlabel
%   }%
% }{%
%   \endlist
% }

\renewcommand\mainmatter{
    \@mainmattertrue
    \pagenumbering{arabic}
    \ctexset {
        chapter = {
            %fixskip = true,
            beforeskip = {0pt},
            afterskip = {16.5pt},
            format = {\centering},
            nameformat = {\zihao{-2}\heiti},
            titleformat = {\zihao{-2}\heiti}
        },
        section = {
            %fixskip = true,
            beforeskip = {13pt},
            afterskip = {13pt},
            format = {},
            nameformat = {\zihao{-3}\bfseries},
            titleformat = {\zihao{-3}\bfseries}
        },
        subsection = {
            %fixskip = true,
            beforeskip = {10pt},
            afterskip = {10pt},
            format = {},
            nameformat = {\zihao{-4}\bfseries},
            titleformat = {\zihao{-4}\bfseries}
        },
        subsubsection = {
            beforeskip = {10pt},
            afterskip = {10pt},
            format = {},
            nameformat = {\zihao{-4}\bfseries},
            titleformat = {\zihao{-4}\bfseries}
            % 按照中大规定的格式需要显示成a.b.c.d章，而不是(d)节
            % number = {(\arabic{subsubsection})}
        }
    }

    \zihao{-4} \linespread{1.5}\selectfont
    \pagestyle{plain}
}

\renewcommand\backmatter{
    \@mainmatterfalse
    \fancypagestyle{plain}{ }
    \pagestyle{plain}
}

% 参考文献
% 参考文献引用标记格式：右上角，带方括号
% 合并相邻的参考文献
\RequirePackage[comma,square,super,sort&compress]{natbib}
% 标题与正文章节标题相同
% 内容小五号宋体
\newcommand\makereferences{
    \begingroup
        \ctexset {
            chapter = {
                format = {\centering},
                titleformat = {\zihao{-2}\heiti}
            }
        }
        % 每一个引用之间不添加多余间距
        \setlength{\bibsep}{0em}
        % 引用样式
        \bibliographystyle{bibtex-style/gbt7714-numerical}
        {\zihao{5}\rmfamily\songti\bibliography{reference}}    % 引用文献列表
    \endgroup
}

\newcommand\Nchapter[1]{%
	\if@mainmatter%
	\@mainmatterfalse%
	\chapter{#1}%
	\@mainmattertrue%
	\else
	\chapter{#1}%
	\fi}
\def\SYSU@label@publications{攻读硕士学位期间取得的研究成果}
\newenvironment{publications}[1]
{\Nchapter{\SYSU@label@publications}%
	\@mkboth{\MakeUppercase\SYSU@label@publications}
	{\MakeUppercase\SYSU@label@publications}%
	\list{\@biblabel{\@arabic\c@enumiv}}%
	{\settowidth\labelwidth{\@biblabel{#1}}%
		\leftmargin\labelwidth
		\advance\leftmargin\labelsep
		\@openbib@code
		\usecounter{enumiv}%
		\let\p@enumiv\@empty
		\renewcommand\theenumiv{\@arabic\c@enumiv}}%
	\sloppy
	\clubpenalty4000
	\@clubpenalty \clubpenalty
	\widowpenalty4000%
	\sfcode`\.\@m}
{\def\@noitemerr
	{\@latex@warning{Empty `publications' environment}}%
	\endlist}

% 附录样式
\renewcommand\appendix{\par
    \@mainmattertrue
    \fancypagestyle{plain}{}
    \pagestyle{plain}
    \setcounter{chapter}{0}
    \setcounter{section}{0}
    \gdef\@chapapp{\appendixname}
    \gdef\thechapter{\@Alph\c@chapter}
    \gdef\CTEX@prechapter{\CTEX@preappendix}
    \gdef\CTEX@thechapter{\CTEX@appendix@number}
    \gdef\CTEX@postchapter{}
    \ctexset {
        chapter = {
            format = {\centering},
            nameformat = {\zihao{-2}\heiti},
            titleformat = {\zihao{-2}\heiti},
        },
        section = {
            format = {\centering},
            nameformat = {\zihao{-3}\bfseries},
            titleformat = {\zihao{-3}\bfseries}
        },
        subsection = {
            format = {\centering},
            nameformat = {\zihao{-4}\bfseries},
            titleformat = {\zihao{-4}\bfseries}
        }
    }
}


% 配置超链接。
% hyperref一般要求是导言区最后一个宏包，才能正常工作
% 若把该宏包提前，则会引起附录列表跳转到第一章的问题
\RequirePackage[hidelinks, hyperfootnotes=true]{hyperref}
\RequirePackage{footnotebackref}

% 脚注只能标号①-⑩，超出标号会出现错误
\renewcommand{\@fnsymbol}[1]{
    \ifcase#1\or \text{①}\or \text{②}\or \text{③}\or    \text{④}\or \text{⑤}\or \text{⑥}\or \text{⑦}\or \text{⑧} \or \text{⑨} \or \text{⑩}
    \else
        \@ctrerr
    \fi
}
\renewcommand{\thefootnote}{\fnsymbol{footnote}}
