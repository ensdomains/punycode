pragma solidity ^0.4.23;

interface PunycodeInterface {

    function encode(string str) external view returns (string);
    function decode(string str) external view returns (string);

}
