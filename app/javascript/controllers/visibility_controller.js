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
    this.containerTargets.forEach((container) => (container.hidden = value));
  }

  alternateHiddenValueChanged(value) {
    console.log(value);

    this.alternateTargets.forEach((alternate) => (alternate.hidden = value));
  }
}
