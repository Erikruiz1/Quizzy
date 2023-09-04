import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  toggle(event) {
    const label = document.getElementById(event.target.dataset.id)
    label.classList.toggle("topic-checkbox-card")
  }

}
