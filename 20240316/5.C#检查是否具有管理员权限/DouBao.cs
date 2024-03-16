// 以下是一个简单的 C#.NET 命令行程序示例，用于检查程序是否以管理员权限运行，并输出当前用户和权限信息：

using System;
using System.Security.Principal;

class Program
{
    static void Main()
    {
        // 检查是否以管理员权限运行
        bool isAdmin = WindowsIdentity.GetCurrent().User.IsInRole(WindowsBuiltInRole.Administrator);

        // 获取当前用户信息
        WindowsIdentity identity = WindowsIdentity.GetCurrent();
        string userName = identity.Name;
        WindowsPrincipal principal = new WindowsPrincipal(identity);

        // 输出结果
        if (isAdmin)
        {
            Console.WriteLine("以管理员权限运行");
        }
        else
        {
            Console.WriteLine("不以管理员权限运行");
        }
        Console.WriteLine($"用户名: {userName}");
        Console.WriteLine($"用户组: {principal.User.Value}");
    }
}

// 在这个示例中，我们使用 WindowsIdentity.GetCurrent() 获取当前的 Windows 身份信息。然后，通过检查 IsInRole(WindowsBuiltInRole.Administrator) 来确定是否以管理员权限运行。
// 接下来，我们获取当前用户的名称和用户组信息，并将其输出到控制台。
// 请注意，这个示例需要在 Windows 操作系统上运行，并且需要相应的权限来获取用户和权限信息。在实际应用中，可能需要根据具体的需求进行进一步的错误处理和权限验证。
// 希望这个示例对你有所帮助！如果还有其他问题，请随时提问。
