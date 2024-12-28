# SysY Compiler

This repository contains a SysY compiler based on Flex and Bison, developed on Linux Manjaro.

## Table of Contents
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)

## Introduction
This project is a SysY compiler implemented using Flex and Bison. It is developed on Linux Manjaro and aims to provide a robust and efficient compiler for the SysY language.

## Installation
To install and set up the project, follow these steps:

1. Clone the repository:
    ```sh
    git clone https://github.com/Ac-Ada-Lovelace/rc.git
    cd rc
    ```

2. Install the necessary dependencies:
    ```sh
    sudo pacman -S flex bison make gcc
    ```
Other OS, please install dependencies at first
3. Build the project:
    ```sh
    make buil
    ```

## Usage
To use the SysY compiler, run the following command:
```sh
tcc < [Source code] > targetfile.asm
```

