<script setup lang="ts">
const props = defineProps({
  width: {
    type: String,
    required: false,
    default: '1rem'
  },
  height: {
    type: String,
    required: false,
    default: '1rem'
  },
  color: {
    type: String,
    required: false,
    default: 'currentColor'
  }
})
</script>

<template>
  <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="img"
    :width="props.width" :height="props.height"
    preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24">
    <path fill="none" :stroke="props.color" stroke-linecap="round"
      stroke-linejoin="round" stroke-width="2"
      d="M2 6a2 2 0 0 1 2-2h16a2 2 0 0 1 2 2v9a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V6Zm6 14h8" />
  </svg>
</template>
