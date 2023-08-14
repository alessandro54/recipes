import Controller from '$root/app/typescript/support/controller';

export default class extends Controller {
  static targets = ['nav', 'backdrop', 'menu', 'button'];

  declare readonly navTarget: HTMLDivElement;
  declare readonly backdropTarget: HTMLDivElement;
  declare readonly menuTarget: HTMLDivElement;
  declare readonly buttonTarget: HTMLButtonElement;

  public open(): void {
    this.removeClass(this.navTarget, 'hidden');
    this.init();
    setTimeout(() => {
      this.removeClass(this.backdropTarget, 'animate-enter');
      this.removeClass(this.buttonTarget, 'animate-enter');
      this.removeClass(this.menuTarget, 'animate-nav-enter');
    }, 250);
  }

  public close(): void {
    this.addClass(this.backdropTarget, 'animate-leave');
    this.addClass(this.buttonTarget, 'animate-leave');
    this.addClass(this.menuTarget, 'animate-nav-leave');

    setTimeout(() => {
      this.addClass(this.navTarget, 'hidden');
      this.removeClass(this.backdropTarget, 'animate-leave');
      this.removeClass(this.buttonTarget, 'animate-leave');
      this.removeClass(this.menuTarget, 'animate-nav-leave');
    }, 250);
  }

  public backdropClose(e: Event): void {
    if (e.currentTarget !== e.target) return;
    this.close();
  }

  private init(): void {
    this.addClass(this.backdropTarget, 'animate-enter');
    this.addClass(this.buttonTarget, 'animate-enter');
    this.addClass(this.menuTarget, 'animate-nav-enter');
  }
}
