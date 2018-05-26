pragma solidity ^0.4.23;

import "./PunycodeInterface.sol";
import "./Libraries/Strings.sol";

contract Punycode is PunycodeInterface {

    using strings for string;

    uint32 constant public BASE = 32;
    uint32 constant public DAMP = 700;
    uint32 constant public INITIAL_BIAS = 72;
    uint32 constant public INITIAL_N = 128;
    uint32 constant public SKEW = 38;
    uint32 constant public T_MAX = 26;
    uint32 constant public T_MIN = 1;
    string constant public ACE_PREFIX = "xn--";
    byte constant public RUNE_SELF = 0x80; //

    function encode(string str) external view returns (string) {
        if (isASCII(str)) {
            return str;
        }

        strings.slice memory s = str.toSlice();
        strings.slice memory delimiter = ".".toSlice();

        strings.slice[] parts = new strings.slice[](s.count(delimiter));
        for (uint i = 0; i < parts.length; i++) {

            strings.slice memory slice = s.split(delimiter);
            if (isASCII(slice.toString())) {
                continue;
            }

            // @todo encode
            parts[i] = slice;
        }

        return (".".toSlice()).join(parts);
    }

    function decode(string str) external view returns (string) {
        return str;
    }

    // @todo check if we really need this
    function isASCII(string str) internal pure returns (bool) {
        bytes runes = stringToBytes(str);

        uint256 length = runes.length;
        for (uint i = 0; i < length; i++) {
            if (runes[i] >= RUNE_SELF) {
                return false;
            }
        }

        return true;
    }

    function stringToBytes(string memory source) private pure returns (bytes result) {
        bytes memory str = bytes(source);
        if (str.length == 0) {
            return 0x0;
        }

        assembly {
            result := mload(add(source, 32))
        }
    }
}
