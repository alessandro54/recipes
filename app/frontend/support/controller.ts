import { Controller as Hotwired } from '@hotwired/stimulus';
import { tx } from '@twind/core';

export default class Controller extends Hotwired {
  protected addClass(el: HTMLElement, classes: string) {
    el.classList.add(tx`${classes}`)
  }

  protected removeClass(el: HTMLElement, classes: string) {
    el.classList.remove(tx`${classes}`)
  }

  protected replaceClass(el: HTMLElement, oldClass: string, newClass: string) {
    el.classList.replace(tx`${oldClass}`, tx`${newClass}`)
  }

  protected toggleClass(el: HTMLElement, classes: string, cb?: () => boolean) {
    const shouldToggle = cb ? cb() : true;
    el.classList.toggle(classes, shouldToggle);
  }

  protected show(el: HTMLElement, display = 'block') {
    el.classList.remove(tx`hidden`);
    el.classList.add(tx`${display}`)
  }
  protected hide (el: HTMLElement, display = 'block') {
    el.classList.add(tx`hidden`);
    el.classList.remove(tx`${display}`)
  }
}
