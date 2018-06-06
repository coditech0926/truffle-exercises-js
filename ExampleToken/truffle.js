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
            from: "0xd0d1baa48924550cd7c90fe8f959bbfade473fa4", // Use your own account!
            gas: 6712390
        }
    }
};
