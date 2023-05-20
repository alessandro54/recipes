/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/views/**/*.{html,slim,html.slim}',
    './app/typescript/**/*.ts'
  ],
  theme: {
    fontFamily: {
      sans: [
        'BlinkMacSystemFont',
        'Avenir Next',
        'Avenir',
        'Nimbus Sans L',
        'Roboto',
        'Noto Sans',
        'Segoe UI',
        'Arial',
        'Helvetica',
        'Helvetica Neue',
        'sans-serif'
      ],
      mono: [
        'Consolas',
        'Menlo',
        'Monaco',
        'Andale Mono',
        'Ubuntu Mono',
        'monospace'
      ]
    },
    extend: {
      animation: {
        enter: 'enter 0.3s',
        leave: 'leave 0.3s',
        'nav-enter': 'navEnter 0.3s',
        'nav-leave': 'navLeave 0.3s'
      },
      keyframes: {
        enter: {
          '0%': { opacity: 0 },
          '100%': { opacity: 1 }
        },
        leave: {
          '0%': { opacity: 1 },
          '100%': { opacity: 0 }
        },
        navEnter: {
          '0%': { transform: 'translateX(-100%)' },
          '100%': { transform: 'translateX(0)' }
        },
        navLeave: {
          '0%': { transform: 'translateX(0)' },
          '100%': { transform: 'translateX(-100%)' }
        }
      }
    }
  },
  corePlugins: {
    aspectRatio: false
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('flowbite/plugin')
  ]
};
