import { Application } from '@hotwired/stimulus';
import { registerControllers } from 'stimulus-vite-helpers';

const application = Application.start();
// @ts-ignore
const controllers = import.meta.globEager('./**/*_controller.ts');
registerControllers(application, controllers);
