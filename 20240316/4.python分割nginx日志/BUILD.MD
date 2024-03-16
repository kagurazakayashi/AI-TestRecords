# 问题

创建一个 python 脚本，该脚本使用参数传入一个 nginx 日志文件路径，根据该文件中的每条日志的时间日期创建子文件夹，并将“分钟.log”作为文件名保存在里面。日志中时间日期的格式示例为“2023/03/16 19:01:30”，位于每行的前端；要创建的文件夹路径格式为“年/月/日/小时”，如果文件或文件夹不存在则新建，如果文件已经存在则追加。

## 额外说明

- 如果 AI 生成的内容没有按要求从参数输入文件名，则在生成的内容中进行了手动修正（直接固定读取 `test.log` ），并加以注释。

# 预期答案

```
2023
└── 03
    └── 16
        └── 19
            ├── 01.log
            └── 02.log
2024
├── 02
│   └── 15
│       └── 14
│           └── 42.log
└── 03
    ├── 16
    │   ├── 14
    │   │   └── 42.log
    │   └── 15
    │       ├── 30.log
    │       ├── 33.log
    │       ├── 37.log
    │       └── 55.log
    └── 17
        ├── 15
        │   └── 55.log
        └── 18
            └── 20.log

2023/03/16 19:02:20 [error] 29#29: *18348 open() "/usr/share/nginx/html/uuu/security.txt" failed (2: No such file or directory), client: 162.158.163.100, server: uuu.moe, request: "GET /security.txt HTTP/1.1", host: "uuu.moe"
2023/03/16 19:02:30 [error] 29#29: *18351 open() "/usr/share/nginx/html/uuu/trust.txt" failed (2: No such file or directory), client: 162.158.106.199, server: uuu.moe, request: "GET /trust.txt HTTP/1.1", host: "uuu.moe"
```
