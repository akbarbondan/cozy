part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Header
    Widget Header() {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/logo.png',
              width: 50,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Find Cozy House \nto Stay and Happy",
              style: blackTextFont.copyWith(fontSize: 24),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Stop membuang banyak waktu \npada tempat yang tidak habitable",
              style: greyTextFont.copyWith(fontSize: 16),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 50,
              width: 210,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: purpleColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(17))),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (builder) => HomePage()));
                  },
                  child: Text(
                    "Explore Now",
                    style: whiteTextFont,
                  )),
            )
          ],
        ),
      );
    }

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset("assets/img_splash.png"),
            ),
            Header()
          ],
        ),
      ),
    );
  }
}
