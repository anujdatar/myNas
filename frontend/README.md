# myNas Frontend

Vue 3 + TypeScript + Vite 2

Motivated by the [@antfu/vitesse](https://github.com/antfu/vitesse) template. Uses a lot of the same packages, but does a few things differently.

## Features / Packages used:
- Component auto importing using [`unplugin-vue-components`](https://github.com/antfu/unplugin-vue-components)
- File based routing using [`vite-plugin-pages`](https://github.com/hannoeru/vite-plugin-pages)
- File based layouts, using [`vite-plugin-vue-layouts`](https://github.com/JohnCampionJr/vite-plugin-vue-layouts)
- [`Pinia`](https://pinia.esm.dev/) for state management
- Vue Composition API auto importing using [`unplugin-auto-import`](https://github.com/antfu/unplugin-auto-import)
- [VueUse](https://vueuse.org) utilitues `@vueuse/core` and `@vueuse/head`
- PWA using [`vite-plugin-pwa`](https://github.com/antfu/vite-plugin-pwa). Not implemented yet. TODO: soon.
- [HeadlessUI](https://headlessui.dev/) by the Tailwind CSS guys, for some unstyled components, `@headlessui/vue`. I don't use Tailwind CSS though.
- [HeroIcons](https://heroicons.com/) for some simple svg icons, `@heroicons/vue`
- [ESLint](https://eslint.org/) and the [Standard JS style](https://standardjs.com/) using [`eslint-config-standard`](https://github.com/standard/eslint-config-standard). Single quotes, no trailing commas, no semicolons, space-before-function-paren, console statements allowed.

## Usage
### Dev
```bash
npm run dev
```

