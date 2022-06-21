part of 'pages.dart';

class Detailpage extends StatefulWidget {
  final Recomended recomended;
  Detailpage(this.recomended);

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  bool isActife = false;
  @override
  Widget build(BuildContext context) {
    starUrlLauncher(String url) async {
      var uri = Uri.tryParse(url);
      if (await canLaunchUrl(uri)) {
        launch(url);
      } else {
        ErrorPage();
      }
    }

    showDialogTlp() {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text("Hubungi pemilik kos ? "),
                actions: [
                  RaisedButton(
                    color: Colors.green,
                    onPressed: () {
                      starUrlLauncher("tel:+${widget.recomended.phone}");
                    },
                    child: Text("Ya"),
                  ),
                  RaisedButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Tidak",
                      style: whiteTextFont,
                    ),
                  )
                ],
              ));
    }

    print(widget.recomended.phone);
    return Scaffold(
      body: SafeArea(
          right: false,
          left: false,
          bottom: false,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 370,
                child: Image.network(
                  widget.recomended.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 328),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                        color: Colors.white),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(24, 30, 24, 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(widget.recomended.name,
                                      style: blackTextFont.copyWith(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Text.rich(
                                    TextSpan(
                                        text: "\$${widget.recomended.price}",
                                        style: purpleTextFont.copyWith(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                        children: [
                                          TextSpan(
                                            text: "/ Mount",
                                            style: greyTextFont,
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                              Row(
                                  children: [1, 2, 3, 4, 5]
                                      .map((e) => Rating(
                                            index: e,
                                            rate: widget.recomended.rating,
                                          ))
                                      .toList())
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            children: [
                              Column(
                                children: [],
                              )
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 24, bottom: 12),
                            child: Text(
                              "Main Facilities",
                              style: blackTextFont.copyWith(fontSize: 16),
                            )),
                        Container(
                          height: 88,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Facility(
                                imgUrl: "assets/kitchen.png",
                                title: "Kitchen",
                                total: widget.recomended.numberkitchen,
                              ),
                              Facility(
                                imgUrl: "assets/bedroom.png",
                                title: "Bedroom",
                                total: widget.recomended.numberbedroms,
                              ),
                              Facility(
                                imgUrl: "assets/lemari.png",
                                title: "Big Lemari",
                                total: widget.recomended.numbercupboards,
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 24),
                          child: Text(
                            "Photos",
                            style: blackTextFont.copyWith(fontSize: 16),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 12, bottom: 30),
                          height: 88,
                          child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: widget.recomended.photos.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: EdgeInsets.only(
                                      left: index == 0 ? 24 : 0,
                                      right: index == index.bitLength - 1
                                          ? 0
                                          : 30),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8),
                                    child: Image.network(
                                      widget.recomended.photos[index],
                                      width: 110,
                                      height: 88,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24, bottom: 6),
                          child: Text(
                            "Location",
                            style: blackTextFont.copyWith(
                                fontSize: 16, fontWeight: FontWeight.w300),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(widget.recomended.addres,
                                  style: greyTextFont.copyWith(fontSize: 14)),
                              InkWell(
                                onTap: () {
                                  starUrlLauncher(widget.recomended.mapurl);
                                },
                                child: Image.asset(
                                  "assets/btn_location.png",
                                  width: 40,
                                ),
                              )
                            ],
                          ),
                        ),
                        Center(
                          child: Container(
                            margin: EdgeInsets.only(top: 30),
                            height: 50,
                            width: MediaQuery.of(context).size.width - 2 * 24,
                            decoration: BoxDecoration(),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(17)),
                                    primary: purpleColor),
                                onPressed: () {
                                  showDialogTlp();
                                },
                                child: Text(
                                  "Book Now",
                                  style: whiteTextFont.copyWith(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                )),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 30, 24, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: purpleColor,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          isActife = !isActife;
                        });
                      },
                      child: Image.asset(
                        isActife
                            ? "assets/btn_wishlist_active.png"
                            : "assets/btn_wishlist.png",
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
