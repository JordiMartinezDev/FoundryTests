
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
}