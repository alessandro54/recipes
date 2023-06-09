import Controller from '@/support/controller';
export default class extends Controller {
  static targets = ['link'];

  declare readonly linkTargets: HTMLAnchorElement[];

  connect(): void {
    this.linkTargets.forEach((link) => {
      if (link.href === window.location.href) this.setActiveStyles(link);
    });
  }

  private setActiveStyles(element: HTMLElement): void {
    this.addClass(element, '!bg-secondary', '!text-dark');
  }
}
