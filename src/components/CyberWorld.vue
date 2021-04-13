<template>
    <v-container>
        <v-alert type="info"  v-model="alert"
        dismissible>
              {{transationErr}}
        </v-alert>
        <v-row class="text-center">
          <v-col cols="12">

          </v-col>

          <v-col class="mb-4">
            <h3>seller</h3>

            <a
              :href="baseChainUrl + 'address/' + currentAccount"
              target="_blank"
            >{{currentAccount}}</a>
          </v-col>

          <v-col
            class="mb-5"
            cols="12"
          >
            <h2 class="headline font-weight-bold mb-3">
              1 deploy ERC721 contract
            </h2>

            <v-row justify="center">
                <div class="button" @click='deployErc721'>
                    部署
                </div>
                <a :href="baseChainUrl +'address/'+ erc721ContractAddr" target="_blank" rel="noopener">{{erc721ContractAddr}}</a>
            </v-row>
          </v-col>

          <v-col
            class="mb-5"
            cols="12"
          >
            <h2 class="headline font-weight-bold mb-3">
              2 mint your NFT
            </h2>

            <v-row justify="center">
                <div class="button" @click='mint'>
                    铸造
                </div>
              <a :href="baseChainUrl +'tx/'+ mintTx" target="_blank" rel="noopener">{{mintTx}}</a>
            </v-row>
          </v-col>

          <v-col
            class="mb-5"
            cols="12"
          >
            <h2 class="headline font-weight-bold mb-3">
              3 deploy trade contract
            </h2>

            <v-row justify="center">
                <div class="button" @click='deployOrder'>
                    售卖
                </div>
                <a :href="baseChainUrl +'address/'+ orderContractAddr" target="_blank" rel="noopener">{{orderContractAddr}}</a>
            </v-row>
          </v-col>
          <v-col
            class="mb-5"
            cols="12"
          >
            <h2 class="headline font-weight-bold mb-3">
              4 seller approve ERC721 to trade contract
            </h2>

            <v-row justify="center">
                <div class="button" @click='approve721ToOrder'>
                    授权
                </div>
                <a :href="baseChainUrl +'tx/'+ approve721Tx" target="_blank" rel="noopener">{{approve721Tx}}</a>
            </v-row>
          </v-col>
          <v-col
            class="mb-5"
            cols="12"
          >
            <h2 class="headline font-weight-bold mb-3">
              buyer
            </h2>

            <v-row justify="center">
                <div class="">
                    {{buyerAccount}}
                </div>
            </v-row>
          </v-col>

          <v-col
            class="mb-5"
            cols="12"
          >
            <h2 class="headline font-weight-bold mb-3">
              5 buyer approve ERC20 to trade contract
            </h2>

            <v-row justify="center">
                <div class="button" @click='approve20ToOrder'>
                    授权
                </div>
                <a :href="baseChainUrl +'tx/'+ approve20Tx" target="_blank" rel="noopener">{{approve20Tx}}</a>
            </v-row>
          </v-col>

          <v-col
            class="mb-5"
            cols="12"
          >
            <h2 class="headline font-weight-bold mb-3">
                6.1 order info
            </h2>

            <v-row justify="center">
                <div class="button" @click='checkAuthERC721ToTrade'>
                    ERC721是否授权
                </div>
                <div class="">
                    {{isAuthERC721ToTrade}}
                </div>
            </v-row>
          </v-col>

          <v-col
            class="mb-5"
            cols="12"
          >
            <h2 class="headline font-weight-bold mb-3">
                6.2 order info
            </h2>

            <v-row justify="center">
                <div class="button" @click='checkAuthERC20ToTrade'>
                    ERC20是否授权
                </div>
                <div class="">
                    {{isAuthERC20ToTrade}}
                </div>
            </v-row>
          </v-col>
          <v-col
            class="mb-5"
            cols="12"
          >
            <h2 class="headline font-weight-bold mb-3">
                6.3 place order
            </h2>

            <v-row justify="center">
                <div class="button" @click='placeOrder'>
                    购买
                </div>
                <a :href="baseChainUrl +'tx/'+ placeOrderTx" target="_blank" rel="noopener">{{placeOrderTx}}</a>
            </v-row>
          </v-col>

        </v-row>
        <v-overlay :value="overlay">
            <v-progress-circular
                  :size="50"
                  color="primary"
                  indeterminate
                ></v-progress-circular>
        </v-overlay>
    </v-container>
