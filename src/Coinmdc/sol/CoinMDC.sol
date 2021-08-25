pragma solidity ^0.4.0;

/// @title Coin MDC = CoinMDC

/* From 0.4.17 documentation ...
   We do not fix the exact version of the compiler from versions ^0.4.0 to 0.5.0,
   So that bug fix releases are still possible */

// Establish ownership of the crypto
contract owned {
  // declare a public 'owner' variable of type address
  address public owner;

  // The name of the constructor function and the name of the contract should match

  /* declare a constructor function owned of parameter () */
  function owned() {
    // assign the value 'msg.sender' to the variable owner
    owner = msg.sender;
  }

  modifier onlyOwner {
    require(msg.sender == owner);
    _;
  }

  function transferOwnership(address newOwner) onlyOwner {
    // Use 'camelCase' for the names of variables
    // Assign the variable 'newOwner' the value of owner
    owner = newOwner;
  }
  // End of contract owned
}

// Establish the Token Recipient
contract tokenRecipient {

  /* declare a function receiveApproval of parameter 'from' of type address,
     and 'value' of unsigned integer 256,
     and 'token' of type address,
     and extraData of type bytes */

  // An unsigned integer of 256 bits = 32 bytes
     
  function receiveApproval(address from, uint256 value, address token, bytes extraData) {
    // A gutless function
  }
  // End of contract tokenRecipient
}

