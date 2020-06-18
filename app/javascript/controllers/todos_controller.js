import { Controller } from 'stimulus';
import StimulusReflex from 'stimulus_reflex';

export default class extends Controller {
  connect() {
    StimulusReflex.register(this)
  }

  delete(event) {
    event.preventDefault()
    
    const id = event.target.dataset.id
    const ok = confirm("Are you sure?")

    if (!ok) {
      return false
    } else {
      this.stimulate('TodosReflex#delete', id)
    }
  }
}