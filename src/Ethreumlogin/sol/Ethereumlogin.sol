pragma solidity ^0.4.0;

/// @title Ethereum Login = Ethereumlogin

/* From 0.4.17 documentation ...
   We do not fix the exact version of the compiler from versions ^0.4.0 to 0.5.0,
   So that bug fix releases are still possible */

// Establish a crypto contract
contract Login {

  // generate a public event on the block chain that will notify clients

  /* declare the event LoginEvent of parameter sender of type address
     and challenge of type string */

  event LoginEvent(address sender, address indexed to, uint256 value);

  // declare a function login of parameter 'challenge' of type string

    function(string challenge) {
      LoginAttempt(msg.sender, challenge);
    }
  // End of contract Login
}
