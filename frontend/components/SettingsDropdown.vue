<script setup lang="ts">
/* global useColorMode onMounted */
import { Menu, MenuButton, MenuItems, MenuItem } from '@headlessui/vue'
import { ChevronDownIcon, CogIcon, MoonIcon, LogoutIcon } from '@heroicons/vue/outline'
// import {  } from '@nuxtjs/color-mode'

function logout () {
  console.log('Logging off')
}
function shutdown () {
  console.log('shutting down')
}
function reboot () {
  console.log('rebooting')
}
const colorMode = useColorMode()
function setTheme (themeName: string) {
  colorMode.preference = themeName
  document.body.setAttribute('theme', themeName)
  if (themeName === 'system') themeName = 'dark light'
  document.querySelector('meta[name="color-scheme"]')?.setAttribute('content', themeName)
}
function toggleTheme () {
  const current = colorMode.preference
  // if (current === 'system') colorMode.preference = 'dark'
  // else if (current === 'dark') colorMode.preference = 'light'
  // else if (current === 'light') colorMode.preference = 'system'
  if (current === 'system') setTheme('dark')
  else if (current === 'dark') setTheme('light')
  else if (current === 'light') setTheme('system')
}
onMounted(() => {
  const storedTheme = (localStorage.getItem('nuxt-color-mode'))
  // document.querySelector('meta[name="color-scheme"]')?.setAttribute('content', storedTheme)
  setTheme(storedTheme)
})
</script>

<template>
  <Menu as="div" class="nav-menu">
    <menu-button
      class="nav-menu-btn flex flex-row items-center justify-center cursor-pointer"
      aria-label="settings-power">
      <cog-icon class="cog" aria-hidden="true" />
      <chevron-down-icon class="arrow" aria-hidden="true" />
    </menu-button>
    <transition name="nav-menu-dd">
      <menu-items class="nav-menu-items">
        <div class="nav-menu-item-group">
          <menu-item v-slot="{ active }" class="nav-menu-item">
            <button :class="[
              active ? 'bg-primary text-white' : 'bg-surface text-foreground',
              'flex w-full items-center'
            ]" @click="toggleTheme">
              <moon-icon :active="active" aria-hidden="true" class="btn-icon" />
              Theme:
              <b> {{ colorMode.preference }}</b>
            </button>
          </menu-item>
        </div>
        <div class="nav-menu-item-group">
          <menu-item v-slot="{ active }" class="nav-menu-item">
            <button :class="[
              active ? 'bg-primary text-white' : 'bg-surface text-foreground',
              'flex w-full items-center'
            ]" @click="shutdown">
              <icons-power-icon :active="active" aria-hidden="true"
                class="btn-icon" />
              Shutdown
            </button>
          </menu-item>
          <menu-item v-slot="{ active }" class="nav-menu-item">
            <button :class="[
              active ? 'bg-primary text-white' : 'bg-surface text-foreground',
              'flex w-full items-center'
            ]" @click="reboot">
              <icons-restart-icon :active="active" aria-hidden="true"
                class="btn-icon" />
              Restart
            </button>
          </menu-item>
        </div>
        <div class="nav-menu-item-group">
          <menu-item v-slot="{ active }" class="nav-menu-item">
            <button :class="[
              active ? 'bg-primary text-white' : 'bg-surface text-foreground',
              'flex w-full items-center'
            ]" @click="logout">
              <logout-icon :active="active" aria-hidden="true"
                class="btn-icon" />
              Logout
            </button>
          </menu-item>
        </div>
      </menu-items>
    </transition>
  </Menu>
</template>

<style>
.btn-icon {
  width: 1rem;
  height: 1rem;
  margin-right: .5rem;
}

.nav-menu-btn {
  border: none;
  background-color: transparent;
}

.nav-menu-btn:hover,
.nav-menu-btn[aria-expanded=true] {
  color: var(--primary);
}

.nav-menu-btn .cog {
  width: 1.5rem;
  height: 1.5rem;
  transition: transform 1s ease;
}

.nav-menu-btn .cog:hover {
  transform: rotate(90deg);
}

.nav-menu-btn .arrow {
  width: 1rem;
  height: 1rem;
  transition: transform .5s ease;
}

.nav-menu-btn[aria-expanded=true] .arrow {
  transform: rotate(180deg)
}

.nav-menu-items {
  position: absolute;
  right: 0;
  margin-top: .375rem;
  /* width: 100%; */
  /* margin-inline: 1rem; */
  /* border: 1px solid white; */
  border-radius: .5rem;
  background-color: var(--surface);

  -webkit-transform-origin: top right;
  -ms-transform-origin: top right;
  transform-origin: top right;
}

.nav-menu-item-group {
  padding-inline: .25rem;
  padding-block: .25rem;
}

.nav-menu-item-group:not(:last-child) {
  border-bottom: 1px solid var(--foreground);
}

.nav-menu-item {
  padding: .5rem;
  padding-right: 1.5rem;
  border-radius: .375rem;
  text-transform: capitalize;
}

/********** nav menu animation/transition ************** */
.nav-menu-dd-enter-from {
  transform: scale(.95);
  opacity: 0;
}

.nav-menu-dd-enter-to {
  transform: scale(1);
  opacity: 1;
}

.nav-menu-dd-enter-active {
  transition: all 100ms ease-out;
}

.nav-menu-dd-leave-from {
  transform: scale(1);
  opacity: 1;
}

.nav-menu-dd-leave-to {
  transform: scale(.95);
  opacity: 0;
}

.nav-menu-dd-leave-active {
  transition: all 75ms ease-in;
}

/* ****************************************************** */
</style>
