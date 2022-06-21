part of 'widgets.dart';

class Facility extends StatelessWidget {
  String imgUrl;
  String title;
  int total;

  Facility({this.imgUrl, this.title, this.total});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          imgUrl,
          width: 32,
        ),
        SizedBox(
          height: 8,
        ),
        Text.rich(TextSpan(
            text: "$total ",
            style: purpleTextFont.copyWith(
                fontSize: 14, fontWeight: FontWeight.w500),
            children: [
              TextSpan(
                  text: "$title", style: greyTextFont.copyWith(fontSize: 14))
            ]))
      ],
    );
  }
}
