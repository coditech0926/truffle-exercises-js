
In this project, we will create an example token on the Rinkeby testnet. 
When following instructions, always remember to replace my account/address with yours.

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

Copy [this](https://github.com/rszheng/truffle-exercises/blob/master/ExampleToken/migrations/2_deploy_contracts.js) file into ```ExampleToken/migrations/```.

# Deploy the contracts

Now you need to close the synchronizing ```geth``` client (```CTRL + C```) and restart it with the following:

```
geth --rinkeby --light --rpc --rpcapi db,eth,net,web3,personal --unlock="0xd0d1baa48924550cd7c90fe8f959bbfade473fa4"
```

You will be asked to provide the password for your account.

As the client starts synchronizing again, in your console (another opened terminal), check that your account has indeed got enough balance.

```
> eth.getBalance(eth.accounts[0])
21449009200000000000
```
If not, it means your client is still not synchronized. Just wait for it.

After fully synchronized, you can finally deploy your contract:

```
$ truffle migrate --network rinkeby
Using network 'rinkeby'.

Running migration: 1_initial_migration.js
  Deploying Migrations...
  ... 0x8bf221719772ede97579e8ca24de16ec827caead1be146cd7aa01b1be0081f82
  Migrations: 0xe273c3a65caf8043519c535dd2e7cef4fac1852a
Saving successful migration to network...
  ... 0x56d30bfb1debdac4c6c39011b65d513dbb8db9717c495fdd4fd60ea6bdfa1e13
Saving artifacts...
Running migration: 2_deploy_contracts.js
  Deploying ExToken...
  ... 0x5fb0d167ed76f5d3edc5d96c4bdd4bfafcebdbaa32c2f255a56c468ed3e27ed6
  ExToken: 0xabd2fdf1e587990c27f0772ed2868ac3831d3d66
Saving successful migration to network...
  ... 0xf35e2b7bb10850661cdb32e0dda1764c876167ee2a21f5f8daa72bc25033ac20
Saving artifacts...
```
As it can be seen from the outputs, the contract ```ExToken```'s address is ```0xAbD2fDF1E587990C27f0772ed2868ac3831d3d66```. Your contract's address should be different from this, and you will need the address in order to interact with your contract.

Go check your contract on the Rinkeby [explorer](https://www.rinkeby.io/#explorer). If you deployed an ERC20 token, the explorer will be able to provide you the basic information of your token, such as the token name, symbol, total supply, etc.

# Interact with your contract

For this section, you might want to run a full node as it provides all data needed locally. Nonetheless, we can still go on with a light node, only your node has to be connected to a full node.

## Get the contract's ABI

A contract's ABI, or Application Binary Interface, tells how applications will interact with the contract deployed on a blockchain. 

In fact, the compiling of contract ```ExToken``` has already produced its ABI in the JSON file ```ExampleToken/build/contracts/ExToken.json```. To extract it from the file, we may use the ```jq``` tool, which you can find at this [link](https://stedolan.github.io/jq/download/). 

```cd``` into ```ExampleToken/build/contracts/```, use the following command to get the ABI file of contract ```ExToken```:

```
$ echo $(cat ExToken.json | jq ".abi") > ExToken.abi
```
This is how the ABI file looks like:
```
[{"constant":true,"inputs":[],"name":"name","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"decimals","outputs":[{"name":"","type":"uint8"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[{"name":"","type":"address"}],"name":"balanceOf","outputs":[{"name":"","type":"uint256"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":true,"inputs":[],"name":"symbol","outputs":[{"name":"","type":"string"}],"payable":false,"stateMutability":"view","type":"function"},{"constant":false,"inputs":[{"name":"_to","type":"address"},{"name":"_value","type":"uint256"}],"name":"transfer","outputs":[],"payable":false,"stateMutability":"nonpayable","type":"function"},{"inputs":[],"payable":false,"stateMutability":"nonpayable","type":"constructor"}]
```


Alternatively, you can use the compiler ```solc``` to get the ABI. Suppose you are in the directory ```ExampleToken/```:

- for ```ExTokenSimple.sol```

```
$ solc -o build/contract/ --abi contracts/ExTokenSimple.sol
```
- for ```ExTokenStandard.sol```

```
$ solc -o build/contract/ --allow-paths . --abi contracts/ExTokenStandard.sol
```

For ```ExTokenStandard.sol```, all contracts used (directly or indirectly) by ```ExToken``` have also been compiled with separate ABI files generated.


## Creates a contract instance for ```ExToken```

In the ```geth``` console, do the following:

```
> abi = [YOUR_CONTRACT_ABI];
> ExToken = eth.contract(abi);
> instance = ExToken.at("0xAbD2fDF1E587990C27f0772ed2868ac3831d3d66")
```
Remember to use the address of your deployed contract in the last commandline.

## Get information from you contract

Try the following:

```
> instance.name()
"Example Token"
> instance.symbol()
"ExT"
> instance.decimals()
2
> instance.balanceOf("0xd0d1baa48924550cd7c90fe8f959bbfade473fa4")
2100000000
```
As the creator of the contract, you have been given the total supply of ```ExToken```.

## Send transactions

To send transactions to your contract, we need to specify the transaction sender. If not specified, your ```geth``` client will use a default account, which is initially undefined, and this will lead to execution failure. To define the default account, just give it a value:

```
> eth.defaultAccount = "0xd0d1baa48924550cd7c90fe8f959bbfade473fa4";
```

Now we transfer some tokens to another address. First, obtain a new address:
```
> to_addr = personal.newAccount();
Passphrase: 
Repeat passphrase: 
"0x2f75e265606d26f966eb7dd050f91f592a861ad0"
```
Transfer the token:

```
> instance.transfer(to_addr, 10000);
"0x76ca9196dfa495fde9923eb95a989ded6f3a102e5c1c6f842c3273b59763d035"
```
What returned is the transaction hash. You can check transaction details on the Rinkeby [explorer](https://www.rinkeby.io/#explorer).

Now check the token balance of your accounts:

```
> instance.balanceOf(eth.defaultAccount)
2099990000
> instance.balanceOf(to_addr)
10000
```

Try send some token to your friends :)






