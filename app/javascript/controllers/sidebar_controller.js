import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["sidebar"];

  toggle() {
    this.sidebarTarget.classList.toggle("hidden");
    this.sidebarTarget.classList.toggle("absolute");
    this.sidebarTarget.classList.toggle("inset-y-0");
    this.sidebarTarget.classList.toggle("left-0");
    this.sidebarTarget.classList.toggle("z-50");
    this.sidebarTarget.classList.toggle("lg:relative");
  }
}
