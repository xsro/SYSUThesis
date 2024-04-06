# 中山大学研究生学位论文 $\LaTeX$ 模板（试用）
**注意：项目的可用代码在main分支上，请勿使用test分支上的代码进行论文写作！**

一直以来，中山大学的研究生学位论文缺乏官方的统一模板，各个学院的论文格式要求不统一。从2021年上半年开始，中山大学要求所有研究生学位论文必须提交盲审，并且有关部门在学生毕业后仍要对学位论文进行抽查，因此需要一个统一的模板来规范论文的格式，以在盲审以及后续的抽查中取得更多优势。本人使用本模板完成硕士学位论文，并在此之后对模板的细节进行进一步打磨。

## 如何使用

### overleaf 编辑（在线）

本模板可以使用 [overleaf](https://www.overleaf.com/) 在线编辑，需要在代码页面提前下载 `SYSUThesis-main.zip`压缩包。

步骤如下：

1. 进入 [overleaf](https://overleaf.com) 并登录账号
2. 左侧 `New Project` 选择 `Upload Project`
3. 上传 `.zip` 压缩包，建立新项目
4. 点击 `menu`，滑动到下方 `Settings` 的 `Compiler` 选择 `XeLaTeX`，一般建议选择最新版本
5. 打开 `main.tex` 文件，点击中间右侧上方的 `Recompile` 进行编译
6. 如果顺利可以看到 pdf 的预览
7. 如果无法加载图片只有路径信息，点击 `Recompile` 旁边的倒三角，其中的 `Compile Mode` 选择 `Normal` 模式

此时可以得到完整的 `main.pdf` 文件。

### TeX Live 编译（本地）

本模板需要使用 TeX Live(>=2017) 进行编译，编译命令如下：

- 编译论文 `main.pdf`：
   ```
   latexmk -xelatex main.tex
   ```
- 如需清理论文编译过程中的临时文件，可以：
   ```
   latexmk -c
   ```

- 以上编译过程也可以用 `make` 工具：
   ```
   make pdf        # 编译生成论文 main.pdf
   make clean      # 删除编译过程中生成的临时文件
   ```

## 相关规范
[中山大学研究生学位论文格式要求](http://graduate.sysu.edu.cn/rules)

## 项目代码参考
1. [中山大学LaTeX论文项目模板(非官方)](https://gitlab.com/sysu-gitlab/latex-group/thesis/-/tree/dev)
1. [中山大学LaTeX论文项目模板](https://github.com/SYSU-SCC/sysu-thesis)
1. [GB/T 7714-2015 BibTeX Style](https://github.com/zepinglee/gbt7714-bibtex-style)（官方宏包）
1. [中国科学技术大学学位论文 LaTeX 模板](https://github.com/ustctug/ustcthesis)

## 致谢
1. 感谢[@huangjj27](https://github.com/huangjj27) @a20185 @Kinpzz @yttty @perqin @noeagles 等人为本模板提供了[基础代码](https://gitlab.com/sysu-gitlab/latex-group/thesis/-/tree/dev)
1. 感谢B. CAI对本项目的宣传。
1. 感谢J. LI、[C. SHAO](https://github.com/ShaoChangk)、[Y. XIE](https://github.com/marc-antoine233)、Y. YANG同学为本模板提供参考示例。

## 错误反馈以及改进
一个人的力量有限，希望大家踊跃提出自己的想法，对于不符合格式要求的内容和部分过于丑陋的代码提交pr和issue，一起完善和改进该 $\LaTeX$ 模板， Make **SYSU** Great Again！
