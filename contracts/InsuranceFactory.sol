// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./CryptoWalletInsurance.sol";
import "./CollateralProtectionInsurance.sol";

contract InsuranceFactory  {
    mapping(address => address) private  userInsuranceContracts;
    mapping(address => address) private  userCryptowalletContract;

    event CryptoWalletInsuranceCreated(address indexed user, address insuranceContract);
    event CollateralProtectionInsuranceCreated(address indexed user, address insuranceContract);

// This function serves as a fatory and creates an insurance contract for a new user. in ether
    function createCryptoWalletInsurance() external{
        require(userCryptowalletContract[msg.sender] == address(0), "User already has an insurance contract");
        address user = msg.sender;
        CryptoWalletInsurance insuranceContract = new CryptoWalletInsurance(user);
        userCryptowalletContract[msg.sender] = address(insuranceContract);

        emit CryptoWalletInsuranceCreated(msg.sender, address(insuranceContract));
    }

    function createCollateralProtectionInsurance() external {
        require(userInsuranceContracts[msg.sender] == address(0), "User already has an insurance contract");
        address user = msg.sender;
        
        CollateralProtectionInsurance insuranceContract = new CollateralProtectionInsurance(user);
        userInsuranceContracts[msg.sender] = address(insuranceContract);

        emit CollateralProtectionInsuranceCreated(msg.sender, address(insuranceContract));
    }
    function getuserInsuranceContracts() external view returns(address){
       return userInsuranceContracts[msg.sender];
    }
    function getUserCryptowalletContract() external view returns(address){
       return userCryptowalletContract[msg.sender];
    }
}
