pragma solidity ^0.4.0;

/// @title ETH Counter = Ethcounter

// Establish an instance ( class ) of the "Smart Contract" object
// Note. Name the class Counter

contract Counter {
	// Declare a variable named `count` of type *unregistered positive integer of potential size 2 ^256* where `uint` is an alias for the type `uint 256`
	uint count;

	// Inside the *Counter contract* place the *Solidity constructor* function.
	// Note. The *Solidity constructor* function uses the same name as the contract

	function Counter() {
		// Assign the variable `count` to the value of one (1) ( Note. Saving the value of an instance variable across the many nodes of the Ethereum network takes "gas" )
		count = 1;
	}

	function increment () {
		// Re-assign the variable `count` to the value of the current `count` plus one (1)
		// Note. Because this change of state must be confirmed by the Ethereum network, a charge of "gas" will apply
		count = count +1;
	}
		
	function get () constant returns (uint) {
		// The get() function is a constant function that returns the current value of the variable `count`.
		// Note. A *constant* function is a function that does not *change the state of the program*.
		// Note. Because we have a copy of the entire Ethereum blockchain on our local machine, we can execute the get() function without "gas" overhead.
		// Note. And, because all nodes of the Ethereum network also have a copy, there is no "gas" fee to simply read ( get ) a value returned.
		// Note. The get() function returns an *unregistered positive integer of potential size 2 ^256* where `uint` is an alias for the type `uint 256`

		return count;
	}
}
