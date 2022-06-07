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
    preserveAspectRatio="xMidYMid meet" viewBox="0 0 24 24" id="burger-icon"
    :fill="props.color">
    <path id="top" d="M8 9H12v-2h9v2Zm0" />
    <path d="M8 14H3v-2h18v2Zm0" />
    <path id="bottom" d="M8 19H3v-2h9v2Zm0" />
    <!-- <path fill="currentColor"
      d="M12 18H3v-2h9v2Zm9-5H3v-2h18v2Zm0-5h-9V6h9v2Z" /> -->
  </svg>
</template>

<style>
#burger-icon:hover {
  color: var(--primary);
}

#burger-icon #top {
  animation: top 1s ease forwards;
}

#burger-icon:hover #top {
  animation: topHover 1s ease forwards;
}

#burger-icon #bottom {
  animation: bottom 1s ease forwards;
}

#burger-icon:hover #bottom {
  animation: bottomHover 1s ease forwards;
}

@keyframes top {
  0% {
    transform: translateX(-38%);
  }

  100% {
    transform: translateX(0%);
  }
}

@keyframes topHover {
  0% {
    transform: translateX(0%);
  }

  100% {
    transform: translateX(-38%);
  }
}

@keyframes bottom {
  0% {
    transform: translateX(38%);
  }

  100% {
    transform: translateX(0%);
  }
}

@keyframes bottomHover {
  0% {
    transform: translateX(0%);
  }

  100% {
    transform: translateX(38%);
  }
}
</style>
