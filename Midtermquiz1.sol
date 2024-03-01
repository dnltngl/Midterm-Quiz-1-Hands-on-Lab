// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

contract MQuizContract {
    address public owner;
    uint256 public age;
    uint256 public hoursWorked;
    uint256 public hourlyRate;
    uint256 public totalSalary;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }

    modifier validHourlyRate(uint256 rate) {
        require(rate > 0, "Hourly rate must be greater than zero");
        _;
    }

    modifier validHoursWorked(uint256 hours) {
        require(hours > 0, "Hours worked must be greater than zero");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function setAge(uint256 _age) external onlyOwner {
        age = _age;
    }

    function setHrsWrk(uint256 _hoursWorked) external onlyOwner validHoursWorked(_hoursWorked) {
        hoursWorked = _hoursWorked;
    }

    function setRate(uint256 _hourlyRate) external onlyOwner validHourlyRate(_hourlyRate) {
        hourlyRate = _hourlyRate;
    }

    function calculateTotalSal() external onlyOwner {
        require(hourlyRate > 0 && hoursWorked > 0, "Hourly rate and hours worked must be greater than zero");
        totalSalary = hourlyRate * hoursWorked;
    }
}

