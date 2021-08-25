pragma solidity ^0.4.0;

/// @title Ethereum One = Ethereumone

/* From 0.4.17 documentation ...
   We do not fix the exact version of the compiler from versions ^0.4.0 to 0.5.0,
   So that bug fix releases are still possible */

// Establish a Basic crypto contract
contract EtherOne {

  // Map an array for all balances

  /* declare a mapping of parameter 'address => unit256',
  and modifier public, and method 'balanceOf' */
  
  mapping (address => uint256) public balanceOf;

  // The name of the contract and the name of the constructor function should match

  /* declare a constructor function EtherOne of parameter 'initialSupply'
     of unsigned integer 256 */

    function EtherOne(uint256 initialSupply) {
      // Credit the creator with all initial coins
      balanceOf[msg.sender] = initialSupply;
    }

  /* declare a function of keyword 'transfer' of parameter '_to' of type address,
     and '_value' of unsigned integer 256 */ 

    function transfer(address _to, uint256 _value) {
      // Check message sender current balance
      require (balanceOf[msg.sender] >= _value);

      // Check for recipient overflow
      require (balanceOf[_to] + _value >= balanceOf[_to]);

      // Subtract amount from sender
      balanceOf[msg.sender] -= _value;

      // Add amount to recipient
      balanceOf[_to] += _value;
    }
  // End of contract EtherOne
}
