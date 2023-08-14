import '@hotwired/turbo-rails';
import 'flowbite/dist/flowbite.turbo.js';
import { install, injectGlobal } from '@twind/core';
import config from '$root/twind.config';

import '../controllers';

import globalStyles from '$root/app/typescript/support/globalStyles';

import.meta.glob('$root/app/components/**/*.ts', { eager: true });

install(config);
injectGlobal(globalStyles);
