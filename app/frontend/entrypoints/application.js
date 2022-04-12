import "@hotwired/turbo"
import * as ActiveStorage from '@rails/activestorage'
// import "@rails/actiontext"
import "trix"
import "trix/dist/trix.css"
import { TipTapElement } from "tip-tap-element"

window.customElements.define("tip-tap-element", TipTapElement)
console.log('Vite ⚡️ Rails')

ActiveStorage.start()

// Import all channels.
// const channels = import.meta.globEager('./**/*_channel.js')
