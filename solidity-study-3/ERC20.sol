// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// 合约包含以下标准 ERC20 功能：
// balanceOf：查询账户余额。
// transfer：转账。
// 使用 event 记录转账和授权操作。
// 提供 mint 函数，允许合约所有者增发代币。
// 提示：
// 使用 mapping 存储账户余额和授权信息。
// 使用 event 定义 Transfer 和 Approval 事件。
// 部署到sepolia 测试网，导入到自己的钱包

contract ERC20 {
    uint256 public totalSupply;
    mapping(address => uint256) public  balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address from, address to, uint256 value);
    event Approval(address spender, uint256 value);

    modifier OnlyOwner(address _address){
        require(_address == msg.sender);
        _;
    }
    // constructor()payable{};

    // receive() external payable { };

  
    /**
    * @dev 转账 `amount` 单位代币，从调用者账户到另一账户 `to`.
    *
    * 如果成功，返回 `true`.
    *
    * 释放 {Transfer} 事件.
    */
    function transfer(address to, uint256 amount) external returns (bool) {
        require(to != address(0), "Transfer to zero address");
        require(balanceOf[msg.sender] >= amount, "Insufficient balance");
        balanceOf[msg.sender] -= amount;
        balanceOf[to] += amount;
        emit Transfer(msg.sender, to, amount);
        return true;
    }
    // 铸币
    function mint(uint256 value) external{
        balanceOf[msg.sender] += value;
        totalSupply += value;
        emit Transfer(address(0), msg.sender, value);
    }
    /**
    * @dev 调用者账户给`spender`账户授权 `amount`数量代币。
    * 如果成功，返回 `true`.
    * 释放 {Approval} 事件.
    */
    function approve(address spender, uint256 amount) external returns (bool){
        allowance[msg.sender][spender] = amount;
        return true;
    }
    function transferFrom(address from, address to, uint256 value) external returns (bool) {
        require(balanceOf[from] >= value, "Insufficient balance");
        require(allowance[from][msg.sender] >= value, "Not approved enough");
        
        balanceOf[from] -= value;
        balanceOf[to] += value;
        allowance[from][msg.sender] -= value;
        
        emit Transfer(from, to, value);
        return true;
    }
}