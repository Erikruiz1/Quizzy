import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="loading"
export default class extends Controller {
  static targets = ["spinner"];
  connect() {
    console.log("hello");
  }

  toggle(event) {
    console.log(event);
    console.log(this.spinnerTarget)
    console.log("Submit form called");
    this.spinnerTarget.classList.remove('d-none');
}
}
