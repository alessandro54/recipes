import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  removeSelf({ currentTarget }: { currentTarget: HTMLElement }) {
    const parent = currentTarget.closest('.simple-notification')!
    parent.classList.add('animate-leave');

    setTimeout(() => {
      parent.remove();
    }, 290)
  }
}
