
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


# 






