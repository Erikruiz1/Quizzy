import { Controller } from "@hotwired/stimulus"
export default class extends Controller {
  static targets = ["name", "category", "form"]

  connect() {
    console.log("Form controller connected!");
  }

  createCard(event) {
    event.preventDefault();
    const formData = new FormData(this.formTarget)
    const name = document.getElementById("topic_name").value
    const category = document.getElementById("topic_category").value
    const token = document.querySelector("meta[name=csrf-token]").content
    formData.append("name", name)
    formData.append("category", category)

    const url = this.formTarget.action
    const options = {
      method: "POST",
      headers: {
        "Accept": "text/plain",
        'X-CSRF-Token': token
      },
      body: formData

    }
    fetch(url, options)
    .then(response => response.text())
    .then(data => {

      this.element.insertAdjacentHTML("afterend", data);
    })
  }
}
