part of 'widgets.dart';

class TipCard extends StatelessWidget {
  final Tips tips;
  TipCard(this.tips);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Container(
            height: 80,
            width: 80,
            child: Image.asset(tips.imgUrl),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                tips.title,
                style: blackTextFont.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text(
                "Update ${tips.createdAt}",
                style: greyTextFont.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w300),
              )
            ],
          ),
          Spacer(),
          Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: greyColor,
          )
        ],
      ),
    );
  }
}
