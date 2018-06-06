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

# Prepare for deploying

In the ```migrations/``` directory, create a file ```2_deploy_contracts.js```, which you can find [here](https://github.com/rszheng/truffle-exercises/blob/master/SimpleStorage/migrations/2_deploy_contracts.js).

# Deploy your contract

In this project, we will deploy the contract to a private blockchain. For developing convenience, Truffle provides a built-in blockchain, which can be started by command:

```
$ truffle develop
```
As the development blockchain gets started, you will be given ten accounts:


# Interact with your contract
