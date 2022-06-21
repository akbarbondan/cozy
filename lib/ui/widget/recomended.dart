part of 'widgets.dart';

class RecomendedCard extends StatelessWidget {
  final Recomended recomended;
  RecomendedCard(this.recomended);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Detailpage(recomended)));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(18),
            child: Container(
              height: 110,
              width: 130,
              child: Stack(
                children: [
                  Image.network(
                    recomended.imageUrl,
                    height: 110,
                    width: 130,
                    fit: BoxFit.cover,
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          color: purpleColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(18))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/Icon_star_solid.png",
                            height: 18,
                            width: 18,
                          ),
                          Text(
                            "${recomended.rating}/5",
                            style: whiteTextFont,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                recomended.name,
                style: blackTextFont.copyWith(
                    fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Text.rich(TextSpan(
                  text: '\$${recomended.price}',
                  style: purpleTextFont.copyWith(
                      fontSize: 16, fontWeight: FontWeight.w500),
                  children: [
                    TextSpan(
                        text: ' / Mont',
                        style: greyTextFont.copyWith(
                            fontWeight: FontWeight.w300, fontSize: 16))
                  ])),
              SizedBox(
                height: 16,
              ),
              Text(
                "${recomended.citys}, ${recomended.country}",
                style: greyTextFont.copyWith(
                    fontSize: 14, fontWeight: FontWeight.w300),
              )
            ],
          )
        ],
      ),
    );
  }
}
