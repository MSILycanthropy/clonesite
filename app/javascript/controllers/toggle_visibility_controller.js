import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="toggle-visibility"
export default class extends Controller {
  static values = { hidden: { type: Boolean, default: true } };
  static targets = ["container"];

  connect() {
    console.log(this.containerTargets[0]);
  }

  show() {
    this.hiddenValue = false;
  }

  hide() {
    this.hiddenValue = true;
  }

  hiddenValueChanged(value) {
    this.containerTargets.forEach((container) => (container.hidden = value));
  }
}
