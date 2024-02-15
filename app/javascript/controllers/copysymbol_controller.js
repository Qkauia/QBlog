import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="copysymbol"
export default class extends Controller {
  static targets = ["button"];

  copy(event) {
    event.preventDefault();
    const symbol = event.currentTarget.textContent;
    navigator.clipboard
      .writeText(symbol)
      .then(() => {
        this.showFlashMessage(`${symbol}已複製到剪貼板！`);
      })
      .catch((err) => {
        console.error("複製失敗:", err);
      });
  }

  showFlashMessage(message) {
    let flashMessage = document.createElement("div");
    flashMessage.className = "flash-message";
    flashMessage.textContent = message;
    document.body.appendChild(flashMessage);

    // 顯示訊息
    setTimeout(() => {
      flashMessage.style.display = "block";
      flashMessage.style.opacity = "1";
    }, 10);

    // 幾秒後消失
    setTimeout(() => {
      flashMessage.style.opacity = "0";
      setTimeout(() => {
        document.body.removeChild(flashMessage);
      }, 500); // 等待淡出動畫完成
    }, 2000); // 這裡的3000（3秒）可以根據需要調整
  }
}
