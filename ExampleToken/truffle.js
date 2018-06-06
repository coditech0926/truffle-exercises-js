module.exports = {
  // See <http://truffleframework.com/docs/advanced/configuration>
  // to customize your Truffle configuration!
    rpc: {
        host: 'localhost',
        port: '8545'
    },
    networks: {
        development: {
            host: "localhost",
            port: 8545,
            network_id: "*"
        },
        rinkeby: {
            host: "localhost",
            port: 8545,
            network_id: "4",
            from: "0xD90b635922Ed690b35C93503Ff58e5022Eed8ec5", // Use your own account!
            gas: 6712390
        }
    }
};
