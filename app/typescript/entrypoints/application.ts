import '../controllers';
import '@hotwired/turbo-rails';
import 'flowbite';
import 'flowbite/dist/flowbite.turbo.js'
import { install, injectGlobal } from '@twind/core'
import config from '$root/twind.config.ts'

install(config)
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
`
// To see this message, add the following to the `<head>` section in your
// views/layouts/application.html.erb
//
//    <%= vite_client_tag %>
//    <%= vite_javascript_tag 'application' %>
console.log('Vite ⚡️ Rails');

// If using a TypeScript entrypoint file:
//     <%= vite_typescript_tag 'application' %>
//
// If you want to use .jsx or .tsx, add the extension:
//     <%= vite_javascript_tag 'application.jsx' %>

console.log(
  'Visit the guide for more information: ',
  'https://vite-ruby.netlify.app/guide/rails'
);

// Example: Load Rails libraries in Vite.
//
// import * as Turbo from '@hotwired/turbo'
// Turbo.start()
//
// import ActiveStorage from '@rails/activestorage'
// ActiveStorage.start()
//
// // Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')

// Example: Import a stylesheet in app/frontend/index.css
// import '~/index.css'
