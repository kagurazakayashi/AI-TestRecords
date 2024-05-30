// 在浏览器环境中，尤其是在没有HTML DOM API的环境下（如Service Worker），我们依然可以使用JavaScript的 `fetch` API 和 `Image` 对象来加载图片并获取其宽高。下面是一个示例代码，展示了如何实现一个函数，该函数接受一个图片URL，并返回该图片的宽度和高度。

async function getImageDimensions(url) {
    return new Promise((resolve, reject) => {
        const img = new Image();

        img.onload = () => {
            resolve({ width: img.width, height: img.height });
        };

        img.onerror = (err) => {
            reject(new Error('Failed to load image'));
        };

        img.src = url;
    });
}

// 示例使用
const imageUrl = 'http://127.0.0.1/KagurazakaMasae_400x400.png';
getImageDimensions(imageUrl)
    .then(dimensions => {
        console.log(`Image dimensions: ${dimensions.width}x${dimensions.height}`);
    })
    .catch(error => {
        console.error(error.message);
    });

/*
说明：
1. **使用 `Image` 对象**：
   - 创建一个新的 `Image` 实例，并设置其 `src` 属性为指定的URL。这样可以加载图片并在图片加载完成后获取其宽度和高度。

2. **Promise 用法**：
   - 使用 `Promise` 来处理图片加载的异步操作，确保在图片加载成功或失败时可以正确处理结果。

3. **错误处理**：
   - `img.onerror` 事件用于捕获加载错误，并通过 `reject` 方法抛出错误信息。

注意事项：
- 该代码可以在Service Worker中运行，因为它使用了标准的JavaScript API，不依赖于DOM API。
- 请确保图片URL是可访问的，且服务器支持跨域请求（CORS）。

如果你在使用此函数时遇到跨域问题（如CORS限制），可能需要在服务器端配置适当的CORS头部。
*/
