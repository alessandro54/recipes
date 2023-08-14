import { Controller } from '@hotwired/stimulus';
import { tx } from '@twind/core';

export default class extends Controller {
  protected addClass(el: HTMLElement, ...tokens: string[]) {
    tokens.forEach((token) => el.classList.add(tx(token)));
  }

  protected removeClass(el: HTMLElement, ...tokens: string[]) {
    tokens.forEach((token) => el.classList.remove(tx(token)));
  }

  protected replaceClass(el: HTMLElement, oldToken: string, newToken: string) {
    el.classList.replace(tx(oldToken), tx(newToken));
  }

  protected toggleClass(el: HTMLElement, token: string, cb?: () => boolean) {
    const shouldToggle = cb ? cb() : true;
    el.classList.toggle(token, shouldToggle);
  }

  protected show(el: HTMLElement, display = 'block') {
    el.classList.remove(tx`hidden`);
    el.classList.add(tx`${display}`);
  }
  protected hide(el: HTMLElement, display = 'block') {
    el.classList.add(tx`hidden`);
    el.classList.remove(tx`${display}`);
  }
}
