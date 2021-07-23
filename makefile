##  https://www.jianshu.com/p/ff0e0e26c47a

# Makefile and shell
#你可以认为makefile是shell脚本“派生”出来的。最朴素的makefile可以完全通过gcc等语句实现，在这种情况下也就是shell脚本了。
#但是为了方便，makefile引入了大量的语法用来使编译链接变得简单，所以和shell脚本还是不同的。

#calc:\
	 main.c getch.c getop.c stack.c\
    gcc -o calc main.c getch.c getop.c stack.c \
#	1. 现在你看到的就是一个最基本的Makefile语句，它主要分成了三个部分，第一行冒号之前的calc，我们称之为目标（target），具体到这里就是我们所要编译的这个程序calc。
#	2. 冒号后面的部分	（main.c getch.c getop.c stack.c），我们称之为依赖关系表，也就是编译calc所需要的文件，这些文件只要有一个发生了变化，
#	3. 就会触发该语句的第三部分，我们称其为命令部分，相信你也看得出这就是一条编译命令。


#CC=g++  #需要使用的编译器
#CXXFLAGS = -std=c++0x  #表示C++编译器用到的选项
#CFLAGS=-I #表示C编译器用到的选项，指定头文件的路径
#skiplist: main.o   
#	$(CC) -o ./bin/main main.o --std=c++11 -pthread 
#	rm -f ./*.o

#clean: 
#	rm -f ./*.o


 #需要编译程序target + 依赖关系表 + 命令部分
cc = g++
prom= main
obj = main.o

$(prom):$(obj) 
	$(cc) -o ./bin/$(prom) $(obj) --std=c++11 -pthread 
	rm -f ./*.o

main.o : main.cpp
	$(cc) -c main.cpp
	

clean: 
	rm -f ./*.o

#expand:
#     %.o: %.c $(deps)
#        $(cc) -c $< -o $@
#这里，我们用到了几个特殊的宏。首先是%.o:%.c，这是一个模式规则，表示所有的.o目标都依赖于与它同名的.c文件（当然还有deps中列出的头文件）。
#再来就是命令部分的 < 和 @，其中 '<' 代表依赖关系表中的第一项（如果我们想引用的是整个依赖关系表，用‘^’），具体到我们这里就是%.c。而$@代表的是当前语句的目标，即%.o。
#这样一来，make命令就会自动将所有的.c源文件编译成同名的.o文件。不用我们一项一项去指定了。整个代码自然简洁了许多。
