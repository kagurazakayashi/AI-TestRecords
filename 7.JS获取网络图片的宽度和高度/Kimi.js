// 在浏览器环境中，通常可以通过创建一个 `Image` 对象来获取图片的宽高信息。然而，在像 Service Worker 这样的环境下，由于没有 DOM API，我们不能直接使用 `document.createElement` 来创建 `Image` 对象。不过，我们可以使用 `fetch` API 来获取图片的二进制数据，然后使用 `Blob` 对象和 `URL.createObjectURL` 来创建一个可以用于创建 `Image` 对象的 URL。

// 以下是一个示例函数，它使用 `fetch` API 来获取图片数据，并在 Service Worker 环境中也能正常运行：

async function getImageDimensions(url) {
  try {
    // 使用 fetch API 获取图片数据
    const response = await fetch(url);
    if (!response.ok) {
      throw new Error(`HTTP error! status: ${response.status}`);
    }
    // 将响应体转换为 Blob
    const blob = await response.blob();
    // 创建一个可以用于 Image 对象的 URL
    const objectURL = URL.createObjectURL(blob);
    
    // 创建一个 Image 对象来加载图片
    const img = new Image();
    img.src = objectURL;

    // 当图片加载完成后，获取宽高信息
    return new Promise((resolve, reject) => {
      img.onload = () => {
        // 解析宽高信息
        const dimensions = {
          width: img.naturalWidth,
          height: img.naturalHeight
        };
        // 解除对 Blob 的引用
        URL.revokeObjectURL(objectURL);
        resolve(dimensions);
      };
      img.onerror = reject;
    });
  } catch (error) {
    console.error('Failed to fetch or load image:', error);
    throw error;
  }
}

// 使用示例
getImageDimensions('http://127.0.0.1/KagurazakaMasae_400x400.png')
  .then(dimensions => console.log('Image dimensions:', dimensions))
  .catch(error => console.error('Error getting image dimensions:', error));

// 请注意，这个函数是异步的，因为它返回一个 `Promise` 对象。这意味着你需要使用 `.then()` 和 `.catch()` 来处理成功和失败的情况。此外，由于 Service Worker 环境的限制，确保 Service Worker 脚本中已经注册了相应的 fetch 事件处理器。
