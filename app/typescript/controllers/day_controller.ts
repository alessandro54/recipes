import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['modal'];

  declare readonly modalTarget: HTMLDivElement;
  public prepareModal() {
    //this.modalTarget.setAttribute('data-modal-backdrop', 'static')
  }
}