// Establish the Token
contract token {
  // declare a public 'name' variable of type string
  string public name;

  // declare a public 'symbol' variable of type string
  string public symbol;

  // declare a public 'decimals' variable of type uint8
  uint8 public decimals;

  // declare a public 'totalSupply' variable of type uint256
  uint256 public totalSupply;

  // Map an array for all balances

  /* declare a mapping of parameter 'address => unit256',
  and modifier public, and method 'balanceOf' */
  
  mapping (address => uint256) public balanceOf;

  /* declare a mapping of parameter 'address => mapping',
  and parameter 'address => unit256',
  and modifier public, and method 'allowance' */

  mapping (address => mapping (address => uint256)) public allowance;

  // generate a public event on the block chain that will notify clients
 
  /* declare the event Transfer of parameter 'indexed from' of type address,
     and 'indexed to' of type address, and 'value' of unsigned integer 256 */

  event Transfer(address indexed from, address indexed to, uint256 value);

  // generate a public event on the block chain that will notify clients of the amount burnt

  /* declare the event Burn of parameter 'indexed from' of type address,
     and 'value' of unsigned integer 256 */
     
  event Burn(address indexed from, uint256 value);

  // The name of the contract and the name of the constructor function should match

  /* declare a constructor function token of parameter initialSupply of
     unsigned integer 256, and tokenName of type string,
     and decimalUnits of unsigned integer 8, and tokenSymbol of type string */

    function token(uint256 initialSupply, string tokenName, uint8 decimalUnits, string tokenSymbol) {
      // Assign the declared variable initialSupply to the balance of the message sender
      balanceOf[msg.sender] = initialSupply;

      // Assign the declared variable initialSupply to the declared variable totalSupply
      totalSupply = initialSupply;

      // Assign the declared variable tokenName to the previously declared variable name
      name = tokenName;

      // Assign the declared variable tokenSymbol to the previously declared variable symbol
      symbol = tokenSymbol;

      // Assign the declared variable decimalUnits to the previously declared variable decimals
      decimals = decimalUnits;
    }

  // Call by internal transfer only under this contract

  /* declare an internal function of keyword '_transfer',
     and parameter 'address _from' and 'address _to' and  'uint _value', and modifier 'internal' */

    function _transfer(address _from, address _to, uint _value) internal {
      // Prevent any attempted trf to an address that starts with `0x0`
      require (_to != 0x0);

      // Check message sender current balance
      require (balanceOf[_from] > _value);

      // Check for recipient overflow
      require (balanceOf[_to] + _value > balanceOf[_to]);

      // Subtract amount from sender
      balanceOf[_from] -= _value;

      // Add amount to recipient
      balanceOf[_to] += _value;

      // Is there anyone listening to this transfer event
      Transfer(_from, _to, _value);
    }
    
  /// @notice Send `_value` tokens to `_to` from your account
  /// @param _to The address of the recipient
  /// @param _value The amount to send

  /* declare a function of keyword 'transfer' of parameter '_to' of type address,
     and, '_value' of unsigned integer 256 */

    function transfer(address _to, uint256 _value) {
      // Use the internal form of transfer
      _transfer(msg.sender, _to, _value);
    }

  /// @notice Send `_value` tokens to `_to` in behalf of `_from`
  /// @param _from The address of the sender
  /// @param _to The address of the recipient
  /// @param _value The amount to send

  /* declare a function transferFrom of parameter '_from' of type address,
     and '_to' of type address, and '_value' of unsigned integer 256,
     and modifier returns with parameter success of type bool */

    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {
      // Check allowance
      require(_value < allowance[_from][msg.sender]);

      allowance[_from][msg.sender] -= _value;
      _transfer(_from, _to, _value);
      return true;
    }
  
  /// @notice Allows `_spender` to spend no more than `_value` tokens in your behalf
  /// @param _spender The address authorized to spend
  /// @param _value The max amount they can spend

  /* declare a function approve of parameter '_spender' of type address,
     and '_value' of unsigned integer 256,
     and modifier returns with parameter success of type bool */

    function(address _spender, uint256 _value) returns (bool success) {
      allowance[msg.sender][_spender] = _value;
      return true;
    }

  /// @notice Allows `_spender` to spend no more than `_value` tokens in your behalf and then ping the contract about it
  /// @param _spender The address authorized to spend
  /// @param _value The max amount they can spend
  /// @param _extraData Some extra info to send to the approved contract

  /* declare a function approveAndCall of parameter '_spender' of type address,
     and '_value' of unsigned integer 256,
     and '_extraData' of type bytes,
     and modifier returns with parameter success of type bool */

    function(address _spender, uint256 _value, bytes _extraData) returns (bool success) {
      tokenRecipient spender = tokenRecipient(_spender);
      if (approve(_spender, _value)) {
        spender.receiveApproval(msg.sender, _value, this, _extraData);
        return true;
      }
    }

  /// @notice Remove `_value` tokens from the system irreversibly
  /// @param _value The amount of money to burn

  /* declare a function of keyword 'burn' of parameter '_value' of unsigned integer 256,
     and modifier returns with parameter success of type bool */

    function burn(uint256 _value) returns (bool success) {
      // Check the message sender balance
      require (balanceOf[msg.sender] > _value);

      // Deduct from the balance of message sender the value declared
      balanceOf[msg.sender] -= _value;

      // Update totalSupply
      totalSupply -= _value;

      // Invoke the event Burn to notify clients about the amount burnt
      Burn(msg.sender, _value);
      return true;
    }
    
  /* declare a function burnFrom of parameter '_from' of type address,
     and '_value' of unsigned integer 256,
     and modifier returns with parameter success of type bool */

    function burnFrom(address _from, uint256 _value) returns (bool success) {
      // Ensure the targeted balance is enough
      require(balanceOf[_from] >= _value);

      // Check the allowance
      require(_value <= allowance[_from][msg.sender]);

      // Subtract from target balance
      balanceOf[_from] -= _value;

      // Subtract from sender allowance
      allowance[_from][msg.sender] -= _value;

      // Update totalSupply
      totalSupply -= _value;

      // Invoke the event Burn to notify clients about the amount burnt
      Burn(_from, _value);
      return true;
    }
  // End of contract token
}

// The parent contracts are owned and token.

// Therefore, the contract Medcoin inherits the properties of the owned, token contracts via the keyword `is`

