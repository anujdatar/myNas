<template>
  <div class="all-content">
    <the-sidebar />
    <div class="main-content">
      <the-header />
      <slot />
    </div>
  </div>
</template>

<style>
.all-content {
  display: flex;
  flex-direction: row;
}

.main-content {
  min-width: calc(100% - var(--sidebar-width));
  max-width: 100%;
  display: flex;
  flex-direction: column;
  box-shadow: 20px 0 25px 25px rgba(0, 0, 0, 0.1), 10px 0 10px 10px rgba(0, 0, 0, 0.04);
}
</style>
