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
    preserveAspectRatio="xMidYMid meet" viewBox="0 0 16 16">
    <path :fill="props.color"
      d="M2 5.56L2.413 5h11.194l.393.54L8.373 11h-.827L2 5.56z" />
  </svg>
</template>
