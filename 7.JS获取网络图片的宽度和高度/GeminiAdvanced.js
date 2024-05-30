/* 好的，下面是一个可以在浏览器环境和 Service Worker 环境中运行的 JavaScript 函数，用于获取图片的宽高。

**核心原理**

* **Image 对象：** JavaScript 的 Image 对象可以在不依赖 DOM 的情况下加载图片。
* **onload 事件：** 当图片加载完成后，触发 onload 事件，此时可以获取图片的实际宽高。
* **Promise：** 使用 Promise 封装异步操作，使得代码更易读和维护。

**代码实现**/

function getImageDimensions(imageUrl) {
  return new Promise((resolve, reject) => {
    const img = new Image();
    img.onload = () => resolve({ width: img.width, height: img.height });
    img.onerror = (err) => reject(err);
    img.src = imageUrl;
  });
}

// 示例用法 (浏览器环境)
getImageDimensions('http://127.0.0.1/KagurazakaMasae_400x400.png')
  .then(dimensions => console.log(dimensions)) 
  .catch(error => console.error('加载图片失败:', error));

// 示例用法 (Service Worker 环境)
self.addEventListener('message', async (event) => {
  if (event.data.type === 'getImageDimensions') {
    try {
      const dimensions = await getImageDimensions(event.data.imageUrl);
      event.source.postMessage({ type: 'imageDimensionsResult', dimensions });
    } catch (error) {
      event.source.postMessage({ type: 'imageDimensionsError', error });
    }
  }
});

/**代码解释**

1. **getImageDimensions(imageUrl)：** 
   - 接收图片 URL 作为参数。
   - 返回一个 Promise 对象，用于处理异步加载图片的过程。

2. **Promise 内部：**
   - 创建 Image 对象 `img`。
   - 设置 `img.onload` 事件处理函数，在图片加载完成后：
     - 解析 Promise，返回包含 `width` 和 `height` 的对象。
   - 设置 `img.onerror` 事件处理函数，在图片加载失败时：
     - 拒绝 Promise，返回错误信息。
   - 设置 `img.src` 为传入的图片 URL，开始加载图片。

3. **示例用法（浏览器环境）：**
   - 调用 `getImageDimensions` 函数，传入图片 URL。
   - 使用 `.then` 处理成功加载的情况，打印图片尺寸。
   - 使用 `.catch` 处理加载失败的情况，打印错误信息。

4. **示例用法（Service Worker 环境）：**
   - 监听 `message` 事件。
   - 如果收到 `getImageDimensions` 类型的消息，则：
     - 调用 `getImageDimensions` 函数获取图片尺寸。
     - 使用 `postMessage` 将结果或错误信息发送回消息来源。

**注意事项**

* **跨域问题：** 如果图片 URL 是跨域的，需要确保服务器正确设置了 CORS 头信息，否则可能会因为安全限制而无法获取图片尺寸。
* **错误处理：** 在 Service Worker 环境中，务必处理 `getImageDimensions` 函数可能抛出的错误，避免 Service Worker 崩溃。

希望这个详细的解答能帮助到你！如果你还有其他问题，欢迎随时提出。*/
