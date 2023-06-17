import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['link'];

  declare readonly linkTargets: HTMLAnchorElement[];

  connect(): void {
    this.linkTargets.forEach((link) => {
      if (link.href === window.location.href) this.setActiveStyles(link);
    });
  }

  private setActiveStyles(element: HTMLElement): void {
    element.classList.add('bg-gray-50', 'text-indigo-600');
  }
}
