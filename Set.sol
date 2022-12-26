// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;  

contract Set {
    mapping(uint => bool) set;
    uint size;

    event Insert(uint);
    event Remove(uint);

    function insert(uint key) external returns (bool) {
        require(!set[key],"Already exist");
        set[key] = true;
        size++;
        emit Insert(key);
        return true;
    }

    function remove(uint key) external check(key) returns (bool) {
        delete set[key];
        size--;
        emit Remove(key);
        return true;
    }

    function len() external view returns (uint) {
        return size;
    }

    modifier check(uint key) {
        require(set[key], "Does not exist");
        _;
    } 
}
