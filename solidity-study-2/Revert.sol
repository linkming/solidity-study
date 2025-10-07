// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Revert {
    function revertString(string memory str) external pure returns (bytes memory){
        bytes memory _bytes = bytes(str);
        uint256 len = _bytes.length;
        bytes memory result = new bytes(len);
        if (len > 0){
            for (uint32 i = 0; i < len; i ++) 
            {
                result[i] = _bytes[len - i -1];
            }
        return result;
        } else {
            return _bytes;
        }
    }
}