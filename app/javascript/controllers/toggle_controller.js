import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["difficulty", "questions", "topics", "category", "startButton"];
  checkboxSelected = false; // Initialize the property

  get selectedDifficulty() {
    return Array.from(this.difficultyTargets).find(radio => radio.checked);
  }

  get selectedQuestions() {
    return Array.from(this.questionsTargets).find(radio => radio.checked);
  }

  toggle(event) {
    const label = document.getElementById(event.target.dataset.id);
    label.classList.toggle("topic-checkbox-card");
    this.checkboxSelected = event.target.checked; // Update the checkboxSelected here as well
    this.checkAllConditions(); // Check conditions whenever a toggle happens
  }

  change() {
    this.checkAllConditions();
  }

  checkAllConditions() {
    if (this.selectedDifficulty && this.selectedQuestions && this.checkboxSelected) {
      this.startButtonTarget.classList.remove('d-none');
    } else {
      this.startButtonTarget.classList.add('d-none');
    }
  }
}

