---
title: Chain Evolution
layout: default
excerpt: Any type of computation may be performed within a Turing complete virtual machine ...
hint: A Turing complete computer language that creates multiple Turing complete virtual machines cannot be looped to infinity.
repo: Medcoin-Crypto-Currency-Project
ver_date: 11-24-19
navigation_weight: 8
categories: page
---
{% include toc-medcoin-tangerine-copper.md %}

## First Subtitle

> **Hint**. {{ page.hint }}

More to come ...

{% include two-coins.md %}

## Medcoin Tangerine

More to come ...

## Fuel Limit

Why not program in a speed limit in the form of fuel that ensures no computation may be able to continue to run that loops continuously and, therefore, brings the evolution of the other nodes in the chain to a halt.

If the computational program, malicious or not, attempts to compute beyond the **Fuel Limit** set in the conditions of the program, the program will stop.

Fuel can be set at the rate of a coin consumed over the normal course of computation.

For example, from the initial Unix time stamp that starts the engine of the computational program running, an "x" number of additional microseconds may continue to consume the single coin at the rate of "y" increments of coin per microsecond.

Therefore, a hundred (100) microseconds of "fuel" may correspond to a hundred (100) 1/100ths of a coin.

Deposit one (1) coin, get a hundred (100) microseconds of computational time.

Write a program that can be run on a **Turing** complete virtual machine in less than a hundred (100) microseconds and you will have plenty of "fuel" left to complete the task.

Slip an infinite loop into the program, maliciously or not, and your program shuts down, not the chain.

## Smart Contracts

Unlike bitcoin, Etherific smart contracts may be written programmatically using the Ethereum protocol.

Several component smart contracts may then be executed in succession by a **Turing** complete virtual machine.

Need to write a script that encompasses all of the elements of an algorithm?

Use smart contract components to express the result.

## Ordering the Block

Nodes competing for computational time may assemble a group of transactions as seen fit for the upcoming block.

For example, transactions may be assembled by originating Unix time stamp.

Next, the transactions are executed, smart contracts and all, by the node ( Miner ).

Finally, the state of the chain is altered by the inclusion and locking of the new finished block to the immediately preceeding valid block.

Validity of the new block is then achieved by a consensus check of the finished block by all nodes.

## Slow Nodes

In Ethereum, the work of slow nodes, those nodes in bitcoin that would loose their shot at the coin simply because a more powerful node out-muscled their effort, are not discarded and excluded from the chain.

Rather, using a derivation of a protocol called "Ghost", the programmers of the Ethereum platform incentivize slower nodes to finish their work, even if a quicker computation has been achieved by a competing node ( Miner ) for the same block of transactions.

The result is a faster confirmation of transactions ( than bitcoin ).

A non-prioritized, non-incentivized transaction may take days or weeks, if ever to complete under the bitcoin platform.

Not so under the Ethereum regime.

All nodes compute, all nodes contribute.

The result is a dramatic increase in speed of confirmation from approximately 600 seconds for bitcoin, to approximately 5 seconds for Ethereum.

Quite the improvement, don't you think?

## Reuse Those Engines

Elon Musk at Space X pioneered the idea of reusable rocket stages.

Some computing wizard figures out an excellent algorithm and coverts the steps into components of smart contracts.

Why give that a toss?

Wouldn't it be better to unbury the component from the transaction and give the smart contract its own address on the block chain?

This way, all users of the Ethereum platform may call that method out of hybernation, send it some fresh variables, and get a result in return that can then be used in the execution of a new and different transaction.

Pretty keen, heh?

So, when fishing for a solution to execute a certain component of your algorithm ...

Look no further than the block chain.

You just may find what you are looking for under its own separate address!

## Data Trees

The hash of the root node of a data tree is embedded in each original block that utilizes a data set.

Calling for a subset of that data, rather than the whole, increases computational efficiency and drag on the chain.

Manipulating a branch of the data tree does not alter the hashes of its siblings, unless an attempt is made by a node to write an alternative record to the data set which is verboten!

Why? Because a change to one leaf of data in the data set will alter the computation away from the true root hash result stored in the block.

All nodes would perk up to that!

Hence, the Ethereum way of securing data without drawing down the entire tree from its storage ...

Is to store the root hash of the data tree in the original forged block, separately from the data tree.

And, simultaneously assign the entire corpus of the data tree to a separate address off the block chain.

## Solidity

Ready to write an Ethereum smart contract?

You will have to learn **Solidity**, a language written above the EVM ( Ethereum Virtual Machine ) that abstracts the low level concepts of the Ethereum protocol.

The Ethereum programmer then runs the Solidity language symbols back through a compiler to translate the instructions back into EVM machine language prior to transmission of the program to a mining node.

The mining node then addresses the program ( smart contract ) which becomes part of a block of reconciled transactions and affixed to the last block in the chain regular way.

Let's say you already own a record embedded in a block.

Once upon a time that record was a transaction that became assembled by a mining node and added to the block chain.

As the underlying contract and its elements are immutable once the block is forged, how does one add additional post contract data to the record in the chain?

**Answer**. Set a new address pointer to the original record and create a new transaction replete with your new data set ie.) an email address, for example.

After inclusion in the next available block of transactions, the other nodes will see the relationship between the original record, and the new record housing the email address.

Pretty flexible, heh?

"Oh, honey ... I forgot to turn off the stove!"

In Ethereum, turn the stove off separately and establish a pointer to the new address, from the original record, under separate transaction.

## Gas Mutations

Ether is the coin that fuels transactional mutations of the immutable Ethereum block chain.

As long as the transaction is placed within a block of transactions and forged by the mining node, the eventual new block gets added to the previous valid block in the chain, and the chain remains immutable.

The cost of computation varies with the complexity of the smart contract components written in the underlying program when run on a **Turing** complete virtual machine.

Estimate the time required to execute the program to completion, capture the number or fraction of a coin required to compute over the resultant "x" microseconds, and the mining node assigned to the block housing your transaction will complete the functions of both running your program and its attendant smart contract(s), as well as adding the finished block to the chain.

For this "service", the mining node receives the Ether.

From this source of revenue, the mining node covers its costs, and turns a profit on a daily basis, after calculating the depreciation of its machinery and its 24/7 consumption of electricity.

## Last Subtitle

More to come ...

***

**Note**. The above synopsis was derived from an article written by Charles Jensen [[1](#CHARLESJENSEN){:.red}].

1. {:#CHARLESJENSEN}[Blockchain Ultimate Guide by Charles Jensen](https://www.amazon.com/){:title="Click to Visit the Blockchain Ultimate Guide by Charles Jensen at Amazon"}{:target="_blank"). Self-published by © 2017 [Charles Jensen](https://www.amazon.com/){:title="Click to Visit the Blockchain Ultimate Guide by Charles Jensen at Amazon"}{:target="_blank"}.

***

{% include patreon-link.md %}
