
pragma solidity ^0.8.4;

import "forge-std/Test.sol";
import "../src/Koala.sol";

contract KoalaTest is Test{

    Koala koala;

    function setUp() public{
        koala = new Koala();
    }

    function testNameIsKoala() public{
        assertEq(koala.name(), "Koala");
    }
    
    function testMintingNFTs() public{
        koala.safeMint(msg.sender);
        assertEq(koala.ownerOf(0),msg.sender);
    }

    function testPurchaseNFT() public{
        address purchaser = address(0x1);
        vm.startPrank(purchaser);
        koala.safeMint(purchaser);
        vm.stopPrank();
    }
}