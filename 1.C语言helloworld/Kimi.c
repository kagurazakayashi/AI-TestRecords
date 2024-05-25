// 当然可以，下面是一个简单的C语言程序，用于输出字符串 "Hello, World!"：

#include <stdio.h>

int main() {
    // 输出 "Hello, World!"
    printf("Hello, World!\n");
    return 0;
}

/*
这个程序包含了一个 `main` 函数，这是所有C程序的入口点。程序中使用了 `printf` 函数来输出字符串 "Hello, World!" 到标准输出（通常是终端或控制台）。`\n` 是一个换行符，用于在输出后换到下一行。

要运行这个程序，你需要将它保存到一个 `.c` 文件中，然后使用C编译器（如gcc）编译并运行它。例如，如果你的文件名为 `hello.c`，你可以在命令行中使用以下命令来编译和运行：

gcc hello.c -o hello
./hello

这将编译你的程序并生成一个可执行文件 `hello`，然后运行它，你应该会看到 "Hello, World!" 被打印到控制台。
*/
