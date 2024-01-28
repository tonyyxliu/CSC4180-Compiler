# Environment Setup

Since our cluster does not have a RISC-V CPU, we have to create a RISC-V64-QEMU docker container to enable you to execute RISC-V programs. Everyone is supposed to receive an email about your username and password. Please follow the instructions given in the email to log in to the cluster docker container and have a try with the Clang-LLVM tutorial to get a hands-on experience on what each compiler phase does and outputs.

## Tutorials

- Clang-LLVM (Phase-by-Phase Instruction): [Here](./Clang-LLVM.md)
- SSH login without password: [Here](./SSH-login-without-password.md)
- Lex/Flex & Yacc/Bison
  - [A calculator example with flex/bison](https://github.com/meyerd/flex-bison-example)
  - [In Chinese: 手把手教程-lex与yacc/flex与bison入门](https://blog.csdn.net/weixin_44007632/article/details/108666375)
  - [Youtube Video: Writing a Compiler with flex and bison](https://www.youtube.com/playlist?list=PL3czsVugafjNLmIHA8ODBxuwWy8W4Uk9h)
  - [Tutorial slides on flex/bison, from the University of Delaware](https://www.capsl.udel.edu/courses/cpeg421/2012/slides/Tutorial-Flex_Bison.pdf)
- LLVM IR
  - [Official: LLVM Language Reference Manual](https://llvm.org/docs/LangRef.html#calling-conventions)
  - [In Chinese: LLVM IR入门指南](https://evian-zhang.github.io/llvm-ir-tutorial/index.html)
  - [Official: LLVM IRBuilder Class Interface](https://llvm.org/doxygen/classllvm_1_1IRBuilderBase.html)
  - [LLVM Tutorial Slides from the University of Rochester](https://www.cs.rochester.edu/u/criswell/asplos19/ASPLOS19-LLVM-Tutorial.pdf)
  - [LLVM Compiler Infrastructure Tutorial slides from Carnegie Mellon University](https://www.cs.cmu.edu/afs/cs/academic/class/15745-s12/public/lectures/L3-LLVM-Part1.pdf)
  - [Official: 3. Kaleidoscope: Code Generation to LLVM IR](https://llvm.org/docs/tutorial/MyFirstLanguageFrontend/LangImpl03.html#chapter-3-introduction)
  - [Youtube Video: 2019 EuroLLVM Developers' Meeting, "LLVM IR Tutorial" from V.Bridgers & F.Piovezan](https://www.youtube.com/watch?v=m8G_S5LwlTo)
  