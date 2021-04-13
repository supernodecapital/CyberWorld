pragma solidity ^0.5.2;


contract ERC20Basic {
  uint256 public totalSupply;
  function balanceOf(address who) public view returns (uint256);
  function transfer(address to, uint256 value) public returns (bool);
  event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is ERC20Basic {
  function allowance(address owner, address spender) public view returns (uint256);
  function transferFrom(address from, address to, uint256 value) public returns (bool);
  function approve(address spender, uint256 value) public returns (bool);
  event Approval(address indexed owner, address indexed spender, uint256 value);
}

contract ERC721 {
    function tokenOfOwnerByIndex(address owner, uint256 index) public view returns (uint256);
    function ownerOf(uint256 tokenId) public view returns (address) ;
    function approve(address to, uint256 tokenId) public ;
    function getApproved(uint256 tokenId) public view returns (address) ;
    function transferFrom(address from, address to, uint256 tokenId) public ;
    function safeTransferFrom(address from, address to, uint256 tokenId) public;
}

contract OrderERC721Token {

//   address proxyRegistryAddress;
  uint256 private _currentTokenId = 0;
  address private _sellerAddress;
  address private _erc721Address;
  address private _erc20Address;
  uint256 private _tokenPrice;
  address private _buyerAddress;
  //0: selling;1: complete
  uint256 private _orderStatus;

  constructor(address _seller, address _erc721TokenAddr, uint256 _tokenId, uint256 _price, address _erc20TokenAddr) public{
    // proxyRegistryAddress = _proxyRegistryAddress;
    _currentTokenId = _tokenId;
    _sellerAddress = _seller;
    _erc721Address = _erc721TokenAddr;
    _erc20Address = _erc20TokenAddr;
    _tokenPrice = _price;
  }


  function trade() public  {
      ERC721 erc721 = ERC721(_erc721Address);
      ERC20 erc20 = ERC20(_erc20Address);
    require(erc721.getApproved(_currentTokenId) == address(this));
    require(erc20.allowance(msg.sender,address(this)) >= _tokenPrice);
    require(erc20.transferFrom(msg.sender,_sellerAddress,_tokenPrice));
    erc721.transferFrom(_sellerAddress,msg.sender,_currentTokenId);
    _orderStatus = 1;
  }


}
