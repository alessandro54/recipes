import { defineConfig } from 'vite';
import FullReload from 'vite-plugin-full-reload';
import RubyPlugin from 'vite-plugin-ruby';
import StimulusHMR from 'vite-plugin-stimulus-hmr';
import path from 'path';

export default defineConfig({
  clearScreen: false,
  plugins: [
    RubyPlugin(),
    StimulusHMR(),
    FullReload(['config/routes.rb', 'app/views/**/*', 'app/components/**/*'], {
      delay: 300,
    }),
  ],
  resolve: {
    alias: {
      $root: path.resolve(__dirname),
      '@': path.resolve(__dirname, './app/typescript/'),
    },
  },
});
