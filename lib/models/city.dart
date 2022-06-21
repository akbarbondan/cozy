part of 'models.dart';

class City {
  final int id;
  final String img;
  final String title;
  final bool ispopularity;
  

  City(this.id, this.img, this.title, {this.ispopularity = false});
}
