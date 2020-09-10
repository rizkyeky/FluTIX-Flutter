part of 'page.dart';

class SuccessCheckoutPage extends StatelessWidget {
  const SuccessCheckoutPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              alignment: Alignment.center,
              height: 200,
              child: const Icon(Icons.check_circle, color: mainColor, size: 54,),
            ),
            Text('Checkout Success', style: blueTitle),
            Text("Enjoy your movie and\ndon't forget to bring your popcorns", 
              style: blackSubtitle, textAlign: TextAlign.center
            ),
            Container(
              alignment: Alignment.center,
              height: 100,
              child: FlatButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context, 
                    MaterialPageRoute(builder: (context) => HomePage()),
                    (route) => false
                  );
                }, 
                child: Text('Back to home', style: blueSubtitle),
              ),
            ),
          ],
        ),
      ),
    );
  }
}