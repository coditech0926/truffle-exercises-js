pragma solidity ^0.4.20;

contract ExToken {
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf;
    
    string public constant name = 'Example Token';
    string public constant symbol = 'ExT';
    uint8 public constant decimals = 2;
    uint constant totalSupply = 2100000000;

    /* Initializes contract with all tokens to the creator of the contract */
    constructor() public {
        balanceOf[msg.sender] = totalSupply;              // Give the creator all initial tokens
    }

    /* Send coins */
    function transfer(address _to, uint256 _value) public {
        require(balanceOf[msg.sender] >= _value);           // Check if the sender has enough
        require(balanceOf[_to] + _value >= balanceOf[_to]); // Check for overflows
        balanceOf[msg.sender] -= _value;                    // Subtract from the sender
        balanceOf[_to] += _value;                           // Add the same to the recipient
    }
}
