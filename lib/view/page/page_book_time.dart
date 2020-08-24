part of 'page.dart';

class BookTimePage extends StatelessWidget {
  const BookTimePage({Key key}) : super(key: key);

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
            Text('Choose Time and Place',
              style: blueTitle,
            ),
            const SizedBox(height: 36,),
            Container(
              height: 48,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 7,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.only(right: 12),
                  child: XSelectedBox(
                    width: 96,
                    text: 'SUN 25'
                  ),
                ),
              ),
            ),
            const SizedBox(height: 36,),
            Container(
              height: 1000,
              child: ListView.builder(
                itemCount: 3,
                itemBuilder: (context, index) => Container(
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Paris Van Java', style: blackSubtitle,),
                      Container(
                        margin: EdgeInsets.only(top: 12),
                        height: 48,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 7,
                          itemBuilder: (context, index) => Container(
                            margin: EdgeInsets.only(right: 12),
                            child: XSelectedBox(
                              width: 96,
                              text: '19:20'
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ) 
              ),
            )
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