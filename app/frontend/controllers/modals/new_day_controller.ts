import Controller from '@/support/controller';
import { Modal } from 'flowbite';
import type { ModalOptions, ModalInterface } from 'flowbite';

export default class extends Controller {
  static values = { calendarId: String };
  declare readonly calendarIdValue: string;

  declare dayDate: string;

  declare modal: ModalInterface;
  declare editModal: ModalInterface;

  private modalOptions: ModalOptions = {
    placement: 'center',
    backdrop: 'dynamic',
    backdropClasses:
      'bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40',
    closable: false,
  };

  connect(): void {
    this.modal = new Modal(
      document.getElementById('calendarDayModal'),
      this.modalOptions
    );
  }

  show(): void {
    this.modal.show();
    this.removeClass(this.modal._targetEl as HTMLElement, 'hidden');
  }

  close(): void {
    this.modal.hide();
    this.addClass(this.modal._targetEl as HTMLElement, 'hidden');
  }
}
