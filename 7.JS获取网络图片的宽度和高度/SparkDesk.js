async function getImageSize(url) {
    return new Promise((resolve, reject) => {
      const image = new Image();
      image.onload = () => {
        resolve({ width: image.width, height: image.height });
      };
      image.onerror = (error) => {
        reject(error);
      };
      image.src = url;
    });
  }
  
  // 使用示例
  getImageSize('http://127.0.0.1/KagurazakaMasae_400x400.png')
    .then((size) => {
      console.log(`图片宽度： ${size.width}, 高度： ${size.height}`);
    })
    .catch((error) => {
      console.error('获取图片尺寸失败：', error);
    });
  