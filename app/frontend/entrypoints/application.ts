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
`;
