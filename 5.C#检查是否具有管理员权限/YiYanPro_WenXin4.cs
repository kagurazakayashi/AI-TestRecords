// 以下是一个简单的C# .NET 命令行程序，该程序检查自身是否以管理员权限运行，并输出当前的用户和权限信息。请注意，为了获取用户组信息，我们需要使用 System.DirectoryServices.AccountManagement 命名空间。

using System;  
using System.DirectoryServices.AccountManagement;  
using System.Security.Principal;  
  
namespace CheckAdminRights  
{  
    class Program  
    {  
        static void Main(string[] args)  
        {  
            // 检查程序是否以管理员权限运行  
            WindowsIdentity identity = WindowsIdentity.GetCurrent();  
            WindowsPrincipal principal = new WindowsPrincipal(identity);  
            bool isAdmin = principal.IsInRole(WindowsBuiltInRole.Administrator);  
  
            Console.WriteLine("Is running as administrator: " + isAdmin);  
  
            // 获取并输出当前用户名  
            string userName = identity.Name;  
            Console.WriteLine("Current user: " + userName);  
  
            // 获取并输出用户所属的所有组  
            using (PrincipalContext context = new PrincipalContext(ContextType.Machine))  
            {  
                UserPrincipal user = UserPrincipal.FindByIdentity(context, userName);  
                if (user != null)  
                {  
                    PrincipalSearchResult<Principal> groups = user.GetGroups();  
                    Console.WriteLine("User groups:");  
                    foreach (Principal p in groups)  
                    {  
                        Console.WriteLine(p.Name);  
                    }  
                }  
                else  
                {  
                    Console.WriteLine("User not found.");  
                }  
            }  
        }  
    }  
}

// 这个程序首先检查它是否以管理员权限运行，然后获取并输出当前的用户名。接着，它使用 PrincipalContext 和 UserPrincipal 类来获取当前用户所属的所有组，并将这些组输出到控制台。

// 注意：这个程序需要在能够访问Active Directory的环境中运行，因为它使用了 System.DirectoryServices.AccountManagement 命名空间。如果你的环境没有Active Directory，或者你不能访问它，那么你可能需要找到另一种方法来获取用户组信息。此外，获取用户组信息可能需要一些额外的权限，如果程序没有这些权限，那么这部分代码可能会失败。
