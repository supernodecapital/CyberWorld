<template>
  <CyberWorld />
</template>

<script>
import CyberWorld from '@/components/CyberWorld'
  export default {
    name: 'HelloWorld',
    beforeCreate () {
      // this.$store.dispatch('registerWeb3')
      // console.log('registerWeb3 Action dispatched from casino-dapp.vue')
    },
    components: {CyberWorld},

  }
</script>
