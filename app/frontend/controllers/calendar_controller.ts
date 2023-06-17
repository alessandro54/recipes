import * as Turbo from '@hotwired/turbo';
import { Controller } from '@hotwired/stimulus';

export default class extends Controller {
  loadShowDayContent({ params }: { params: { url: string } }) {
    Turbo.visit(params.url, {
      action: 'replace',
      frame: 'day-modal'
    });
    Turbo.visit(params.url, {
      action: 'replace',
      frame: 'mobile-day-modal'
    });
  }

  loadNewDayContent({ params }: { params: { url: string } }) {
    Turbo.visit(params.url, {
      action: 'replace',
      frame: 'day-modal'
    });
    Turbo.visit(params.url, {
      action: 'replace',
      frame: 'mobile-day-modal'
    });
  }
}
