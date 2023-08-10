import { defineConfig } from '@twind/core';
import presetTailwind from '@twind/preset-tailwind';
import presetTailwindForms from '@twind/preset-tailwind-forms';
import presetExt from '@twind/preset-ext';

export default defineConfig({
  presets: [presetTailwind(), presetTailwindForms(), presetExt()],
  rules: [
    [
      'tooltip',
      'absolute z-30 invisible inline-block px-3 py-2 text-sm font-medium text-white transition-opacity duration-300 rounded-lg shadow-sm opacity-0'
    ],
    [
      'button',
      'inline-flex items-center gap-x-1.5 rounded-md px-2.5 py-1.5 text-sm font-semibold text-white shadow-sm focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-indigo-600 transform hover:scale-105 transition duration-300'
    ]
  ],
  theme: {
    extend: {
      colors: {
        main: {
          DEFAULT: '#F0EBE3',
          dark: '#8D93D9'
        },
        alt: {
          DEFAULT: '#E4DCCF',
          dark: '#31398C'
        },
        asset: {
          DEFAULT: '#7D9D9C',
          dark: '#31398C'
        },
        layout: {
          DEFAULT: '#576F72',
          dark: '#2a2c41'
        },
        alert: '#f57979',
      },
      content: [
        './app/helpers/**/*.rb',
        './app/views/**/*.{html,slim,html.slim}',
        './app/frontend/**/*.ts',
        './app/components/**/*.{rb,slim}',
        './node_modules/flowbite/**/*.js'
      ],
      animation: {
        enter: 'enter 0.3s',
        leave: 'leave 0.3s',
        'nav-enter': 'navEnter 0.3s',
        'nav-leave': 'navLeave 0.3s',
        'notification-enter': 'notificationEnter 0.3s',
        'mobile-notification-enter': 'mobileNotificationEnter 0.3s'
      },
      keyframes: {
        enter: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' }
        },
        leave: {
          '0%': { opacity: '1' },
          '100%': { opacity: '0' }
        },
        navEnter: {
          '0%': { transform: 'translateX(-100%)' },
          '100%': { transform: 'translateX(0)' }
        },
        navLeave: {
          '0%': { transform: 'translateX(0)' },
          '100%': { transform: 'translateX(-100%)' }
        },
        mobileNotificationEnter: {
          '0%': { transform: 'translateY(0.5rem)', opacity: '0' },
          '100%': { transform: 'translateY(0)', opacity: '100' }
        },
        notificationEnter: {
          '0%': { transform: 'translateY(0) translateX(0.5rem)', opacity: '0' },
          '100%': { transform: 'translateX(0)', opacity: '100' }
        }
      }
    }
  }
});
