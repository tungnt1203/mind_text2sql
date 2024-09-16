import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  connect() {
    // Show modal when controller connects
    document.getElementById("modal-container").classList.remove("hidden");
  }

  close() {
    document.getElementById("modal-container").classList.add("hidden");
  }

  submitEnd(event) {
    if (event.detail.success) {
      this.close();
    }
  }
}
