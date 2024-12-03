// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract AssetTracker {
    struct Status {
        uint256 time;
        string status;
        string owner;
        uint256 verified;
    }
    
    struct Blood {
        uint256 id;
        string uniqueid;
        string batch;
        string aadhar;
        string currentPosition;
        string blood_group;
        string expiry_date;
        uint256 verified;
        uint256 statusCount;
    }

    struct Login {
        address payable user_address;
        string email;
        string password;
        string name;
        string typeID;
        string addressUser;
        string phone;
        string location;
    }

    mapping(uint256 => Blood) public BloodStore;
    mapping(uint256 => mapping(uint256 => Status)) private BloodStatusStore;
    mapping(address => Login) public LoginStore;
    mapping(string => string) private nametoemail;
    
    uint256 public bloodCount = 0;
    uint256 public userCount = 0;

    event BloodCreate(
        uint256 id,
        string currentPosition,
        string status,
        uint256 verified
    );

    event BloodTransfer(
        uint256 id,
        string newOwner,
        uint256 verified,
        string status
    );

    function createAsset(
        string memory _uniqueid,
        string memory _batch,
        string memory _aadhar,
        string memory _currentPosition,
        string memory _blood_group,
        string memory _expiry_date,
        string memory _status
    ) public returns (uint256) {
        bloodCount++;
        BloodStore[bloodCount] = Blood(
            bloodCount,
            _uniqueid,
            _batch,
            _aadhar,
            _currentPosition,
            _blood_group,
            _expiry_date,
            0,
            1
        );
        BloodStatusStore[bloodCount][1] = Status(block.timestamp, _status, _currentPosition, 0);
        emit BloodCreate(bloodCount, _currentPosition, _status, 0);
        return bloodCount;
    }

    function getBlood(uint256 _id)
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        Blood storage blood = BloodStore[_id];
        return (
            blood.uniqueid,
            blood.batch,
            blood.aadhar,
            blood.currentPosition,
            blood.blood_group,
            blood.expiry_date
        );
    }

    function getBlood2(uint256 _id) public view returns (uint256, uint256) {
        Blood storage blood = BloodStore[_id];
        return (blood.verified, blood.statusCount);
    }

    function transferAsset(
        uint256 _id,
        string memory _oldUser,
        uint256 verified,
        string memory _status,
        string memory _newUser
    ) public returns (string memory) {
        Blood storage blood = BloodStore[_id];
        require(
            keccak256(abi.encodePacked(blood.currentPosition)) == keccak256(abi.encodePacked(_oldUser)),
            "Old user does not match current position"
        );

        // Increment statusCount and ensure it's valid
        uint256 newStatusCount = blood.statusCount + 1;
        BloodStatusStore[_id][newStatusCount] = Status(block.timestamp, _status, _newUser, verified);

        // Update the currentPosition in BloodStore
        blood.currentPosition = _newUser;
        blood.statusCount = newStatusCount;

        emit BloodTransfer(_id, _newUser, verified, _status);
        return _newUser;
    }

    function getBloodCount() public view returns (uint256) {
        return bloodCount;
    }

    function getStatus(uint256 _id, uint256 _statusCount)
        public
        view
        returns (
            uint256,
            string memory,
            string memory,
            uint256
        )
    {
        Status memory s = BloodStatusStore[_id][_statusCount];
        return (s.time, s.status, s.owner, s.verified);
    }

    function addidentity(
        string memory _name,
        address payable user_address,
        string memory _email,
        string memory _password,
        string memory _typeID,
        string memory _address,
        string memory _phone,
        string memory _location
    ) public {
        userCount++;
        nametoemail[_name] = _email;
        LoginStore[user_address] = Login(
            user_address,
            _email,
            _password,
            _name,
            _typeID,
            _address,
            _phone,
            _location
        );
    }
    
    function getemail(string memory _name) public view returns (string memory) {
        return nametoemail[_name];
    }

    function getLogin(
        address payable _add,
        string memory _email,
        string memory _password
    )
        public
        view
        returns (
            string memory,
            string memory,
            string memory,
            string memory,
            string memory
        )
    {
        Login storage login = LoginStore[_add];
        require(
            keccak256(abi.encodePacked(login.email)) == keccak256(abi.encodePacked(_email)),
            "Email does not match"
        );
        require(
            keccak256(abi.encodePacked(login.password)) == keccak256(abi.encodePacked(_password)),
            "Password does not match"
        );
        return (
            login.name,
            login.typeID,
            login.addressUser,
            login.phone,
            login.location
        );
    }

    function getUserCount() public view returns (uint256) {
        return userCount;
    }
}
