// 以下是一个 C# .NET 命令行程序，用于检查自身是否以管理员权限运行，并输出当前的用户和权限信息：

using System;
using System.Security.Principal;

class Program
{
    static void Main(string[] args)
    {
        // 判断当前程序是否以管理员权限运行
        bool isAdministrator = IsAdministrator();

        // 获取当前用户
        WindowsIdentity currentUser = WindowsIdentity.GetCurrent();

        // 输出用户信息
        Console.WriteLine("用户名：" + currentUser.Name);
        Console.WriteLine("用户组：");
        foreach (WindowsPrincipal group in currentUser.Groups)
        {
            Console.WriteLine("  " + group.Name);
        }

        // 输出权限信息
        Console.WriteLine("是否以管理员权限运行：" + isAdministrator);
    }

    private static bool IsAdministrator()
    {
        WindowsIdentity current = WindowsIdentity.GetCurrent();
        WindowsPrincipal windowsPrincipal = new WindowsPrincipal(current);
        return windowsPrincipal.IsInRole(WindowsBuiltInRole.Administrator);
    }
}

// 使用方法

// 1. 将上述代码保存为 CheckAdmin.cs 文件。
// 2. 使用 Visual Studio 或其他 C# 开发工具编译该文件，生成 CheckAdmin.exe 可执行文件。
// 3. 以管理员权限运行该可执行文件。

// 说明

// 该程序首先使用 IsAdministrator() 方法判断当前程序是否以管理员权限运行。
// 然后使用 WindowsIdentity.GetCurrent() 方法获取当前用户。
// 接着使用 currentUser.Name 属性获取用户名，使用 currentUser.Groups 属性获取用户所属的所有组。
// 最后，输出用户信息和权限信息。

// 注意

// 如果该程序不是以管理员权限运行，则 IsAdministrator() 方法将返回 false，并且无法获取用户组信息。
// 为了以管理员权限运行该程序，可以右键单击该程序的可执行文件，选择“以管理员身份运行”。
// 扩展

// 可以根据需要扩展该程序，输出更多用户信息和权限信息，例如：
// 用户的 SID
// 用户的账户类型
// 用户的权限组
// 可以添加功能，根据用户权限执行不同的操作。

// 信息来源
// 1. www.bbsmax.com/topic/win10-cmd%E5%A7%8B%E7%BB%88%E7%AE%A1%E7%90%86%E5%91%98%E8%BF%90%E8%A1%8C/
