import { Controller } from '@hotwired/stimulus';

interface StimulusEvent extends Event {
  detail: {
    fetchResponse: {
      responseHTML: string;
    };
  };
}

export default class extends Controller {
  connect(): void {
    document.addEventListener('turbo:submit-end', this.deleteLast);
    document.querySelectorAll('nav span a').forEach((el) => {
      el.addEventListener('click', () => {
        document.removeEventListener('turbo:submit-end', this.deleteLast);
      });
    });
  }

  submit() {
    setTimeout(() => {
      const frame = document.getElementById('new-calendar');
      const event = new CustomEvent('turbo:frame-load', {
        bubbles: true,
        cancelable: true,
      });
      frame?.dispatchEvent(event);
    }, 500);
  }
  async deleteLast(e: Event): Promise<void> {
    const event = e as StimulusEvent;
    const response = event.detail.fetchResponse.responseHTML;

    if (!response.includes('with_errors')) {
      const parentEl = document.getElementById('calendars')!;
      const lastChild = parentEl.lastChild;
      if (parentEl.childElementCount === 9 && lastChild) {
        parentEl.removeChild(lastChild);
      }
    }
  }
}
