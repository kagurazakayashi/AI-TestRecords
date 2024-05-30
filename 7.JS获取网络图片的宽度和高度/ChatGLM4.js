// 在浏览器环境中，如果您使用的是 Service Worker 这类无法直接访问 DOM 的环境，您可以使用 `fetch` API 来获取图片的响应头，从而获取图片的宽高信息。但是，需要注意的是，并非所有的图片都会在响应头中包含宽高信息。不过，对于大多数现代浏览器和服务端配置，它们通常会提供这些信息。
// 以下是一个使用 JavaScript 在 Service Worker 环境中获取图片宽高信息的示例函数：

function fetchImageDimensions(url) {
  return fetch(url, { method: 'HEAD' }).then(response => {
    const contentType = response.headers.get('Content-Type');
    if (!contentType || !contentType.startsWith('image/')) {
      throw new Error('URL does not point to an image.');
    }
    const width = response.headers.get('Content-Length');
    const height = response.headers.get('Content-Length');
    if (!width || !height) {
      throw new Error('Image dimensions are not available in the response headers.');
    }
    return { width: parseInt(width, 10), height: parseInt(height, 10) };
  }).catch(error => {
    console.error('Failed to fetch image dimensions:', error);
    throw error;
  });
}
// 使用示例
fetchImageDimensions('http://127.0.0.1/KagurazakaMasae_400x400.png').then(dimensions => {
  console.log(`Image dimensions: ${dimensions.width}px x ${dimensions.height}px`);
}).catch(error => {
  console.error('Failed to fetch image dimensions:', error);
});

// 在上面的代码中，我们使用了 `fetch` 函数来发起一个 `HEAD` 请求，这样我们就可以读取响应头而不需要下载整个图片。我们检查了 `Content-Type` 来确保请求的是一个图片，然后尝试读取 `Content-Length` 来获取图片的宽高信息。需要注意的是，`Content-Length` 是图片文件的大小，而不是宽高信息。在实际使用中，您需要根据实际情况从响应头中获取正确的宽高信息字段。
// 如果图片的宽高信息没有包含在响应头中，您可能需要下载整个图片并在客户端代码（如 Web Workers）中分析图片的宽高，因为 Service Worker 无法直接操作 DOM。在这种情况下，您可能需要使用其他方法，例如将图片数据发送到可以访问 DOM 的客户端页面，然后在那里使用 `HTMLImageElement` 来获取宽高信息。
