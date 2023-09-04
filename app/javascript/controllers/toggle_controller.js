import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle"
export default class extends Controller {
  static targets = ["difficulty", "questions", "topics", "category", "startButton"];


  get selectedDifficulty() {
    return Array.from(this.difficultyTargets).find(radio => radio.checked);
  }

  get selectedQuestions() {
    return Array.from(this.questionsTargets).find(radio => radio.checked);
  }

  toggle(event) {
    const label = document.getElementById(event.target.dataset.id)
    label.classList.toggle("topic-checkbox-card")
    this.change()
  }

  change(event) {
    console.log("difficulty", this.selectedDifficulty);
    console.log("quesdtions",this.selectedQuestions);
    console.log("topics", this.topicsTarget);
    if (this.selectedDifficulty
      && this.selectedQuestions
      && event.target.checked
    ) {
      this.startButtonTarget.classList.remove('d-none')
    }
  }
}
