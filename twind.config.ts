import { defineConfig } from '@twind/core';
import presetTailwind from '@twind/preset-tailwind';
import presetTailwindForms from '@twind/preset-tailwind-forms';
import presetExt from '@twind/preset-ext';
export default defineConfig({
  presets: [
    presetTailwind(),
    presetTailwindForms(),
    presetExt()
  ],
  theme: {
    extend: {
      colors: {
        primary: '#f57979',
        secondary: '#fdbf50',
        light: '#f4f4f8',
        dark: '#2a2c41'
      },
      content: [
        './app/helpers/**/*.rb',
        './app/assets/stylesheets/**/*.css',
        './app/views/**/*.{html,slim,html.slim}',
        './app/frontend/**/*.ts',
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
  },
})
