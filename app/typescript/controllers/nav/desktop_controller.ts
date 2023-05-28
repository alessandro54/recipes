import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static targets = ['nav', 'inner'];

  declare readonly navTarget: HTMLDivElement;
  declare readonly navTargets: HTMLDivElement[];

  startX!: number;
  startWidth!: number;

  connect(): void {
  }

  shrink(e: MouseEvent) {
    this.startX = e.pageX;
    this.startWidth = parseInt(
      document.defaultView!.getComputedStyle(this.navTarget).width,
      10
    );
    this.element.ownerDocument.addEventListener('mousemove', this.resize)
    this.element.ownerDocument.addEventListener('mouseup', this.stopResize)
  }

  resize = (e : MouseEvent) => {
    const newWidth = this.startWidth + e.pageX - this.startX;
    if (newWidth > 90 && newWidth < 288) {
      this.navTargets.forEach((nt) => {
        nt.classList.remove('w-[288px]')
        nt.style.width = `${newWidth}px`
      })
    }
  }

  stopResize = (e: MouseEvent) => {
    this.element.ownerDocument.removeEventListener('mousemove', this.resize)
    this.element.ownerDocument.removeEventListener('mouseup', this.stopResize)
  }
}
