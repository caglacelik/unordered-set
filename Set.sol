// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;  

contract Set {

    mapping(address => uint) private set;
    mapping(address => bool) private exist;
    uint private size;

    event Log(string name, address indexed addr, uint val);

    function insert(address addr, uint val) external returns(bool) {
        require(!exist[addr], "Already exist");
        set[addr] = val;
        exist[addr] = true;
        size++;
        emit Log("insert", addr, val);
        return true;
    }

    function remove(address addr) external check(addr) returns(bool) {
        delete set[addr];
        exist[addr] = false;
        size--;
        emit Log("remove", addr, set[addr]);
        return true;
    }

    function len() external view returns (uint) {
        return size;
    }

    function get(address addr) external view check(addr) returns(uint) {
        return set[addr];
    }

    modifier check(address addr) {
        require(exist[addr], "Does not exist");
        _;
    } 
}