import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['nav', 'backdrop', 'menu', 'button'];

  declare readonly navTarget: HTMLDivElement;
  declare readonly backdropTarget: HTMLDivElement;
  declare readonly menuTarget: HTMLDivElement;
  declare readonly buttonTarget: HTMLButtonElement;

  public connect() {
    this.init();
  }

  public open(): void {
    this.navTarget.classList.remove('hidden');
    setTimeout(() => {
      this.backdropTarget.classList.remove('animate-enter');
      this.buttonTarget.classList.remove('animate-enter');
      this.menuTarget.classList.remove('animate-nav-enter');
    }, 300);
  }

  public close(): void {
    this.backdropTarget.classList.add('animate-leave');
    this.buttonTarget.classList.add('animate-leave');
    this.menuTarget.classList.add('animate-nav-leave');

    setTimeout(() => {
      this.navTarget.classList.add('hidden');
      this.init();
      this.backdropTarget.classList.remove('animate-leave');
      this.buttonTarget.classList.remove('animate-leave');
      this.menuTarget.classList.remove('animate-nav-leave');
    }, 290);
  }

  public shrink(): void {
    console.log('shrink');
  }

  public backdropClose(e: Event): void {
    if (e.currentTarget !== e.target) return;
    this.close();
  }

  private init(): void {
    this.backdropTarget.classList.add('animate-enter');
    this.buttonTarget.classList.add('animate-enter');
    this.menuTarget.classList.add('animate-nav-enter');
  }
}
