part of 'models.dart';

class Recomended {
  int id;
  String imageUrl;
  String name;
  int price;
  String country;
  String citys;
  int rating;
  String addres;
  String phone;
  String mapurl;
  List photos;
  int numberkitchen;
  int numberbedroms;
  int numbercupboards;

  Recomended(
      {this.id,
      this.imageUrl,
      this.name,
      this.price,
      this.country,
      this.citys,
      this.rating,
      this.addres,
      this.phone,
      this.mapurl,
      this.numberbedroms,
      this.numbercupboards,
      this.numberkitchen,
      this.photos});

  Recomended.fromJson(data) {
    id = data['id'];
    name = data["name"];
    citys = data["city"];
    country = data["country"];
    price = data["price"];
    imageUrl = data["image_url"];
    rating = data["rating"];
    addres = data["address"];
    phone = data["phone"];
    mapurl = data["map_url"];
    photos = data["photos"];
    numberkitchen = data["number_of_kitchens"];
    numbercupboards = data['number_of_cupboards'];
    numberbedroms = data['number_of_bedrooms'];
  }
}
