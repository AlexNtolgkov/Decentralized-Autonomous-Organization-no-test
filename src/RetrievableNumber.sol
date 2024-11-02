pragma solidity 0.8.28;

import {Ownable} from "../lib/openzeppelin-contracts/contracts/access/Ownable.sol";
contract RetrievableNumber{
uint256 private s_number;	


event NumberChanged(uint256 number);


function store (uint256 newNumber) public OnlyOwner {
s_number = newNumber;
emit NumberChanged(newNumber);
}


function retrieveNumner() external view returns(uint256){
return s_number};
}