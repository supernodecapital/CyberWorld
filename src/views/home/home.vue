<template >

 <v-row>
     <v-col>
         <v-row>
             <v-col>
                 <v-img
                   lazy-src="https://picsum.photos/id/11/10/6"
                   width='100%'
                   src='@/assets/images/home/banner.png'
                 ></v-img>
             </v-col>
         </v-row>
         <v-card color='#EDEEF2' outlined rounded='0'>
             <v-container>
             <v-row>

                 <v-col align-self='center'>
                         <v-container>

                             <v-row>
                                 <span class='token-slogan'>CyberWorld，NFT everything</span>
                             </v-row>
                             <v-row>
                                 <span class="token-usage">creation&flow,inspiration&value.cyberworld,linking us</span>
                             </v-row>
                             <v-row>
                                 <v-btn color='#32476D' depressed class="white--text market"><span class='market-btn'>   Market   </span></v-btn>
                                 <v-btn color='white'><span class='market-btn'>Create</span></v-btn>

                             </v-row>
                         </v-container>


                 </v-col>


                 <v-spacer></v-spacer>
                 <v-col cols='2'>
                    <v-img lazy-src="https://picsum.photos/id/11/10/6" width='170' src='@/assets/images/home/token-icon.png'></v-img>
                 </v-col>
             </v-row>
            </v-container>
         </v-card>

         <v-container>
             <v-row  cols="12">
                 <v-col cols='6'>

                     <v-container>
                         <v-img lazy-src="https://picsum.photos/id/11/10/6" width='530' class='artwork1' src='@/assets/images/home/artwork1.png'></v-img>
                     </v-container>

                 </v-col>
                 <v-col>
                     <v-container>
                         <v-img lazy-src="https://picsum.photos/id/11/10/6" width='530' class="artwork2" src='@/assets/images/home/artwork2.png'></v-img>
                         <v-img lazy-src="https://picsum.photos/id/11/10/6" width='530' class='artwork3' src='@/assets/images/home/artwork3.png'></v-img>
                     </v-container>

                 </v-col>
             </v-row>
         </v-container>

        <v-item-group>
            <v-container>
              <v-row>
                <v-col
                  v-for="n in 8"
                  :key="n"
                  cols="6"
                  md="3"
                >
                  <v-item >
                      <v-container>
                          <v-img
                              lazy-src="https://picsum.photos/id/11/10/6"
                              max-height="260"
                              max-width="260"
                              src="@/assets/images/home/n1.png"
                              ></v-img>
                              <div class="">
                                  Charm (Titsim) Muix
                              </div>
                              <div class="">
                                  Muix Art Collection-Cry
                              </div>
                              <div>
                                1,000 miles of wonder
                            </div>
                      </v-container>
                  </v-item>
                </v-col>
              </v-row>
            </v-container>
          </v-item-group>
    </v-col>
 </v-row>
</template>

<script>
export default {
    data: () => ({
     model: 0,
     colors: [
       'primary',
       'secondary',
       'yellow darken-2',
       'red',
       'orange',
     ],
   }),
}
</script>

<style lang="css" scoped>
    .token-slogan{
        width: 396px;
        height: 52px;
        opacity: 1;
        font-size: 28px;
        font-family: Avenir, Avenir-Medium;
        font-weight: 500;
        text-align: left;
        color: #32476d;
        line-height: 52px;
    }
    .token-usage{
        width: 486px;
        height: 40px;
        opacity: 1;
        font-size: 18px;
        font-family: PingFangSC, PingFangSC-Regular;
        font-weight: 400;
        text-align: left;
        color: #666666;
        line-height: 30px;
    }
    .market{
        margin-right: 5px;
    }
    .market-btn{
        padding: 0 20px;
    }
    .artwork1{
        /* margin-left: 32px; */
    }
    .artwork3{
        /* margin-left: 20px; */
    }
    .artwork2{
        /* margin-left: 20px; */
        margin-bottom: 10px;
    }
</style>
