// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract  MergeArray {
    // uint[] public  result;
    // function mergeArray (uint[] memory source,uint[] memory target) external returns (uint[] memory){
    //     for (uint i = 0; i < source.length; i ++) 
    //     {
    //         result.push(target[i]);
    //     }
    //     for (uint i = 0; i < target.length; i ++) 
    //     {
    //         result.push(target[i]);
    //     }
    //     return result;
    // }
    function mergeArray (uint[] memory source,uint[] memory target) external pure returns (uint[] memory){
        uint l1 = source.length;
        uint l2 = target.length;
        uint len = l1 + l2;
        uint[] memory result = new uint[](len);
        for (uint i = 0; i < len; i ++) 
        {
            if(i < l1){
                result[i] = source[i];
            }else{
                result[i] = target[i-l1];
            }
        }
        return result;
    }
// function mergeArray(uint[] calldata source, uint[] calldata target) external view returns (uint[] memory) {
//     uint[] memory result = new uint[](source.length + target.length);
//     assembly {
//         // Copy `source` (32 bytes at a time)
//         calldatacopy(add(result, 0x20), 0x64, mul(source.length, 0x20))
//         // Copy `target` (offset by source.length * 32)
//         calldatacopy(add(result, mul(source.length, 0x20)), add(0x64, mul(source.length, 0x20)), mul(target.length, 0x20))
//     }
//     return result;
// }
}