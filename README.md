# math-modeling-toolkit

> 我们数模的基础算法，使用 MATLAB 实现

收集并整理数学建模中常用的基础算法，方便竞赛和平时学习时直接复用。每个算法独立成一个文件夹，配套示例数据和注释。

## 提醒
我的参考文档在[我的博客](https://sarzn.xyz/tags/%E6%95%B0%E6%A8%A1%E5%AD%A6%E4%B9%A0%E8%AE%B0%E5%BD%95/)

## 目录结构

| 文件夹 / 文件 | 说明 |
|---------------|------|
| `AHP/` | 层次分析法（Analytic Hierarchy Process），通过两两比较确定各指标权重，并做一致性检验 |
| `Topsis/` | TOPSIS 优劣解距离法，用于多属性综合评价与方案排序 |
| `LearBasicMatlab.m` | MATLAB 基础语法小白本 |


## 环境

- MATLAB（建议 R2019b 及以上，部分语法如 `size(A, [1 2])` 需要较新版本）
- 无需额外工具箱

## 使用方法

1. 克隆仓库：
   ```bash
   git clone https://github.com/ahpasserby/math-modeling-toolkit.git
   ```
2. 在 MATLAB 中将对应算法文件夹加入路径，或直接 `cd` 进入该文件夹。
3. 在MATLAB中运行主脚本，按提示输入数据

## 约定

- 每个算法单独一个文件夹，包含主脚本和必要的子函数。
- 函数文件名与函数名保持一致。
- 尽量在脚本开头用注释写清输入格式和示例。
