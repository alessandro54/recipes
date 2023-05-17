import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect(): void {
    console.log("Hello, Stimulus!")
  }
  greet() {
    console.log("Hello, Stimulus!")
  }
}
