import { Controller as Hotwired } from '@hotwired/stimulus';
import { tx } from '@twind/core';

export default class Controller extends Hotwired {
  protected addClass(el: HTMLElement, classes: string) {
    el.classList.add(tx`${classes}`)
  }

  protected removeClass(el: HTMLElement, classes: string) {
    el.classList.remove(tx`${classes}`)
  }
}
