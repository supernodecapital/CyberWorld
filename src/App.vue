<template>
  <v-app>
    <v-app-bar
      app
      color="white"
      dark
    >
      <div class="d-flex align-center">
        <v-img
          alt="Vuetify Logo"
          class="shrink mr-2"
          contain
          src="@/assets/logo.png"
          transition="scale-transition"
          width="126"
        />

        
      </div>


      <v-responsive max-width="440">
          <v-text-field
            dense
            flat
            hide-details
            rounded
            solo-inverted
            background-color='#EDEDED'

          ></v-text-field>
        </v-responsive>

      <v-breadcrumbs :items="items" >
        <template v-slot:item="{ item }">
          <v-breadcrumbs-item
            :href="item.href"
            :disabled="item.disabled"
            :active-class='item.activeClass'
            class='tab-menu'
            :to='item.to'
          >
            {{ item.text.toUpperCase() }}
          </v-breadcrumbs-item>
        </template>
      </v-breadcrumbs>

    </v-app-bar>

    <v-main>
      <!-- <HelloWorld/> -->
      <!-- <CyberWorld /> -->
      <router-view></router-view>
    </v-main>
  </v-app>
</template>

<script>
// import HelloWorld from './components/HelloWorld';
// import CyberWorld from './components/CyberWorld';

export default {
  name: 'App',

  components: {
    // HelloWorld,
    // CyberWorld,
  },

  data: () => ({
    //
    items: [
        {
          text: 'Market',
          disabled: false,
          href: 'breadcrumbs_dashboard',
           'activeClass':'active-item',
           to: '/home'

        },
        {
          text: 'INFO',
          disabled: false,
          href: 'breadcrumbs_link_1',
           'activeClass':'active-item',
            to: '/info'
        },
        {
          text: 'Creat',
          disabled: false,
          href: 'breadcrumbs_link_2',
           'activeClass':'active-item',
            to: '/create'
        },
        {
          text: 'Community',
          disabled: false,
          'activeClass':'active-item',
          href: 'breadcrumbs_link_2',
           to: '/community'
        },
      ],
  }),
};
</script>

<style lang="scss" >
    .tab-menu{
        a{
            color: #666666 !important;
        }

        // font-weight: 700;
        font-size: 16px;
    }
    .v-application{
        // a{
        //     color: #666666 !important;
        //
        //     font-size: 16px;
        // }
        .active-item{
            color: #666666;
            font-weight: 700;
            font-size: 16px;
        }
    }

</style>
