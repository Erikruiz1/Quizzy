import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["name", "category"]

  connect() {
    console.log("Form controller connected!");
  }

  submit(event) {
    event.preventDefault(); // prevent the form from actually submitting

    // Create card next to the form
    this.createCard();
  }

  createCard() {
    const card = document.createElement("div");
    card.className = "card";
    const image_url = `https://source.unsplash.com/featured/?${this.nameTarget.value}`;
    card.innerHTML = `
      <div class="card-trip-infos">
        <img src="${image_url}" />
        <h2> ${this.nameTarget.value} </h2>
        <p> ${this.categoryTarget.value} </p>
      </div>
    `;

    this.element.parentNode.insertBefore(card, this.element.nextSibling);
  }
}
