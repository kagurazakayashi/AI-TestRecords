// 在C#中，您可以使用System.Security.Principal.WindowsIdentity类来获取当前用户的标识信息，并使用System.Security.Principal.WindowsPrincipal类来检查用户是否属于管理员组。
// 以下是一个简单的C# .NET命令行程序示例，该程序将检查自身是否以管理员权限运行，并输出当前的用户名和权限信息：

using System;
using System.Security.Principal;

class Program
{
    static void Main()
    {
        // 获取当前Windows用户标识
        WindowsIdentity identity = WindowsIdentity.GetCurrent();
        // 获取当前Windows用户主体
        WindowsPrincipal principal = new WindowsPrincipal(identity);

        // 输出当前用户名
        Console.WriteLine("当前用户名: " + identity.Name);

        // 检查用户是否属于管理员组
        bool isAdmin = principal.IsInRole(WindowsBuiltInRole.Administrator);
        Console.WriteLine("当前用户是否是管理员: " + isAdmin);

        // 如果不是以管理员权限运行，则提示用户
        if (!isAdmin)
        {
            Console.WriteLine("请以管理员身份运行此程序以获取完整权限信息。");
        }
        else
        {
            // 如果是管理员，输出额外的用户组信息
            // 注意：获取用户组信息可能需要额外的权限和Windows API调用
            // 这里仅作为一个演示，实际中可能需要更复杂的实现
            Console.WriteLine("当前用户组: 管理员组");
        }
    }
}

// 要运行此程序，请按照以下步骤操作：
// 1. 打开文本编辑器（如Notepad或任何其他代码编辑器）。
// 2. 将上述代码复制并粘贴到编辑器中。
// 3. 将文件保存为具有.cs扩展名的文件，例如CheckAdminRights.cs。
// 4. 打开命令提示符或PowerShell窗口。
// 5. 使用csc命令编译代码，运行以下命令：
// csc /target:exe /out:CheckAdminRights.exe CheckAdminRights.cs
// 这将生成一个名为CheckAdminRights.exe的可执行文件。
// 6. 在命令行中，您可以运行此程序，如果想要以管理员权限运行，可以右键点击命令提示符或PowerShell窗口的标题栏，选择“以管理员身份运行”，然后执行程序：
// CheckAdminRights.exe

// 程序将输出当前的用户名和权限信息。如果程序没有以管理员权限运行，它将提示您以管理员身份重新运行程序。
