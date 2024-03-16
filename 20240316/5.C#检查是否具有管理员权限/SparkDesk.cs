// 以下是一个简单的C# .NET命令行程序，它检查自身是否以管理员权限运行，并输出当前的用户和权限信息：

using System;
using System.Security.Principal;

class Program
{
    static void Main()
    {
        // 创建一个Windows身份验证提供者
        WindowsIdentity identity = WindowsIdentity.GetCurrent();

        // 创建Windows权限对象
        WindowsPrincipal principal = new WindowsPrincipal(identity);

        // 检查当前用户是否是管理员组的成员
        bool isAdmin = principal.IsInRole(WindowsBuiltInRole.Administrator);

        Console.WriteLine("Username: " + identity.Name);
        Console.WriteLine("Is Admin: " + isAdmin);
    }
}

// 在这段代码中，我们首先获取了当前进程的Windows标识（WindowsIdentity），然后使用这个标识创建了一个WindowsPrincipal对象。接着，我们调用IsInRole方法来检查当前用户是否属于管理员组。最后，我们打印出用户名和用户是否为管理员的信息。
