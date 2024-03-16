using System;
using System.Security.Principal;

namespace AdminCheck
{
    class Program
    {
        static void Main(string[] args)
        {
            // 获取当前用户的Windows身份信息
            WindowsIdentity identity = WindowsIdentity.GetCurrent();
            WindowsPrincipal principal = new WindowsPrincipal(identity);

            // 检查当前用户是否为管理员
            bool isAdmin = principal.IsInRole(WindowsBuiltInRole.Administrator);

            Console.WriteLine("当前用户: " + identity.Name);
            Console.WriteLine("是否管理员: " + (isAdmin ? "是" : "否"));

            // 输出用户所属的所有组
            Console.WriteLine("用户所属的组:");
            foreach (var group in identity.Groups.Translate(typeof(NTAccount)))
            {
                Console.WriteLine(group.Value);
            }
        }
    }
}
