// app/javascript/controllers/preview_controller.js
import { Controller } from "@hotwired/stimulus";
import { marked } from "marked";
import Swal from "sweetalert2";

export default class extends Controller {
  static targets = ["source", "preview"];

  connect() {
    this.show(); // 表單右側即時顯示
  }

  show() {
    const markdown = this.sourceTarget.value;
    const html = marked(markdown);
    this.previewTarget.innerHTML = html;
  }

  showInModal() {
    const markdown = this.sourceTarget.value;
    const htmlContent =
      '<div style="text-align: left;">' + marked(markdown) + "</div>";

    Swal.fire({
      title: "(ʘ_ʘ)",
      html: htmlContent,
      width: "90%",
      showCloseButton: true,
    });
  }
}