// Establish the Advanced Token
contract MedCoin is owned, token {
  // declare a public 'sellPrice' variable of type uint256
  uint256 public sellPrice;

  // declare a public 'buyPrice' variable of type uint256
  uint256 public sellPrice;

  // declare the mapping frozenAccount of parameter 'address => bool' and modifier public
  mapping (address => bool) public frozenAccount;

  // declare the event FrozenFunds of parameters 'target' of type address and 'frozen' of type bool
  event FrozenFunds(address target, bool frozen);

  // The name of the constructor function and the name of the contract should match

  /* declare a constructor function MedCoin of parameter 'initialSupply' of type uint256,
     and 'tokenName' of type string,
     and 'decimalUnits' of type uint8,
     and 'tokenSymbol' of type string,
     and modifier token of parameter 'initialSupply',
     and 'tokenName', and 'decimalUnits', and 'tokenSymbol' */

    function MedCoin(uint256 initialSupply, string tokenName, uint8 decimalUnits, string tokenSymbol) token (initialSupply, tokenName, decimalUnits, tokenSymbol) {
      // A gutless function
    }

  /* declare a internal function of keyword '_transfer',
     and parameter '_from' of type address and '_to' of type address and '_value' of unsigned integer, and modifier internal */

    function _transfer(address _from, address _to, uint _value) internal {
      // Prevent any attempted trf to an address that starts with `0x0`
      require (_to != 0x0);

      // Check message sender current balance
      require (balanceOf[_from] > _value);

      // Check for recipient overflow
      require (balanceOf[_to] + _value > balanceOf[_to]);

      // Check if sender is frozen
      require (!frozenAccount[_from]);

      // Check if recipient is frozen
      require (!frozenAccount[_to]);

      // Subtract amount from sender
      balanceOf[_from] -= _value;

      // Add amount to recipient
      balanceOf[_to] += _value;

      // Is there anyone listening to this transfer event
      Transfer(_from, _to, _value);
    }

  /// @notice Create `mintedAmount` tokens and send it to `target`
  /// @param target Address to receive the tokens
  /// @param mintedAmount The amount of tokens it will receive

  /* declare a function 'mintToken' and parameter 'target' of type address,
     and 'mintedAmount' of unsigned integer 256, and modifier onlyOwner */

    function(address target, uint256 mintedAmount) {
      balanceOf[target] += mintedAmount;
      totalSupply += mintedAmount;
      Transfer(0, this, mintedAmount);
      Transfer(this, target, mintedAmount);
    }

  /// @notice `freeze? Prevent | Allow` `target` from sending and receiving tokens
  /// @param target Address to be frozen
  /// @param freeze either to freeze it or not

  /* declare a function 'freezeAccount' of parameter 'target' of type address,
     and 'freeze' of type bool, and modifier onlyOwner */

    function() {
      frozenAccount[target] = freeze;
      FrozenFunds(target, freeze);
    }
  
  /// @notice Allow users to buy tokens for `newBuyPrice` eth and sell tokens for `newSellPrice` eth
  /// @param newSellPrice The price the users can sell to the contract
  /// @param newBuyPrice The price users can buy from the contract

  /* declare a function 'setPrices' of parameter 'newSellPrice' of unsigned integer 256,
     and 'newBuyPrice' of unsigned integer 256, and modifier onlyOwner */

    function setPrices(unit256 newSellPrice, unit256 newBuyPrice) onlyOwner {
      sellPrice = newSellPrice;
      buyPrice = newBuyPrice;
    }

  /// @notice Buy tokens from contract by sending Ether

  /* declare a function of keyword buy and parameter (),
     and modifier payable */

    function() payable {
      // Calculate the amount
      uint amount = msg.value / buyPrice

      // Make the transfers
      _transfer(this, msg.sender, amount);
    }

  /// @notice Sell `amount` tokens to contract
  /// @param amount The amount of tokens to be sold

  /* declare a function of keyword sell and parameter 'amount' of unsigned integer 256 */

    function() {
      // Checks contract for enough ether
      require(this.balance >= amount * sellPrice);

      // Makes the transfers
      _transfer(msg.sender, this, amount);

      // Sends ether to the seller
      msg.sender.transfer(amount * sellPrice);
    }
  // End of contract MedCoin
}
