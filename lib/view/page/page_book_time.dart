part of 'page.dart';

class BookTimePage extends StatelessWidget {
  const BookTimePage({Key key}) : super(key: key);

  // final SignInBloc bloc = SignInBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Choose the date',
              style: blueTitle,
            ),
            const SizedBox(height: 36,),
            Container(
              // color: Colors.amber,
              height: 60,
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
            Text('Choose your favorite countries',
              style: blueTitle,
            ),
            XGrid<String>(
              padding: const EdgeInsets.only(top: 36),
              columnCount: 2,
              list: const ['Indonesia', 'Western', 'Korea', 'Japan'],
              builder: (context, index, list) => XSelectedBox(text: list[index]),
            ),
            const SizedBox(height: 48,),
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