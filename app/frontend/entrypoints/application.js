import { Application } from 'stimulus'
import { registerControllers } from 'stimulus-vite-helpers'

const application = Application.start()
const controllers = import.meta.globEager('./**/*_controller.js')
registerControllers(application, controllers)

console.log('Vite ⚡️ Rails')
