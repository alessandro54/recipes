import * as Turbo from '@hotwired/turbo';
import Rails from '@rails/ujs';
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  static values = {
    url: String
  }

  declare readonly urlValue: string;

  removeSelf({ currentTarget }: { currentTarget: HTMLElement }) {
    const parent = currentTarget.closest('.simple-notification')!
    parent.classList.add('animate-leave');

    setTimeout(() => {
      parent.remove();
    }, 290)
  }

  create({ params }: { params: { message: string, mode: string, type: string } }) {
    Rails.ajax({
      url: '/notifications',
      type: 'POST',
      data: new URLSearchParams(params).toString(),
      contentType: "application/json",
      success: (data: string) => {
        Turbo.renderStreamMessage(data)
      }
    })
  }
}
