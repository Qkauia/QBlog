// app/javascript/controllers/preview_controller.js
import { Controller } from "@hotwired/stimulus";
import { marked } from "marked";

export default class extends Controller {
  static targets = ["source", "preview"];

  show() {
    this.previewTarget.innerHTML = marked(this.sourceTarget.value);
  }
}
