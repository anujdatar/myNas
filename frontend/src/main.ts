import { createApp } from 'vue'
import App from './App.vue'

import { createRouter, createWebHistory } from 'vue-router'
// import routes from '~pages'
import { setupLayouts } from 'virtual:generated-layouts'
import generatedRoutes from 'virtual:generated-pages'

import './styles/main.css'

const routes = setupLayouts(generatedRoutes)

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes
})

const app = createApp(App)
// const pinia = createPinia()

// createApp(App).use(createPinia()).use(router).mount('#app')

// app.use(pinia)
app.use(router)
app.mount('#app')
