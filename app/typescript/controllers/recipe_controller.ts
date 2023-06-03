import { Controller } from '@hotwired/stimulus';
import { Modal } from 'flowbite';
import type { ModalOptions, ModalInterface } from 'flowbite'

export default class extends Controller {
  static targets = ['modal'];

  declare readonly modalTarget: HTMLDivElement;
  declare modalContainer: HTMLElement ;
  declare modal : ModalInterface

  private modalOptions: ModalOptions = {
    placement: 'top-center',
    backdrop: 'dynamic',
    backdropClasses: 'flex',
    closable: false,
    onHide: () => {
        console.log('modal is hidden');
    },
    onShow: () => {
        console.log('modal is shown');
    },
    onToggle: () => {
        console.log('modal has been toggled');
    }
  }

  connect(): void {
    this.modalContainer = document.getElementById('newRecipeModal')!;
    console.log(this.modalContainer)

    this.modal = new Modal(this.modalContainer, this.modalOptions)
  }

  public newModal(): void{
    this.modal.show();
  }
}
