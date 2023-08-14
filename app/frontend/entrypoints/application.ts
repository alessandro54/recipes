import '@hotwired/turbo-rails';
import 'flowbite/dist/flowbite.turbo.js';
import { install, injectGlobal } from '@twind/core';
import config from '$root/twind.config';

import '../controllers';
import '../components';
import globalStyles from '@/support/globalStyles';

install(config);
injectGlobal(globalStyles);
