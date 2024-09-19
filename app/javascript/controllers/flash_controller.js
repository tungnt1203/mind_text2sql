import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    this.hideFlash();
  }

  hideFlash() {
    setTimeout(() => {
      this.element.classList.add("opacity-0", "translate-x-full");
      setTimeout(() => {
        this.element.remove();
      }, 500);
    }, 5000);
  }

  close() {
    this.element.remove();
  }
}
