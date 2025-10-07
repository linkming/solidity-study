// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract leecode {
    // 反转字符串 (Reverse String)
    // 题目描述：反转一个字符串。输入 "abcde",输出 "edcba"
    function reverseString(string memory str) public pure returns (string memory) {
        bytes memory strBytes = bytes(str);
        bytes memory result = new bytes(strBytes.length);

        // 从后往前复制
        for (uint i = 0; i < strBytes.length; i++) {
            result[i] = strBytes[strBytes.length - 1 - i];
        }

        return string(result);
    }
    //用 solidity 实现整数转罗马数字
    // function romanToInt(uint num) external pure returns(uint result){
    //     string[] keys = ["I", "V", "X", "L","C","D","M"];
    //     unit[] values = [1,5,10,50,100,500,1000];
    //     for (uint i = 0; i < values.length; i ++) 
    //     {
    //        uint n = num % values[i];
    //        bytes = generateBytes(n, keys[i])

    //     };

    // }
     // 主函数：将罗马数字字符串转为整数
    function romanToInt(string memory roman) public pure returns (uint256) {
        bytes memory r = bytes(roman);
        uint256 result = 0;

        for (uint256 i = 0; i < r.length; i++) {
            uint256 current = charToValue(r[i]);

            // 如果不是最后一个字符，且当前值小于下一个值，则减去当前值
            if (i + 1 < r.length) {
                uint256 next = charToValue(r[i + 1]);
                if (current < next) {
                    result -= current;
                } else {
                    result += current;
                }
            } else {
                result += current;
            }
        }

        return result;
    }

    // 辅助函数：将单个罗马字符转为数值
    function charToValue(bytes1 c) internal pure returns (uint256) {
        if (c == 'I') return 1;
        if (c == 'V') return 5;
        if (c == 'X') return 10;
        if (c == 'L') return 50;
        if (c == 'C') return 100;
        if (c == 'D') return 500;
        if (c == 'M') return 1000;
        return 0; // 无效字符
    }
    function generateBytes(uint n, string memory k) external pure returns (bytes memory){
        bytes memory _str = bytes(k);
        require(_str.length > 0, "invalid string length");
        bytes1 firstByte = _str[0];
        bytes memory result = new bytes(n);
        for (uint i = 0; i < n; i ++) {
            result[i] = firstByte;
        }
        return result;
    }
    // function toByte(string memory str) external view returns ()
}