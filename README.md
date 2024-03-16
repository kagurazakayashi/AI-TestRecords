# AI test records

雅诗正在选择一款 AI 来辅助自己写代码，于是把几个 AI 拉一起进行了测试。

主要测试编程方面的辅助能力，顺便测试知识检索。

本仓库只如实记录结果，不做分析和统计。

## 回答记录方式

- 将每个回答记录成源码文件，文件名见下表。
- 除了回答的主要代码外，其他的陈述内容作为注释加入。

## 文件列表

| 存放回答结果的文件名       | 产品名称          | 引擎            | 账户类型          |
| -------------------------- | ----------------- | --------------- | ----------------- |
| `MSCopilotPro_GPT4Turbo.*` | Microsoft Copilot | GPT4Turbo       | Pro 付费版        |
| `GitHubCopilot.*`          | GitHub Copilot    | GPT3.5          | 付费版            |
| `GeminiAdvanced.*`         | Gemini            | Gemini Advanced | Google One 付费版 |
| `ChatGPT4.*`               | ChatGPT           | ChatGPT4        | Plus 付费版       |
| `YiYanPro_WenXin4.*`       | 文心一言          | 文心大模型 4.0  | 付费版            |
| `ChatGLM4.*`               | 智谱清言          | GLM4            | 免费(高级)版      |
| `TianGong.*`               | 天工              | 天工大模型 2.0  | 免费版            |
| `SparkDesk.*`              | 讯飞星火          | -               | 免费版            |
| `DouBao.*`                 | 豆包              | -               | 免费版            |
| `TongYiQianWen.*`          | 通义千问          | -               | 免费版            |

以上用免费版的均为没有付费版本的。

## 每个测试文件夹的测试固定文件

- `BUILD.SH` 或 `BUILD.BAT` : 测试脚本，编译所有回答的程序并运行。
- `BUILD.LOG` : 测试脚本运行日志，命令为 `BUILD.SH >BUILD.LOG 2>&1` 。
- `BUILD.MD` : 测试的问题、预期答案，以及其他事项。
  - 先看每个文件夹中的 `BUILD.MD` ，再看同文件夹下的 `BUILD.LOG` 。
