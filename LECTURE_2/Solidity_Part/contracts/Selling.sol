pragma solidity >0.4.99 <0.6.0;


contract Selling {

	address public seller;

	mapping(address => bool) public buyer;

	uint256 public sellCount;

	uint256 public price;

	string public productName;

	bool public contractActive;

	event Sold(
		address _buyer);

	constructor(address _seller, uint256 _price, string memory _productName) public {
		seller = _seller;
		price = _price;
		productName = _productName;
		contractActive = true;
	}

	function buyItems() public payable {
		// pay firstPartAmount
		// record the buyer
		require(contractActive);
		require(msg.value == price);
		buyer[msg.sender] = true;
		sellCount = sellCount + 1;
		emit Sold(msg.sender);
	}

}