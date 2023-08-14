import * as Turbo from '@hotwired/turbo';
import Controller from '$root/app/typescript/support/controller';
import { post } from '$root/app/typescript/support/http';

export default class extends Controller {
  static values = {
    url: String,
  };

  declare readonly urlValue: string;

  removeSelf({ currentTarget }: { currentTarget: HTMLElement }) {
    const parent = currentTarget.closest('.simple-notification')!;
    parent.classList.add('animate-leave');

    setTimeout(() => {
      parent.remove();
    }, 290);
  }

  create({
    params,
  }: {
    params: { message: string; mode: string; type: string };
  }) {
    post('/notifications', {
      body: params,
      headers: {
        'Content-Type': 'application/json',
      },
    })
      .then((r) => r.text())
      .then((r) => Turbo.renderStreamMessage(r));
  }
}
