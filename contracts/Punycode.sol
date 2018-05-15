pragma solidity ^0.4.23;

import "./PunycodeInterface.sol"

contract Punycode is PunycodeInterface {

    uint32 constant public BASE = 32;
    uint32 constant public DAMP = 700;
    uint32 constant public INITIAL_BIAS = 72;
    uint32 constant public INITIAL_N = 128;
    uint32 constant public SKEW = 38;
    uint32 constant public T_MAX = 26;
    uint32 constant public T_MIN = 1;

    function encode(string str) external view returns (string) {
        return str;
    }

    function decode(string str) external view returns (string) {
        return str;
    }

    function isASCII(string str) internal pure returns (bool) {

        // ensure all runes < 0x80

        return false;
    }
}
