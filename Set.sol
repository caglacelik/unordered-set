// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;  

contract Set {

    mapping(address => uint) internal balances;

    function insert(address addr, uint bal) external returns (bool) {
        require(balances[addr] == 0,"Address already exist");
        balances[addr] = bal;
        return true;
    }

    function remove(address addr) external check(addr) returns (bool) {
        delete balances[addr];
        return true;
    }

    function get(address addr) external view check(addr) returns (uint) {
        return balances[addr];
    }

    modifier check(address addr) {
        require(balances[addr] != 0, "Balance does not exist");
        _;
    } 
}