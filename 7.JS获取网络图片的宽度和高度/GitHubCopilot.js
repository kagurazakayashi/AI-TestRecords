// 要在没有 HTML DOM API 的环境中获取图像的尺寸，我们可以使用 fetch API 来获取图像数据，然后使用 ImageData 对象来获取图像的宽度和高度。以下是一个实现这个功能的函数的示例：

async function getImageDimensions(url) {
    const response = await fetch(url);
    const blob = await response.blob();
    const image = await createImageBitmap(blob);
    return {
        width: image.width,
        height: image.height
    };
}

// 你可以通过以下方式调用这个函数：

getImageDimensions('http://127.0.0.1/KagurazakaMasae_400x400.png')
    .then(dimensions => console.log(dimensions))
    .catch(error => console.error(error));

// 这个函数首先使用 fetch API 从给定的 URL 获取图像数据，然后将响应转换为 Blob 对象。然后，它使用 createImageBitmap 函数将 Blob 对象转换为 ImageBitmap 对象。最后，它返回一个包含图像宽度和高度的对象。
// 请注意，这个函数返回一个 Promise，因此你需要使用 then 或 await 来获取结果。
