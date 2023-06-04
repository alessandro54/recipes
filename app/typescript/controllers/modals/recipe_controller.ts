import { Controller } from '@hotwired/stimulus';
import { Modal } from 'flowbite';
import type { ModalOptions, ModalInterface } from 'flowbite'

export default class extends Controller {
  declare modal : ModalInterface
  declare editModal : ModalInterface

  private modalOptions: ModalOptions = {
    placement: 'center',
    backdrop: 'static',
    backdropClasses: 'bg-gray-900 bg-opacity-50 dark:bg-opacity-80 fixed inset-0 z-40',
    closable: false,
  }

  connect(): void {
    this.modal = new Modal(
      document.getElementById('newRecipeModal'), this.modalOptions
    );
  }

  public show(): void {
    this.modal.show();
  }

  public close(): void {
    this.modal.hide();
  }
}
