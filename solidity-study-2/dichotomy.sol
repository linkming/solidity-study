// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Dichotomy {
    
    function search (int[] memory arr, int target) external pure returns (int){
        uint left = 0;
        uint right = arr.length -1;
         while (left <= right) {
            uint middle = (left + right) / 2;
            if (target < arr[middle]) {
                right = middle - 1;
            } else if (target > arr[middle]) {
                left = middle + 1;
            } else {
                return int(middle);
            }
        }
        return -1;
    }
}