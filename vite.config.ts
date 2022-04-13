import { defineConfig } from 'vite'
import RubyPlugin from 'vite-plugin-ruby'

export default defineConfig({
  clearScreen: false,
  server: {
    fs: {
      allow: ["/Users/konnorrogers/projects/oss/tip-tap-element/", "/home/konnorrogers/projects/tip-tap-element"]
    }
  },
  plugins: [
    RubyPlugin(),
  ],
})
