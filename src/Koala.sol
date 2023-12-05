// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Koala is ERC721, Ownable {

    
    
    uint256 private _nextTokenId;
    uint256 tokenCounter;

    constructor()
        ERC721("Koala", "KLA")
        Ownable(msg.sender)
    {}

    function _baseURI() internal pure override returns (string memory) {
        return "https://ethereum-blockchain-developer.com/2022-06-nft-truffle-hardhat-foundry/nftdata/";
    }

    function safeMint(address to) public onlyOwner {
        
        uint256 tokenId = tokenCounter;
        tokenCounter++;
        _safeMint(to,tokenId);
    }

    function buyToken() public payable{

        uint256 tokenId = tokenCounter;
        require(msg.value == tokenId * 0.1 ether, "Funds sent are incorrect");
        tokenCounter++;
        _safeMint(msg.sender,tokenId);
    }
    // The following functions are overrides required by Solidity.


    function tokenURI(uint256 tokenId)
        pure
        public
        
        override(ERC721)
        returns (string memory)
    {
        return string(abi.encodePacked(_baseURI(),"spacebear_",(tokenId+1),".json"));
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}