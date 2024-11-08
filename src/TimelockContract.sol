//SPDX-License-Identifier: MIT
pragma solidity 0.8.28;

import {TimelockController} from "../lib/openzeppelin-contracts/contracts/governance/TimelockController.sol";

contract TimeLockContract is TimelockController{

    constructor(uint256 minDelay, address[] memory proposers, address[] memory executors)
    TimelockController(minDelay, proposers, executors, msg.sender)
    {}



}