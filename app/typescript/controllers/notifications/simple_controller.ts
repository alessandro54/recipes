import { Controller } from '@hotwired/stimulus';

export default class extends Controller {

  removeSelf({ currentTarget }: { currentTarget: HTMLElement }) {
    currentTarget.closest('.simple-notification')!.remove();
  }
}
