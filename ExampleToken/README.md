
In this project, we will create an example token on the Rinkeby testnet.

# Initialization

We will begin with an empty working directory.

```
$ mkdir ExampleToken
$ cd ExampleToken
$ truffle init
```
The working directory should now have the following file structure:

```
ExampleToken/
├── contracts
│   └── Migrations.sol
├── migrations
│   └── 1_initial_migration.js
├── test
├── truffle-config.js
└── truffle.js
```

# Create the token contract

## A simple token contract

Copy [this](https://github.com/rszheng/truffle-exercises/blob/master/ExampleToken/contracts/ExTokenSimple.sol) simple token contract file into the ```contracts/``` directory. Add to it more variables and functions if you like.

## A standard ERC20 token contract

Alternatively, you can copy [this](https://github.com/rszheng/truffle-exercises/blob/master/ExampleToken/contracts/ExTokenStandard.sol) file into the ```contracts/``` directory. This contract is a standard ERC20 token, about which you can learn more at this [link](https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20.md). 

Only the contract we just copied is not complete by itself, since it uses the OpenZeppelin library. To get OpenZeppelin library installed, in the working directory ```ExampleToken/``` we do the following:

```
$ npm init -y
$ npm install openzeppelin-solidity
```
If everything so far goes well, you will find the OpenZeppelin library in the directory ```ExampleToken/node_modules/```. All the library's contracts is contained in the `ExampleToken/node_modules/openzeppelin-solidity/contracts` folder. You can learn more about the OpenZeppelin library [here](https://github.com/OpenZeppelin/openzeppelin-solidity).


# Compile the contracts

In your working directory ```ExampleToken```,

```
$ truffle compile
```

# Prepare for deployment

As we are going to deploy our token contract to the Rinkeby testnet, we need an account with enough balance on the Rinkeby testnet.  

## Get an account with enough balance on Rinkeby testnet

If you don't already have a Rinkeby account with enough balance, say 0.5 ether, we recommend you to follow [this](https://gist.github.com/cryptogoth/10a98e8078cfd69f7ca892ddbdcf26bc) tutorial, only you don't need to run a full node. Synchronizing a light node is much faster, and we do need to get synchronized if our account is newly generated (so that the account will be known to have enough balance to deploy our contracts). 

Here, I will assume you have already installed correctly the ```geth``` client and show most part of the rest.

We first start the client in ```--light``` mode:

```
$ geth --rinkeby --light
```
The client will start synchronizing. Now start a new terminal, in which we will use the ```geth``` console to generate our account:

- on a Linux system
```
$ geth --datadir=$HOME/.rinkeby attach ipc:$HOME/.rinkeby/geth.ipc console
```
- on a macbook
```
$ geth --datadir=$HOME/.rinkeby attach ipc:$HOME/Library/Ethereum/rinkeby/geth.ipc console
```

In the console, we check accounts:

```
Welcome to the Geth JavaScript console!

instance: Geth/v1.8.10-stable/darwin-amd64/go1.10.2
 modules: admin:1.0 debug:1.0 eth:1.0 net:1.0 personal:1.0 rpc:1.0 txpool:1.0 web3:1.0

> eth.accounts
[]
```
If your have already got an account, like in my case, it should be like the following:
```
> eth.accounts
["0xd0d1baa48924550cd7c90fe8f959bbfade473fa4"]
```

You can use your already existent account, or just obtain a new one:

```
> personal.newAccount("YOURPASSWORD")
```
You will need your account address and password later on, so keep them somewhere or just leave this terminal open for the moment.

To get some ether for your account, go for this [faucet](https://www.rinkeby.io/#faucet) and follow the instructions.

Now I'll assume you have already get an account with enough balance on Rinkeby testnet. I'll also assume you have the password for the account. 

Never use an account on the mainnet for this project!


## Configure network for Truffle

Use [this](https://github.com/rszheng/truffle-exercises/blob/master/ExampleToken/truffle.js) configuration file to replace ```truffle.js``` in your working directory ```ExampleToken/```.

Open the copied file, and replace my account with yours in the configuration of ```rinkeby``` network.

## Create a migration file for deployment

Copy this into ```ExampleToken/migrations/```.