</template>

<script>
import Web3 from 'web3'
import orderABI from '../contract/abi/order.json'
import orderBytecode from '../contract/bytecode/order.json'
import erc721ABI from '../contract/abi/erc721.json'
import erc721Bytecode from '../contract/bytecode/erc721.json'
import erc20ABI from '../contract/abi/erc20.json'
import {getNonce,login} from '../api/user'
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  },
  data(){
      return{
          alert: false,
          transationErr: '',
          overlay: false,
          isAuthERC20ToTrade: false,
          isAuthERC721ToTrade: false,
          buyerAccount:'',
          placeOrderTx: '',
          approve20Tx: '',
          approve721Tx:'',
          mintTx: '',
          orderContractAddr: '',
          erc721ContractAddr: '',
          tokenId:1,
          price:'5566000000000000000000',
          erc20TokenAddr:'0xf65e032d959400c8ad566eb341844e1dda1fff2c',
          web3: null,
          currentAccount: null,
          baseChainUrl: 'https://rinkeby.etherscan.io/',
      }
  },
  watch: {
      // overlay (val) {
      //   val && setTimeout(() => {
      //     this.overlay = false
      //   }, 2000)
      // },
      alert (val) {
        val && setTimeout(() => {
          this.alert = false
      }, 10000)
      },
    },
