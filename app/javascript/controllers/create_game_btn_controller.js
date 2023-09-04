import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["difficulty", "questions", "topics", "category", "startButton"];

  connect() {
    console.log("Connected to create-game-btn controller");
    this.checkInputs();
  }

  get selectedDifficulty() {
    return Array.from(this.difficultyTargets).find(radio => radio.checked);
  }

  get selectedQuestions() {
    return Array.from(this.questionsTargets).find(radio => radio.checked);
  }

  checkInputs() {
    console.log(this.selectedDifficulty);
    console.log(this.selectedQuestions);
    console.log(this.topicsTarget.selectedOptions);
    console.log(this.categoryTarget.value);
    if (this.selectedDifficulty
        && this.selectedQuestions
        && this.topicsTarget.selectedOptions.length > 0
    ) {
      this.startButtonTarget.classList.remove('d-none');
    } else {
      this.startButtonTarget.classList.add('d-none');
    }
  }

  change() {
    console.log("Change method called");
    this.checkInputs();
  }
}
