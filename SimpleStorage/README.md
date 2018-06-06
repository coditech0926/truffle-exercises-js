// This will guide you through the basic steps practicing with the Truffle framework

# Initialization

You need to start with an empty working directory: 

```
$ mkdir SimpleStorage
$ cd SimpleStorage
```
Now your are in the working directory ```SimpleStorage/```, a simple command will initialize your project:

```
$ truffle init
```
After initialization, your working directory will filled with the following files:

```
.
├── contracts
│   └── Migrations.sol
├── migrations
│   └── 1_initial_migration.js
├── test
├── truffle-config.js
└── truffle.js
```

# Create your contract

In the ```contracts/``` directory, create your contract file ```Store.sol```, which you can find [here](https://github.com/rszheng/truffle-exercises/blob/master/SimpleStorage/contracts/Store.sol).

# Compile your contract

```
$ truffle compile
```
When successfully compiled, a ```build/``` directory will be found in your working directory ```SimpleStorage/```. ```cd``` into ```build/contracts/```, the file ```SimpleStorage.json``` contains all kinds of compiled objects of ```Store.sol```, such as ABI and bytecode. 

# Prepare for deploying

In the ```migrations/``` directory, create a file ```2_deploy_contracts.js```, which you can find [here](https://github.com/rszheng/truffle-exercises/blob/master/SimpleStorage/migrations/2_deploy_contracts.js).

# Deploy your contract

In this project, we will deploy the contract to a private blockchain. For developing convenience, Truffle provides a built-in blockchain, which can be started by command:

```
$ truffle develop
```
As the development blockchain gets started, you will be given ten accounts:

```
Truffle Develop started at http://127.0.0.1:9545/

Accounts:
(0) 0x627306090abab3a6e1400e9345bc60c78a8bef57
(1) 0xf17f52151ebef6c7334fad080c5704d77216b732
(2) 0xc5fdf4076b8f3a5357c5e395ab970b5b54098fef
(3) 0x821aea9a577a9b44299b9c15c88cf3087f3b5544
(4) 0x0d1d4e623d10f9fba5db95830f7d3839406c6af2
(5) 0x2932b7a2355d6fecc4b5c0b6bd44cc31df247a2e
(6) 0x2191ef87e392377ec08e7c08eb105ef5448eced5
(7) 0x0f4f2ac550a1b4e2280d04c21cea7ebd822934b5
(8) 0x6330a553fc93768f612722bb8c2ec78ac90b3bbc
(9) 0x5aeda56215b167893e80b4fe645ba6d5bab767de

Private Keys:
(0) c87509a1c067bbde78beb793e6fa76530b6382a4c0241e5e4a9ec0a0f44dc0d3
(1) ae6ae8e5ccbfb04590405997ee2d52d2b330726137b875053c36d94e974d162f
(2) 0dbbe8e4ae425a6d2687f1a7e3ba17bc98c673636790f1b8ad91193c05875ef1
(3) c88b703fb08cbea894b6aeff5a544fb92e78a18e19814cd85da83b71f772aa6c
(4) 388c684f0ba1ef5017716adb5d21a053ea8e90277d0868337519f97bede61418
(5) 659cbb0e2411a44db63778987b1e22153c086a95eb6b18bdf89de078917abc63
(6) 82d052c865f5763aad42add438569276c00d3d88a2d062d36b2bae914d58b8c8
(7) aa3680d5d48a8283413f7a108367c7299ca73f553735860a87b08f39395618b7
(8) 0f62d96d6675f32685bbdb8ac13cda7c23436f63efbb9d07700d8669ff12b7c4
(9) 8d5366123cb560bb606379f90a0bfd4769eecc0557f1b362dcae9012b548b1e5

Mnemonic: candy maple cake sugar pudding cream honey rich smooth crumble sweet treat

⚠️  Important ⚠️  : This mnemonic was created for you by Truffle. It is not secure.
Ensure you do not use it on production blockchains, or else you risk losing funds.

truffle(develop)>
```
The first account will be used as the default to make transactions in the console ```truffle(develop)>```, including our contract deployment. 

Before deployment, let's check that our default transaction account was initially given 100 ether, i.e.  10^20 Wei:

```
truffle(develop)> addr = web3.eth.accounts[0];
'0x627306090abab3a6e1400e9345bc60c78a8bef57'
truffle(develop)> web3.eth.getBalance(addr).toExponential();
'1e+20'
```
Now we deploy the contractrs:

```
truffle(develop)> migrate
Using network 'develop'.

Running migration: 1_initial_migration.js
  Deploying Migrations...
  ... 0xecb33cd5d5193c6f021128c64de4ab9fc9fa7920a032bd67462cc27ddbac9e0b
  Migrations: 0x8cdaf0cd259887258bc13a92c0a6da92698644c0
Saving successful migration to network...
  ... 0xd7bc86d31bee32fa3988f1c1eabce403a1b5d570340a3a9cdba53a472ee8c956
Saving artifacts...
Running migration: 2_deploy_contracts.js
  Deploying SimpleStorage...
  ... 0x0498f3ac563992c9414a414bd64f10353b872a42615669fa744f6b9d3f29284c
  SimpleStorage: 0x345ca3e014aaf5dca488057592ee47305d9b3e10
Saving successful migration to network...
  ... 0xf36163615f41ef7ed8f4a8f192149a0bf633fe1a2398ce001bf44c43dc7bdda0
Saving artifacts...
truffle(develop)>
```
As you can see, four transactions were made, of which the third one is the actual deployment of the contract ```SimpleStorage```. The address for our contract ```SimpleStorage``` is ```0x345ca3e014aaf5dca488057592ee47305d9b3e10```.

Let's check that our default transaction account has paid for these transactions:

```
truffle(develop)> web3.eth.getBalance(addr).toExponential();
'9.99541309e+19'
```

Also, we can check that the ```nonce``` of our default account has been raised accordingly:

```
truffle(develop)> web3.eth.getTransactionCount(addr);
4
```
Check out [this](https://github.com/ethereum/wiki/wiki/JavaScript-API) page to learn more about usage of various available JavaScript APIs. 

# Interact with your contract