created(){
    if(!window.ethereum){
        alert('please install newest metamask')
    }
    // console.log('orderABI:',orderABI)
    this.web3 = new Web3(window.web3.currentProvider)
    console.log(this.web3)
    // console.log('account:', this.web3.eth.accounts)

    this.web3.eth.getAccounts().then(accounts => this.currentAccount = accounts[0])
    console.log('window.ethereum:',window.ethereum)
    // if(!window.ethereum.isUnlocked){
    //     window.ethereum.request({ method: 'eth_requestAccounts' }).then(accounts => {
    //         console.log(accounts[0])
    //     })
    // }

    // this.web3.eth.getBlock('latest').then(res => console.log('block:',res));

    // this.listenChainChanged()
    // this.listenAccountChanged()
    // const _this = this
     // this.GLOBAL.web3 = window.web3 = new this.Web3(window.ethereum)
     console.log('ethereum.isMetaMask:',window.ethereum.isMetaMask)
     // window.ethereum.autoRefreshOnNetworkChange = false
     // window.ethereum.on('accountsChanged', () => {
     //   console.log('accountsChanged')
     //   switch (_this.$route.path) {
     //     case '/':
     //       this.connectMetaMask()
     //       break
     //     default:
     //   }
     // })
     // window.ethereum.on('chainChanged', () => {
     //   console.log('chainChanged')
     //   switch (_this.$route.path) {
     //     case '/':
     //       this.connectMetaMask()
     //       break
     //     default:
     //   }
     // })

     // this.fetchNonce()
},
methods:{
    fetchNonce(){
        const ethereum = window.ethereum
        ethereum.request({method:'eth_requestAccounts'}).then(function(accounts){
            const account = accounts[0]
            getNonce(account).then( res => {
                console.log('nonce:',res)
                const params = [res.data,account]
                console.log(params)
                window.ethereum.request({method:'personal_sign',params}).then(function(result){
                    console.log(result)
                    login({'address':account,'signature':result}).then(function(loginRes){
                        console.log(loginRes)
                    })
                })
            })
        })

    },
    checkAuthERC20ToTrade(){
        const that = this
        if(this.orderContractAddr==''){
            alert('Please deploy trade contract first!')
        }
        let orderContract = new this.web3.eth.Contract(orderABI, this.orderContractAddr)

        orderContract.methods.hasApproved20().call({from: that.buyerAccount}, function(error,result){
            console.log('*************ERC20 start *************')
            console.log(error)
            console.log(result)
            that.isAuthERC20ToTrade = result
            console.log('*************ERC20 end *************')
        })
    },
    checkAuthERC721ToTrade(){
        const that = this
        if(this.orderContractAddr==''){
            alert('Please deploy trade contract first!')
        }
        let orderContract = new this.web3.eth.Contract(orderABI, this.orderContractAddr)

        orderContract.methods.hasApproved721().call({from: that.buyerAccount}, function(error,result){
            console.log('*************ERC721 start *************')
            console.log(error)
            console.log(result)
            that.isAuthERC721ToTrade = result
            console.log('*************ERC721 end *************')
        })
    },
    placeOrder(){
        const that = this
        if(this.orderContractAddr==''){
            alert('Please deploy trade contract first!')
        }
        let orderContract = new this.web3.eth.Contract(orderABI, this.orderContractAddr)

        orderContract.methods.trade().send({from: that.buyerAccount}).then(function(receipt){
            console.log(receipt)
            that.placeOrderTx = receipt.transactionHash
        })
    },
    approve20ToOrder(){
        const that = this

        let erc20Contract = new this.web3.eth.Contract(erc20ABI, this.erc20TokenAddr)

        const ethereum = window.ethereum
        ethereum.request({ method: 'eth_requestAccounts' }).then(accounts => {

            that.buyerAccount = accounts[0]
            erc20Contract.methods.approve(that.orderContractAddr,that.price).send({from: that.buyerAccount}).then(function(receipt){
                console.log(receipt)
                that.approve20Tx = receipt.transactionHash
            })
        }) .catch((err) => {
         // Some unexpected error.
         // For backwards compatibility reasons, if no accounts are available,
         // eth_accounts will return an empty array.
         console.error(err);
       });

    },
    approve721ToOrder(){
        const that = this
        if(this.erc721ContractAddr==''){
            alert('Please deploy erc721 contract first!')
        }
        let erc721Contract = new this.web3.eth.Contract(erc721ABI, this.erc721ContractAddr)
        erc721Contract.methods.approve(that.orderContractAddr,that.tokenId).send({from: this.currentAccount}).then(function(receipt){
            console.log(receipt)
            that.approve721Tx = receipt.transactionHash
        })
    },
    mint(){
        const that = this
        if(this.erc721ContractAddr==''){
            alert('Please deploy erc721 contract first!')
        }
        let erc721Contract = new this.web3.eth.Contract(erc721ABI, this.erc721ContractAddr)
        erc721Contract.methods.mintTo(this.currentAccount).send({from: this.currentAccount}).then(function(receipt){
            console.log(receipt)
            that.mintTx = receipt.transactionHash
        })
    },
    deployErc721(){
        const that = this
        let erc721Contract = new this.web3.eth.Contract(erc721ABI)
        let currentGas = 0
        that.overlay = !that.overlay
        this.web3.eth.getAccounts().then(account => {
            let currentAccount = account[0]
            console.log('account:',account)
            console.log(this)
            let name = 'Cyber World NFT'
            let symbol = 'CWNFT'
            let deplyOc =  erc721Contract.deploy({
                data: '0x' + erc721Bytecode.object,
                arguments:[name,symbol]
                // arguments:['0x0e87eb651e0C64df123DFB54Ea84Bbf36FE6886f','0x0e87eb651e0C64df123DFB54Ea84Bbf36FE6886f','0x0e87eb651e0C64df123DFB54Ea84Bbf36FE6886f','0x0e87eb651e0C64df123DFB54Ea84Bbf36FE6886f','0x0e87eb651e0C64df123DFB54Ea84Bbf36FE6886f']
            })

            deplyOc.estimateGas(function(err, gas){
                console.log(gas);
                currentGas = gas
                deplyOc.send({
                    from: currentAccount,
                    gas: currentGas*2,//
                    gasPrice: 1000000000
                },
                // function(error, transactionHash){ console.log('transaction result:', transactionHash) }
            )
                .on('error', function(error){
                    that.overlay = false
                    that.alert = true
                    console.log('transaction err:', error)
                    that.transationErr = error.message

                })
                // .on('transactionHash', function(transactionHash){ console.log('transaction result:', transactionHash) })
                // .on('receipt', function(receipt){
                //    console.log(receipt.contractAddress) // contains the new contract address
                //    that.erc721ContractAddr = receipt.contractAddress
                //    console.log('erc721 address:', that.erc721ContractAddr)
                // })
                // .on('confirmation', function(confirmationNumber, receipt){
                //     console.log('transaction confirmation:', confirmationNumber)
                //     console.log('transaction receipt:', receipt)
                // })
                .then(function(newContractInstance){
                    that.overlay = !that.overlay
                    console.log('erc721:' + newContractInstance) // instance with the new contract address
                    that.erc721ContractAddr = newContractInstance.options.address
                });
            })


        })
    },
    deployOrder(){
        const that = this
        let orderContract = new this.web3.eth.Contract(orderABI)
        let currentGas = 0
        console.log(orderContract)
        this.web3.eth.getAccounts().then(account => {
            let currentAccount = account[0]
            console.log('account:',account)
            console.log(this)
            let deplyOc =  orderContract.deploy({
                data: '0x' + orderBytecode.object,
                arguments:[currentAccount,that.erc721ContractAddr,that.tokenId,that.price,that.erc20TokenAddr]
                // arguments:['0x0e87eb651e0C64df123DFB54Ea84Bbf36FE6886f','0x0e87eb651e0C64df123DFB54Ea84Bbf36FE6886f','0x0e87eb651e0C64df123DFB54Ea84Bbf36FE6886f','0x0e87eb651e0C64df123DFB54Ea84Bbf36FE6886f','0x0e87eb651e0C64df123DFB54Ea84Bbf36FE6886f']
            })

            deplyOc.estimateGas(function(err, gas){
                console.log(gas);
                currentGas = gas
                deplyOc.send({
                    from: currentAccount,
                    gas: currentGas,
                    gasPrice: 1000000000
                },
                // function(error, transactionHash){ console.log('transaction result:', transactionHash) }
            )
                // .on('error', function(error){ console.log('transaction err:', error) })
                // .on('transactionHash', function(transactionHash){ console.log('transaction result:', transactionHash) })
                // .on('receipt', function(receipt){
                //    console.log(receipt.contractAddress) // contains the new contract address
                // })
                // .on('confirmation', function(confirmationNumber, receipt){
                //     console.log('transaction confirmation:', confirmationNumber)
                //     console.log('transaction receipt:', receipt)
                // })
                .then(function(newContractInstance){
                    console.log(newContractInstance.options.address) // instance with the new contract address
                    that.orderContractAddr = newContractInstance.options.address
                });
            })


        })
    },
     listenChainChanged () {
         const that = this
        const ethereum = window.ethereum
        ethereum.request({ method: 'eth_chainId' }).then(chainId => {
            that.handleChainChanged(chainId);
        });

        ethereum.on('chainChanged', this.handleChainChanged);
    },

    handleChainChanged(_chainId) {
        console.log('_chainId:',_chainId)
        // We recommend reloading the page, unless you must do otherwise
        // window.location.reload();
    },

    listenAccountChanged () {
       const ethereum = window.ethereum
       ethereum.request({ method: 'eth_requestAccounts' }).then(account => {
           console.log('w:',account)
       }) .catch((err) => {
        // Some unexpected error.
        // For backwards compatibility reasons, if no accounts are available,
        // eth_accounts will return an empty array.
        console.error(err);
      });

       ethereum.on('accountChanged', this.handleAccountsChanged);
   },
    handleAccountsChanged(accounts) {
        console.log('accounts:',accounts)
      if (accounts.length === 0) {
        // MetaMask is locked or the user has not connected any accounts
        console.log('Please connect to MetaMask.');
    } else if (accounts[0] !== this.currentAccount) {
        this.currentAccount = accounts[0];
        // Do any other work!
      }
    }
}
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

.hello{
    margin-left: 200px;
}

.button{
    color: #42b983;
    cursor: pointer;
}
h3 {
  margin: 40px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
