export default `
.pagy-nav.pagination {
  @apply isolate inline-flex -space-x-px rounded-md shadow-sm;
}

.page.next a {
  @apply relative inline-flex items-center rounded-r-md border(& gray-300 dark:transparent) bg(white hover:gray-50 dark:layout-dark dark:hover:alt-dark) text(sm gray-500 dark:main-dark) px-2 py-2 text-sm font-medium focus:z-20;
}

.page.prev a {
  @apply relative inline-flex items-center rounded-l-md  border(& gray-300 dark:transparent) bg(white hover:gray-50 dark:layout-dark dark:hover:alt-dark) text(sm gray-500 dark:main-dark) px-2 py-2 font-medium focus:z-20;
}

.page.next.disabled {
  @apply relative inline-flex items-center rounded-r-md border(& gray-300 dark:transparent) bg(slate-100 dark:gray-600) text(sm gray-500 dark:gray-400) cursor-not-allowed px-2 py-2 text-sm font-medium focus:z-20;
}

.page.prev.disabled {
  @apply relative inline-flex items-center rounded-l-md border(& gray-300 dark:transparent) bg(slate-500 dark:gray-600) text(sm gray-500 dark:gray-400) cursor-not-allowed px-2 py-2 text-sm font-medium focus:z-20;
}

.page a, .page.gap {
  @apply bg-white border-gray-300 border(& gray-300 dark:transparent) bg(white hover:gray-50 dark:layout-dark dark:hover:alt-dark) text(sm gray-500 dark:main-dark) relative inline-flex items-center border px-4 py-2 font-medium focus:z-20;
}

.page.active {
  @apply z-10 border(dark:alt-dark) bg(dark:main-dark) text(dark:layout-dark) relative inline-flex items-center border px-4 py-2 text-sm font-medium focus:z-20;
}
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
  border-color: #e5e7eb;
}

[data-tooltip-style^='light']
  + .tooltip[data-popper-placement^='top']
  > .tooltip-arrow:before {
  border-bottom-width: 1px;
  border-right-width: 1px;
}

[data-tooltip-style^='light']
  + .tooltip[data-popper-placement^='right']
  > .tooltip-arrow:before {
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

[data-popper-arrow],
[data-popper-arrow]:before {
  position: relative;
  width: 8px;
  height: 8px;
  background: inherit;
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

.dark [role='tooltip'] > [data-popper-arrow]:before {
  border-style: solid;
  border-color: #4b5563;
}
[role='tooltip'] > [data-popper-arrow]:before {
  border-style: solid;
  border-color: #e5e7eb;
}

/* [role="tooltip"] > [data-popper-arrow]:after */
[role='tooltip'] > [data-popper-arrow]:after {
  border-style: solid;
  border-color: #e5e7eb;
}

/* .dark [role="tooltip"] > [data-popper-arrow]:after */
.dark [role='tooltip'] > [data-popper-arrow]:after {
  border-style: solid;
  border-color: #4b5563;
}

/* [data-popover][role="tooltip"][data-popper-placement^='top'] > [data-popper-arrow]:before */
[data-popover][role='tooltip'][data-popper-placement^='top']
  > [data-popper-arrow]:before {
  border-bottom-width: 1px;
  border-right-width: 1px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='top'] > [data-popper-arrow]:after */
[data-popover][role='tooltip'][data-popper-placement^='top']
  > [data-popper-arrow]:after {
  border-bottom-width: 1px;
  border-right-width: 1px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='right'] > [data-popper-arrow]:before */
[data-popover][role='tooltip'][data-popper-placement^='right']
  > [data-popper-arrow]:before {
  border-bottom-width: 1px;
  border-left-width: 1px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='right'] > [data-popper-arrow]:after */
[data-popover][role='tooltip'][data-popper-placement^='right']
  > [data-popper-arrow]:after {
  border-bottom-width: 1px;
  border-left-width: 1px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='bottom'] > [data-popper-arrow]:before */
[data-popover][role='tooltip'][data-popper-placement^='bottom']
  > [data-popper-arrow]:before {
  border-top-width: 1px;
  border-left-width: 1px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='bottom'] > [data-popper-arrow]:after */
[data-popover][role='tooltip'][data-popper-placement^='bottom']
  > [data-popper-arrow]:after {
  border-top-width: 1px;
  border-left-width: 1px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='left'] > [data-popper-arrow]:before */
[data-popover][role='tooltip'][data-popper-placement^='left']
  > [data-popper-arrow]:before {
  border-top-width: 1px;
  border-right-width: 1px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='left'] > [data-popper-arrow]:after */
[data-popover][role='tooltip'][data-popper-placement^='left']
  > [data-popper-arrow]:after {
  border-top-width: 1px;
  border-right-width: 1px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='top'] > [data-popper-arrow] */
[data-popover][role='tooltip'][data-popper-placement^='top']
  > [data-popper-arrow] {
  bottom: -5px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='bottom'] > [data-popper-arrow] */
[data-popover][role='tooltip'][data-popper-placement^='bottom']
  > [data-popper-arrow] {
  top: -5px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='left'] > [data-popper-arrow] */
[data-popover][role='tooltip'][data-popper-placement^='left']
  > [data-popper-arrow] {
  right: -5px;
}

/* [data-popover][role="tooltip"][data-popper-placement^='right'] > [data-popper-arrow] */
[data-popover][role='tooltip'][data-popper-placement^='right']
  > [data-popper-arrow] {
  left: -5px;
}

/* [role="tooltip"].invisible > [data-popper-arrow]:before */
[role='tooltip'].invisible > [data-popper-arrow]:before {
  visibility: hidden;
}

/* [role="tooltip"].invisible > [data-popper-arrow]:after */
[role='tooltip'].invisible > [data-popper-arrow]:after {
  visibility: hidden;
}

`;
