import { Application } from 'stimulus'
import { registerControllers } from 'stimulus-vite-helpers'
import 'windi.css'
import '@revolist/revogrid';
import { defineCustomElements } from "@revolist/revogrid/custom-element";

// Initialise revogrid
defineCustomElements();

const application = Application.start()

// Register stimulus controllers
const controllers = import.meta.globEager('../**/*_controller.js')
registerControllers(application, controllers)

console.log('Vite ⚡️ Rails')
