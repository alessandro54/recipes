import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  connect() {
    document.addEventListener(
      'turbo:frame-render',
      () => {
        document
          .querySelectorAll('.lazy-placeholder')
          .forEach((lazyPlaceholder) => {
            lazyPlaceholder.classList.add('animate-leave');
            lazyPlaceholder.remove();
          });
        document.querySelectorAll('.lazy-image').forEach((lazyImage) => {
          lazyImage.classList.remove('hidden');
          lazyImage.classList.add('animate-enter');
        });
      },
      { once: true }
    );
  }
}
