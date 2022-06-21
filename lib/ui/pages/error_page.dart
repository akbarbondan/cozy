part of 'pages.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/404.png",
              width: MediaQuery.of(context).size.width - 2 * 24,
            ),
            SizedBox(
              height: 70,
            ),
            Text(
              "Where are you going",
              style: blackTextFont.copyWith(
                  fontSize: 24, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 14,
            ),
            Text(
                "seems like the page that you were \nreqwested is already gone",
                textAlign: TextAlign.center,
                style: greyTextFont.copyWith(
                    fontSize: 16, fontWeight: FontWeight.w300)),
            SizedBox(
              height: 50,
            ),
            Container(
              height: 50,
              width: 210,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(17)),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(17)),
                  color: purpleColor,
                  child: Text(
                    "Back to home",
                    style: whiteTextFont,
                  ),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  }),
            )
          ],
        ),
      ),
    );
  }
}
