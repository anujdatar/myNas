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
  }
})
</script>

<template>
  <svg xmlns="http://www.w3.org/2000/svg" aria-hidden="true" role="img"
    :width="props.width" :height="props.height"
    preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24">
    <g fill="none" stroke="currentColor" stroke-linecap="round"
      stroke-width="2">
      <path
        d="M5.63604 5.63603C9.15076 2.12131 14.8492 2.12131 18.364 5.63603C21.8787 9.15075 21.8787 14.8492 18.364 18.364C14.8492 21.8787 9.15076 21.8787 5.63604 18.364C2.12132 14.8492 2.12132 9.15075 5.63604 5.63603Z"
        class="il-md-length-70 il-md-duration-4 il-md-delay-0" />
      <path d="M6 6L18 18"
        class="il-md-length-25 il-md-duration-2 il-md-delay-5" />
    </g>
  </svg>
</template>
