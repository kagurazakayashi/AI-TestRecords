// 首先，我们需要创建一个.NET Core控制台应用程序。然后，我们将使用Windows的API函数来检查当前的用户和权限信息。我们将使用WindowsIdentity类来获取当前用户的信息，以及WindowsPrincipal类来检查用户是否属于特定的用户组（例如，管理员组）。我们还将使用new SecurityIdentifier(WellKnownSidType.BuiltinAdministratorsSid, null)来获取管理员组的安全标识符。

// 以下是详细的步骤：

// 创建.NET Core控制台应用程序。
// 导入必要的命名空间。
// 在Main方法中，获取当前用户的Windows标识。
// 使用Windows标识创建一个Windows主体。
// 检查Windows主体是否属于管理员组。
// 输出当前用户的用户名和用户组。
// 以下是对应的C#代码：

using System;
using System.Security.Principal;

class Program
{
    static void Main()
    {
        // 获取当前用户的Windows标识
        WindowsIdentity identity = WindowsIdentity.GetCurrent();
        // 使用Windows标识创建一个Windows主体
        WindowsPrincipal principal = new WindowsPrincipal(identity);

        // 获取管理员组的安全标识符
        SecurityIdentifier adminSid = new SecurityIdentifier(WellKnownSidType.BuiltinAdministratorsSid, null);

        // 检查Windows主体是否属于管理员组
        bool isAdmin = principal.IsInRole(adminSid);

        // 输出当前用户的用户名和用户组
        Console.WriteLine($"用户名: {identity.Name}");
        Console.WriteLine($"是否为管理员: {isAdmin}");
    }
}

// 这段代码将输出当前用户的用户名和他是否是管理员。
