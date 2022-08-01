//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Whitelist {
    // max number of white listed addresses allowed
    uint8 public maxWhitelistedAddresses;


    // mapping to set address whhitelisted if it is, it will be ste to true else it will be false for others
    mapping(address => bool) public whitelistedAddresses;

// to keep track of how many have been white listed
    uint8 public numAddressesWhitelisted;

// setting the max number of white listed addresses
    constructor (uint8 _maxWhitelistedAddresses) {
        maxWhitelistedAddresses =_maxWhitelistedAddresses;
    }

// add adress of sender to white list
function addAddressToWhitelist() public {
    //check if the user has been whitelisted
    require(!whitelistedAddresses[msg.sender], "sender has already been whitelisted");
  //throw error if numAddressesWhitelisted <maxwhitelistedAdresses,
  require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cant be added, limit reached");

  whitelistedAddresses[msg.sender] = true;
  numAddressesWhitelisted += 1;
}


}
