// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity 0.6.12;

contract Utils {
    function stringToBytes32(string memory _string) internal pure returns (bytes32) {
        bytes32 result;
        assembly {
            result := mload(add(_string, 32))
        }
        return result;
    }

    function bytes32ToString(bytes32 _bytes) internal pure returns (string memory) {
        bytes memory byteArray = new bytes(32);
        for (uint256 i = 0; i < 32; i++) {
            byteArray[i] = _bytes[i];
        }

        return string(byteArray);
    }

    modifier validBytes32(bytes32 _input) {
        require(_input.length > 0, "ERR_INVALID_BYTES32");
        _;
    }

    modifier validAddress(address _input) {
        require(_input != address(0), "ERR_INVALID_ADDRESS");
        _;
    }
}
