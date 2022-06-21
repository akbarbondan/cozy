part of 'widgets.dart';

class Rating extends StatelessWidget {
  int index;
  int rate;
  Rating({this.index, this.rate});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      (index <= rate)
          ? "assets/Icon_star_solid.png"
          : "assets/Icon_star_solid_grey.png",
      width: 20,
    );
  }
}
