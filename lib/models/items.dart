class Items{
var image;
String description;
String price;
String status;
Items({required this.image,
  required this.status,

  required this.description,
  required this.price,});
}
List <Items> item = [
  Items(image: "assets/images/istockphoto-1163729202-1024x1024.jpg",  description: "Grey scandinavian sofa in bright living room interior stock photo", price: "300 LE", status: "unfav"),
  Items(image: "assets/images/istockphoto-1168252020-1024x1024.jpg",  description: "Yellow, orange, black and brown pillows on comfortable grey scandinavian sofa in bright living room interior with abstract paintings on the wall", price: "2000 LE",status: "unfav"),
 //Items(image:" assets/images/huy-phan-HqLcI0Dyl4o-unsplash.jpg",  description: "gold snake plant in pot", price: "400 LE",status: "unfav"),
  Items(image: "assets/images/istockphoto-1180838091-1024x1024.jpg",  description: "Wooden furniture and grey scandinavian sofa with pillows in beautiful living room interior stock photo", price: "1500 LE",status: "unfav"),
  Items(image: "assets/images/jake-goossen-EaexzaHDN98-unsplash.jpg",  description: "white and brown wooden table with chairs", price: "1000 LE",status: "unfav"),
  Items(image: "assets/images/minh-pham-OtXADkUh3-I-unsplash.jpg",  description: "a living room filled with furniture and a large window", price:"4000 LE",status: "unfav"),
  Items(image: "assets/images/p2.jpeg",description:"green plant on brown wooden table", price: "700 LE",status: "unfav"),

];