// 以下是使用 JavaScript 实现的函数，它可以在浏览器环境中获取输入图片 URL 所对应的图片的宽高，并且在缺乏 HTML DOM API 的环境（如 Service Worker）中也能正常运行：
function getImageDimensions(url) {
  return new Promise((resolve, reject) => {
    const img = new Image();
    img.onload = function() {
      resolve({ width: this.width, height: this.height });
    };
    img.onerror = function() {
      reject(new Error('无法加载图片'));
    };
    img.src = url;
  });
}

// 测试
getImageDimensions('http://127.0.0.1/KagurazakaMasae_400x400.png')
 .then(dimensions => console.log(dimensions))
 .catch(error => console.error(error));