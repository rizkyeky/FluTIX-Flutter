part of 'page.dart';

class BookSeatPage extends StatelessWidget {
  const BookSeatPage({Key key}) : super(key: key);

  // final SignInBloc bloc = SignInBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopLinearProgressIndicator(
        backgroundColor: mainColor,
        valueColor:accentColor,
        ),
      body: SingleChildScrollView(
        padding: paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Choose Seat',
              style: blueTitle,
            ),
            const SizedBox(height: 24,),
            Center(
              child: Container(
                alignment: Alignment.center,
                height: 24,
                width: 240,
                decoration: BoxDecoration(
                  border: Border.all(color: accentColor, width: 3),
                  borderRadius: BorderRadius.circular(6)
                ),
              ),
            ),
            const SizedBox(height: 24,),
            Container(
              height: 420,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) => Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    for (int i = 0; i < 10; i++)
                      Container(
                        margin: const EdgeInsets.only(right: 6),
                        child: const XSelectedBox(height: 36, width: 36, text: 'A0')
                      )
                  ],
                )   
              ),
            ),
            const SizedBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: borderColor, width: 3),
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                    ),
                    Text('  Available', style: blackContentRegular),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: mainColor, width: 3),
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                    ),
                    Text('  Booked', style: blackContentRegular),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          border: Border.all(color: accentColor, width: 3),
                          borderRadius: BorderRadius.circular(6)
                        ),
                      ),
                    ),
                    Text('  Selected', style: blackContentRegular),
                  ],
                )
              ]
            ),
            const SizedBox(height: 42,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: mainColor,
        onPressed: () {},
        child: const Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}