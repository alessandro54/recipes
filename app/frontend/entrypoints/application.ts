import '@hotwired/turbo-rails';
import 'flowbite/dist/flowbite.turbo.js';
import { install, injectGlobal } from '@twind/core';
import config from '$root/twind.config';

import '../controllers';
import '../components';

install(config);
injectGlobal`
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
`;
