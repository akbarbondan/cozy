part of 'pages.dart';

class HomePage extends StatelessWidget {
  List<City> city = [
    City(1, "assets/jakarta.png", "jakarta"),
    City(2, "assets/bandung.png", "Bandung", ispopularity: true),
    City(3, "assets/surabaya.png", "Surabaya"),
    City(3, "assets/surabaya.png", "Banten"),
    City(3, "assets/surabaya.png", "Bogor"),
    City(3, "assets/surabaya.png", "Klaten"),
    City(3, "assets/surabaya.png", "Solo", ispopularity: true)
  ];

  @override
  Widget build(BuildContext context) {
    var recommendedProfider = Provider.of<RecomendedProvider>(context);
    recommendedProfider.getRecomendet();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        height: 64,
        width: MediaQuery.of(context).size.width - 2 * 24,
        decoration: BoxDecoration(
            color: Color(0xFFF6F7F8), borderRadius: BorderRadius.circular(23)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavbar("assets/Icon_home_solid.png", true),
            BottomNavbar("assets/Icon_mail_solid.png", false),
            BottomNavbar("assets/Icon_card_solid.png", false),
            BottomNavbar("assets/Icon_love_solid.png", false)
          ],
        ),
      ),
      body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Explor Now",
                          style: blackTextFont.copyWith(fontSize: 24),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "Mencari kosan yang cozy",
                          style: greyTextFont.copyWith(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),

                  // Recomended

                  Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Text(
                      "Popular City",
                      style: blackTextFont.copyWith(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  // Items(image: "assets/jakarta.png", judul: "Jakarta")

                  Container(
                    height: 150,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: city.length,
                      itemBuilder: ((context, index) => Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: CityCard(City(city[index].id, city[index].img,
                              city[index].title,
                              ispopularity: city[index].ispopularity)))),
                    ),
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: Text(
                      "Recomended Spcae",
                      style: blackTextFont.copyWith(
                        fontSize: 16,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  FutureBuilder(
                    future: recommendedProfider.getRecomendet(),
                    builder: ((context, snapshot) {
                      if (snapshot.hasData) {
                        List<Recomended> data = snapshot.data;

                        return Column(
                          children: data.map((item) {
                            int index = 0;
                            index++;
                            return Container(
                              padding: EdgeInsets.only(
                                  bottom:
                                      data.length == data.length - 1 ? 0 : 30),
                              margin: EdgeInsets.symmetric(horizontal: 24),
                              child: RecomendedCard(item),
                            );
                          }).toList(),
                        );
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 24, bottom: 16),
                    child: Text(
                      "Tips & Guidance",
                      style: greyTextFont.copyWith(fontSize: 16),
                    ),
                  ),
                  TipCard(Tips(
                      imgUrl: "assets/tips1.png",
                      title: "City Guidline",
                      createdAt: "20 april")),
                  SizedBox(
                    height: 30,
                  ),
                  TipCard(Tips(
                      imgUrl: "assets/tips1.png",
                      title: "City Guidline",
                      createdAt: "20 april")),

                  SizedBox(
                    height: 100,
                  )
                ],
              ),
            ],
          )),
    );
  }
}
