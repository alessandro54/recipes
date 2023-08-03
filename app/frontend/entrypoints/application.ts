import '@hotwired/turbo-rails';
import 'flowbite';
import 'flowbite/dist/flowbite.turbo.js'
import { install, injectGlobal } from '@twind/core'
import config from '$root/twind.config'

import '../controllers';
import '../components';

install(config);
injectGlobal`
  html {
    font-family: 'Nunito', sans-serif;
  }

  turbo-frame {
    width: 100%;
    height: 100%;
  }

  .scrollbar::-webkit-scrollbar {
    width: 0;
    height: 13px;
  }

  .tooltip-arrow,
  .tooltip-arrow:before {
    position: absolute;
    width: 8px;
    height: 8px;
    background: inherit;
  }

  .tooltip-arrow {
    visibility: hidden;
  }

  .tooltip-arrow:before {
    content: '';
    visibility: visible;
    transform: rotate(45deg);
  }

  [data-tooltip-style^='light'] + .tooltip > .tooltip-arrow:before {
    border-style: solid;
    border-color: #E5E7EB;
  }

  [data-tooltip-style^='light'] + .tooltip[data-popper-placement^='top'] > .tooltip-arrow:before {
    border-bottom-width: 1px;
    border-right-width: 1px;
  }

  [data-tooltip-style^='light'] + .tooltip[data-popper-placement^='right'] > .tooltip-arrow:before {
    border-bottom-width: 1px;
    border-left-width: 1px;
  }

  .tooltip[data-popper-placement^='top'] > .tooltip-arrow {
    bottom: -4px;
  }

  .tooltip[data-popper-placement^='bottom'] > .tooltip-arrow {
    top: -4px;
  }

  .tooltip[data-popper-placement^='left'] > .tooltip-arrow {
    right: -4px;
  }

  .tooltip[data-popper-placement^='right'] > .tooltip-arrow {
    left: -4px;
  }

  .tooltip.invisible > .tooltip-arrow:before {
    visibility: hidden;
  }

  [data-popper-arrow], [data-popper-arrow]:before {
    position: relative;
    width: 8px;
    height: 8px;
    background: inherit
  }

  [data-popper-arrow] {
    visibility: hidden;
  }

  [data-popper-arrow]:before {
    content: '';
    visibility: visible;
    transform: rotate(45deg);
  }

  [data-popper-arrow]:after {
    content: '';
    visibility: visible;
    transform: rotate(45deg);
    position: absolute;
    width: 9px;
    height: 9px;
    background: inherit;
  }

  .dark [role="tooltip"] > [data-popper-arrow]:before {
    border-style: solid;
    border-color: #4B5563;
  }
  [role="tooltip"] > [data-popper-arrow]:before {
    border-style: solid;
    border-color: #E5E7EB;
  }

    /* [role="tooltip"] > [data-popper-arrow]:after */
  [role="tooltip"] > [data-popper-arrow]:after {
    border-style: solid;
    border-color: #E5E7EB;
  }

  /* .dark [role="tooltip"] > [data-popper-arrow]:after */
  .dark [role="tooltip"] > [data-popper-arrow]:after {
    border-style: solid;
    border-color: #4B5563;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='top'] > [data-popper-arrow]:before */
  [data-popover][role="tooltip"][data-popper-placement^='top'] > [data-popper-arrow]:before {
    border-bottom-width: 1px;
    border-right-width: 1px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='top'] > [data-popper-arrow]:after */
  [data-popover][role="tooltip"][data-popper-placement^='top'] > [data-popper-arrow]:after {
    border-bottom-width: 1px;
    border-right-width: 1px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='right'] > [data-popper-arrow]:before */
  [data-popover][role="tooltip"][data-popper-placement^='right'] > [data-popper-arrow]:before {
    border-bottom-width: 1px;
    border-left-width: 1px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='right'] > [data-popper-arrow]:after */
  [data-popover][role="tooltip"][data-popper-placement^='right'] > [data-popper-arrow]:after {
    border-bottom-width: 1px;
    border-left-width: 1px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='bottom'] > [data-popper-arrow]:before */
  [data-popover][role="tooltip"][data-popper-placement^='bottom'] > [data-popper-arrow]:before {
    border-top-width: 1px;
    border-left-width: 1px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='bottom'] > [data-popper-arrow]:after */
  [data-popover][role="tooltip"][data-popper-placement^='bottom'] > [data-popper-arrow]:after {
    border-top-width: 1px;
    border-left-width: 1px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='left'] > [data-popper-arrow]:before */
  [data-popover][role="tooltip"][data-popper-placement^='left'] > [data-popper-arrow]:before {
    border-top-width: 1px;
    border-right-width: 1px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='left'] > [data-popper-arrow]:after */
  [data-popover][role="tooltip"][data-popper-placement^='left'] > [data-popper-arrow]:after {
    border-top-width: 1px;
    border-right-width: 1px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='top'] > [data-popper-arrow] */
  [data-popover][role="tooltip"][data-popper-placement^='top'] > [data-popper-arrow] {
    bottom: -5px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='bottom'] > [data-popper-arrow] */
  [data-popover][role="tooltip"][data-popper-placement^='bottom'] > [data-popper-arrow] {
    top: -5px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='left'] > [data-popper-arrow] */
  [data-popover][role="tooltip"][data-popper-placement^='left'] > [data-popper-arrow] {
    right: -5px;
  }

  /* [data-popover][role="tooltip"][data-popper-placement^='right'] > [data-popper-arrow] */
  [data-popover][role="tooltip"][data-popper-placement^='right'] > [data-popper-arrow] {
    left: -5px;
  }

  /* [role="tooltip"].invisible > [data-popper-arrow]:before */
  [role="tooltip"].invisible > [data-popper-arrow]:before {
    visibility: hidden;
  }

  /* [role="tooltip"].invisible > [data-popper-arrow]:after */
  [role="tooltip"].invisible > [data-popper-arrow]:after {
    visibility: hidden;
  }

`;
