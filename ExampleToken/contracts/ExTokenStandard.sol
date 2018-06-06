pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC20/StandardToken.sol';

contract ExToken is StandardToken {
    string public constant name = 'Example Token';
    string public constant symbol = "ExT";
    uint8 public constant decimals = 2;
    uint constant _initialSupply = 2100000000;

    constructor() public {
        totalSupply_ = _initialSupply;
        balances[msg.sender] = _initialSupply;
        emit Transfer(address(0), msg.sender, _initialSupply);
    }
}
