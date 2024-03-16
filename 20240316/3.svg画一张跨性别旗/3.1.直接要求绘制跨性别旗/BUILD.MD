# 问题

创建一段svg代码，该代码创建了一张跨性别旗帜。

# 预期答案

得到一个由**svg代码**绘制的**跨性别旗帜**。

跨性别旗由**五条水平条纹**组成，从上到下依次为浅蓝色、粉红色、白色、粉红色、浅蓝色。

| 颜色 | 近似色值 | 纵向占比 |
| ---- | --------- | --- |
| 浅蓝 | `#5BCEFA` | 20% |
| 粉红 | `#F5A9B8` | 20% |
| 白色 | `#FFFFFF` | 20% |
| 粉红 | `#F5A9B8` | 20% |
| 浅蓝 | `#5BCEFA` | 20% |

一个标准示例（来自[维基百科](https://zh.wikipedia.org/wiki/%E8%B7%A8%E6%80%A7%E5%88%A5%E6%97%97)）：

```svg
<?xml version="1.0" encoding="UTF-8"?>
<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 800 480">
  <rect fill="#5BCEFA" width="800" height="480" />
  <rect fill="#F5A9B8" width="800" height="288" y="96" />
  <rect fill="#FFF" width="800" height="96" y="192" />
</svg>
```
