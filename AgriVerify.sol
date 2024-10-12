// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/Ownable.sol";

contract AgriVerify is Ownable {
    struct Crop {
        string name;
        address farmer;
        bool isCertified;
    }

    mapping(uint => Crop) public crops;
    uint public cropCount;

    event CropCertified(uint cropId, address farmer, string name);

    constructor() Ownable(msg.sender){
        // The owner is automatically set to the address that deploys the contract
    }

    function certifyCrop(string memory _name) public {
        cropCount++;
        crops[cropCount] = Crop(_name, msg.sender, true);
        emit CropCertified(cropCount, msg.sender, _name);
    }

    function getCrop(uint _cropId) public view returns (string memory, address, bool) {
        Crop memory crop = crops[_cropId];
        return (crop.name, crop.farmer, crop.isCertified);
    }
}
