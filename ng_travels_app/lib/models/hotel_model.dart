class Hotel {
  String imageUrl;
  String name;
  String address;
  int price;

  Hotel({
    this.imageUrl,
    this.name,
    this.address,
    this.price,
  });
}

final List<Hotel> hotels = [
  Hotel(
    imageUrl: 'Assets/Images/hotel0.jpg',
    name: 'Hotel 0',
    address: '404 Great St',
    price: 175,
  ),
  Hotel(
    imageUrl: 'Assets/Images/hotel1.jpg',
    name: 'Hotel 1',
    address: '404 Great St',
    price: 300,
  ),
  Hotel(
    imageUrl: 'Assets/Images/hotel2.jpg',
    name: 'Hotel 2',
    address: '404 Great St',
    price: 240,
  ),
];
