import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['card'];

  toggleSelection(event) {
    event.currentTarget.classList.toggle('selected');
    this.updateSelectedTopics();
  }

  updateSelectedTopics() {
    const selectedTopics = this.cardTargets
      .filter((card) => card.classList.contains('selected'))
      .map((card) => card.dataset.topicName)
      .join(',');

    const selectedTopicsInput = document.querySelector('.selected-topics');
    selectedTopicsInput.value = selectedTopics;
  }
}
