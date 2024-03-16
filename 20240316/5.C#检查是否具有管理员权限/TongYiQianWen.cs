// 以下是一个简单的C# .NET命令行程序，它会检查自身是否以管理员权限运行，并输出当前的用户和权限信息：

using System;
using System.Security.Principal;

class Program
{
    static void Main(string[] args)
    {
        WindowsIdentity identity = WindowsIdentity.GetCurrent();
        WindowsPrincipal principal = new WindowsPrincipal(identity);

        // 检查是否具有管理员权限
        bool isAdmin = principal.IsInRole(WindowsBuiltInRole.Administrator);

        Console.WriteLine("当前用户名: " + identity.Name);
        Console.WriteLine("是否以管理员权限运行: " + isAdmin);

        // 获取用户所属的所有组
        foreach (var group in identity.Groups)
        {
            try
            {
                NTAccount ntAccount = group.Translate(typeof(NTAccount)) as NTAccount;
                if (ntAccount != null)
                {
                    Console.WriteLine("用户组: " + ntAccount.Value);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"无法获取用户组信息: {ex.Message}");
            }
        }
    }
}

// 在上述代码中，我们首先通过 WindowsIdentity.GetCurrent() 获取当前用户的标识，然后创建一个 WindowsPrincipal 对象来确定用户的角色。使用 principal.IsInRole(WindowsBuiltInRole.Administrator) 来判断当前进程是否以管理员权限运行。

// 同时，我们遍历 identity.Groups 来获取用户所属的所有组，并将它们转换为可读的 NTAccount 格式进行输出。如果在转换过程中出现异常（例如，某些组可能无法转换），则捕获并打印异常消息。
