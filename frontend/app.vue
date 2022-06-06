<script setup lang="ts">
/* global useHead */
useHead({
  titleTemplate: 'myNAS - %s',
  meta: [
    { name: 'color-scheme', content: 'dark light' }
  ]
})
</script>

<template>
  <nuxt-layout>
    <nuxt-page />
  </nuxt-layout>
</template>
