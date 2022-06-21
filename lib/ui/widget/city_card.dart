part of 'widgets.dart';

class CityCard extends StatelessWidget {
  City city;

  CityCard(this.city);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(18),
      child: Container(
        width: 120,
        height: 150,
        child: Column(children: [
          Stack(
            children: [
              Image.asset(
                city.img,
                width: 120,
                height: 102,
                fit: BoxFit.cover,
              ),
              city.ispopularity
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Container(
                          height: 30,
                          width: 50,
                          decoration: BoxDecoration(
                              color: purpleColor,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(100))),
                          child: Image.asset(
                            "assets/Icon_star_solid.png",
                            width: 22,
                            height: 22,
                          )),
                    )
                  : SizedBox()
            ],
          ),
          SizedBox(
            height: 11,
          ),
          Text(
            city.title,
            style: blackTextFont.copyWith(fontSize: 16),
          ),
        ]),
      ),
    );
  }
}
