// 这是一个使用 JavaScript 实现的函数，可以在浏览器环境中运行，输入图片 URL，输出该 URL 所对应图片的宽高。这个函数也可以在缺乏 HTML DOM API 的环境中运行，比如 Service Worker。

function getImageDimensions(url) {
    return new Promise((resolve, reject) => {
        const img = new Image();
        img.onload = function() {
            resolve({ width: this.width, height: this.height });
        };
        img.onerror = function() {
            reject(new Error('Could not load image at ' + url));
        };
        img.src = url;
    });
}

// 使用示例
getImageDimensions('http://127.0.0.1/KagurazakaMasae_400x400.png')
    .then(dimensions => console.log(dimensions))
    .catch(error => console.error(error));

// 这个函数使用了 `Image` 对象来加载图片，然后在图片加载完成后，通过 `onload` 事件处理器获取图片的宽度和高度。如果图片加载失败，`onerror` 事件处理器会被调用，并且会抛出一个错误。
// 请注意，由于跨域限制，这个函数可能无法获取到一些图片的尺寸。在实际使用时，你可能需要处理这种情况。此外，这个函数返回的是一个 Promise，因此你需要使用 `.then()` 或者 `await` 来获取结果。如果图片加载失败，你可以使用 `.catch()` 来处理错误。
