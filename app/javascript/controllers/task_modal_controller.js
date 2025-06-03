import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["listSelect", "newListInput"]

  connect() {
    this.setupListSelect()
  }

  setupListSelect() {
    this.listSelectTarget.addEventListener("change", (event) => {
      if (event.target.value === "new") {
        this.showNewListInput()
      } else {
        this.hideNewListInput()
      }
    })
  }

  showNewListInput() {
    this.newListInputTarget.classList.remove("d-none")
    this.newListInputTarget.querySelector("input").focus()
  }

  hideNewListInput() {
    this.newListInputTarget.classList.add("d-none")
  }
} 