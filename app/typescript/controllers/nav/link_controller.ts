import Controller from '$root/app/typescript/support/controller';
export default class extends Controller {
  static targets = ['link'];

  declare readonly linkTargets: HTMLAnchorElement[];

  connect(): void {
    this.linkTargets.forEach((link) => {
      if (link.href === window.location.href) this.setActiveStyles(link);
    });
  }

  private setActiveStyles(element: HTMLElement): void {
    this.addClass(element, '!dark:bg-main-dark', '!dark:text-asset-dark');
  }
}
