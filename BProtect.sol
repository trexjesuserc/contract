// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.2.0/access/Ownable.sol";

contract BProtect is Ownable {
    uint256 public antiTime = 10 minutes;

    uint256 public lastAntiTime = 0;

    constructor(){}

    /* Anti Bots zone */
    function start(bool isPair) external {
        if (lastAntiTime == 0) {
            if(isPair) {
                startAntiBots();
            }
        }
    }

    function startAntiBots() internal {
        lastAntiTime = block.timestamp;
    }

    function checkBot(uint256 _totalFee) external view returns (uint256) {
        uint256 totalFee = _totalFee;

        if(block.timestamp < (lastAntiTime + antiTime)) {
            totalFee = 9000;
        }
        return totalFee;
    }

    function setAntiTime(uint256 _time) external onlyOwner {
        antiTime = _time;
    }

    function setlastAntiTime(uint256 _time) external onlyOwner {
        lastAntiTime = _time;
    }
}
