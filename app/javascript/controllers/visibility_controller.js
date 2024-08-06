import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="visibility"
export default class extends Controller {
  static values = { hidden: { type: Boolean, default: true }, alternateHidden: Boolean };
  static targets = ["container", "alternate"];

  show() {
    this.hiddenValue = false;
  }

  hide() {
    this.hiddenValue = true;
  }

  showAlternate() {
    this.alternateHiddenValue = false;
  }

  hideAlternate() {
    this.alternateHiddenValue = true;
  }

  hiddenValueChanged(value) {
    this.#toggleAll(this.containerTargets, value);
  }

  alternateHiddenValueChanged(value) {
    this.#toggleAll(this.alternateTargets, value);
  }

  #toggleAll(elements, value) {
    elements.forEach((element) => {
      element.hidden = value;

      this.#fieldsWithin(element).forEach((input) => (input.disabled = value));
    });
  }

  #fieldsWithin(element) {
    return Array.from(element.querySelectorAll("input")).concat(Array.from(element.querySelectorAll("select")));
  }
}
