// 以下是一个简单的 C# .NET 命令行程序示例，它可以检查程序是否以管理员权限运行，并输出当前用户的用户名和用户组信息：

using System;
using System.Security.Principal;

namespace AdminCheck
{
    class Program
    {
        static void Main(string[] args)
        {
            // 检查是否以管理员权限运行
            bool isAdmin = new WindowsPrincipal(WindowsIdentity.GetCurrent())
                           .IsInRole(WindowsBuiltInRole.Administrator);

            // 获取当前用户的用户名和用户组
            string userName = Environment.UserName;
            string userDomainName = Environment.UserDomainName;

            Console.WriteLine("当前用户名: " + userName);
            Console.WriteLine("用户域名: " + userDomainName);
            Console.WriteLine("是否以管理员权限运行: " + (isAdmin ? "是" : "否"));
        }
    }
}

// 这段代码首先使用 WindowsPrincipal 和 WindowsIdentity 类来检查当前用户是否具有管理员权限。然后，它使用 Environment 类获取当前用户的用户名和用户域名，并将这些信息输出到控制台。如果程序以管理员权限运行，它会输出“是”，否则输出“否”。您可以将这段代码保存为 .cs 文件，并使用 C# 编译器编译运行。请确保在具有管理员权限的环境中测试此程序。如果您需要进一步的帮助，请随时告诉我！
