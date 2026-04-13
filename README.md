Energy Use in Irrigated Agriculture复现项目
项目简介
本仓库用于复现 Lund et al. (2025) 论文 “Global Energy Use and Carbon Emissions in Irrigated Agriculture” 中的关键结果，包括文章中的一些主要结果图（Fig1–Fig5）。

全文链接

项目结构
- report/               # HTML 格式的分析报告目录
  - Main Results1.html and  main Results2.html # 主要结果报告，包含关键指标和可视化
- results/              # 最终导出的图像文件目录
- README.md             # 说明文档


复现简要过程
1、在RStudio中下载复现所需包（所需包在每一段代码前都有标注，直接下载即可）比如：

# Load packages
library(caret)
library(dplyr)
library(tidyr)
library(forcats)
library(data.table)
library(randomForest)
library(pROC)
library(utils)
library(patchwork)
则需要下载标注的所需包

2、在Positron中运行各部分代码

3、html文件的生成

# 更改文件名（最关键）
用把文件名改成：main_results1.rmd（下划线代替空格，后缀大写 .Rmd）

# 确认并切换到正确的工作目录
（1.）查看当前工作目录：getwd()
（2）强制切换到文件所在的 report 文件夹：setwd("d:/D2RS/JKZY/report")
 (3) 验证文件是否存在（执行后应该返回 TRUE）:file.exists("main_results1.Rmd")

# 执行正确的渲染命令：在控制台进行
(1) 加载 rmarkdown 包（防止未加载报错）:library(rmarkdown)
（2）执行渲染（文件名必须和实际文件完全一致）：rmarkdown::render("main_results1.Rmd", output_format = "html_document")

# 执行成功后，目录下会生成：

Main Results1.html
Main Results2.html
联系与反馈 如有问题，请在本仓库 Issues 提问， 祝复现顺利！
