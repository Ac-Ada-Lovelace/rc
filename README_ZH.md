### README (中文版)

# SysY 编译器

此仓库包含一个使用 Flex 和 Bison 实现的 SysY 编译器，开发环境为 Linux Manjaro。

## 目录
- [介绍](#介绍)
- [功能](#功能)
- [安装](#安装)
- [使用](#使用)
- [项目结构](#项目结构)
- [贡献](#贡献)
- [许可证](#许可证)
- [联系方式](#联系方式)

## 介绍
此仓库中的 SysY 编译器旨在将 SysY 程序编译成可执行代码。SysY 是一种主要用于教育目的的简单编程语言。该编译器使用 Flex 进行词法分析，使用 Bison 进行语法分析。

## 功能
- **词法分析**：使用 Flex 对 SysY 源代码进行标记。
- **语法分析**：将标记解析为语法树，使用 Bison。
- **错误处理**：检测和报告语法错误。
- **代码生成**：从语法树生成中间代码。
- **跨平台**：在 Linux Manjaro 上开发和测试。

## 安装
按照以下步骤在系统上安装和设置 SysY 编译器：

1. 克隆仓库：
    ```sh
    git clone https://github.com/Ac-Ada-Lovelace/rc.git
    cd rc
    ```

2. 安装必要的依赖项：
    ```sh
    sudo pacman -S flex bison make gcc
    ```

3. 构建项目：
    ```sh
    make
    ```

## 使用
要使用 SysY 编译器，运行以下命令：
```sh
./bin/sysy_compiler input_file.sy
