import { Controller } from "@hotwired/stimulus";
import Swal from "sweetalert2";

export default class extends Controller {
  connect() {
    this.element.addEventListener("click", (e) => {
      e.preventDefault();
      this.showLoginForm();
    });
  }

  showLoginForm() {
    Swal.fire({
      title: "Q∫SignIN",
      html: `
            <span class="text-red-500 text-sm">＊目前尚未開放註冊</span>
            <form action="/users/sign_in" method="post" class="text-center">
              <div class="my-4">
                <input name="user[email]" type="email" placeholder="請輸入email" required class="input input-bordered w-3/5 max-w-xs">
              </div>
              <div class="mb-4">
                <input name="user[password]" type="password" placeholder="請輸入密碼" required class="input input-bordered w-3/5 max-w-xs">
              </div>
              <div class="mb-4 flex justify-center items-center">
                <input type="checkbox" name="remember_me" id="remember_me" class="mr-2">
                <label for="remember_me" class="text-sm">記住帳號</label>
              </div>
              <div>
                <input type="submit" value="登入" class="px-4 py-2 bg-green-500 text-white rounded hover:bg-blue-600 cursor-pointer">
              </div>
            </form>
            `,
      showConfirmButton: false,
      showCloseButton: true,
    });
  }
}
