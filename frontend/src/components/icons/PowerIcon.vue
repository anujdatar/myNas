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
    preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24" :fill="props.color">
    <path d="M12 13a1 1 0 0 0 1-1V2a1 1 0 0 0-2 0v10a1 1 0 0 0 1 1Z" />
    <path
      d="M16.59 3.11a1 1 0 0 0-.92 1.78a8 8 0 1 1-7.34 0a1 1 0 1 0-.92-1.78a10 10 0 1 0 9.18 0Z" />
  </svg>
</template>
