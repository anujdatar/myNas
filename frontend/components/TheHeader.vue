<script setup lang="ts">
</script>

<template>
  <div class="navbar w-full flex items-center">
    <div
      class="navbar-container w-full h-full flex items-center justify-between">
      <icons-burger-icon class="icon-btn flex items-center cursor-pointer" />
      <nuxt-link to="/" class="logo flex flex-row items-center justify-center">
        <icons-logo-icon class="icon" />
        <span class="semibold">myNAS</span>
      </nuxt-link>
      <settings-dropdown />
    </div>
  </div>
</template>

<style>
.navbar {
  height: var(--navbar-height);
  -webkit-box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
  box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
}

.navbar-container {
  padding-inline: .5rem;
}

.logo {
  text-decoration: none;
  color: var(--primary);
}

.logo .icon {
  width: 2rem;
  height: 2rem;
  margin-right: .25rem;
}

.logo span {
  font-size: 1.5rem;
}

.navbar .icon-btn {
  font-size: 1.5rem;
}
</style>
