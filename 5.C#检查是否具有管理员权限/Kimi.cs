/*
创建一个C# .NET命令行程序来检查程序是否以管理员权限运行，并输出当前用户的用户名、用户组等信息，你可以按照以下步骤进行：

1. 打开Visual Studio或你选择的任何C#开发环境。
2. 创建一个新的C#控制台应用程序项目。
3. 在项目中添加以下代码：
*/

using System;
using System.Security.Principal;
using System.Linq;

namespace CheckAdminPermissions
{
    class Program
    {
        static void Main(string[] args)
        {
            // 检查是否以管理员权限运行
            bool isAdmin = false;
            try
            {
                WindowsIdentity identity = WindowsIdentity.GetCurrent();
                WindowsPrincipal principal = new WindowsPrincipal(identity);
                isAdmin = principal.IsInRole(WindowsBuiltInRole.Administrator);
            }
            catch (UnauthorizedAccessException ex)
            {
                Console.WriteLine("Error: " + ex.Message);
                return;
            }
            catch (Exception ex)
            {
                Console.WriteLine("An unexpected error occurred: " + ex.Message);
                return;
            }

            // 输出是否以管理员权限运行
            Console.WriteLine("Is running as Administrator: " + isAdmin);

            // 获取当前用户的用户名
            string userName = Environment.UserName;

            // 获取当前用户的用户组
            var groups = System.Security.Principal.WindowsIdentity.GetCurrent().User;
            string groupsInfo = string.Join(", ", groups.Translate(typeof(SecurityIdentifier)).Cast<SecurityIdentifier>().Select(x => x.Value));

            // 输出当前用户的用户名和用户组
            Console.WriteLine("Current User: " + userName);
            Console.WriteLine("User Groups: " + groupsInfo);

            // 等待用户输入，以便查看输出结果
            Console.WriteLine("Press any key to exit...");
            Console.ReadKey();
        }
    }
}

/*
4. 编译并运行你的程序。

这段代码首先检查当前运行的程序是否具有管理员权限。它使用`WindowsIdentity.GetCurrent()`获取当前用户的身份，然后使用`WindowsPrincipal`来检查该用户是否属于管理员组。之后，程序输出是否以管理员权限运行，当前用户的用户名，以及用户所属的用户组。

请注意，这段代码需要在Windows操作系统上运行，因为它使用了Windows特定的API来获取用户信息。此外，运行此程序时可能需要以管理员权限启动Visual Studio或命令行界面。
*/
