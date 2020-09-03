part of 'page.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: TopLinearProgressIndicator(
      //   backgroundColor: mainColor,
      //   valueColor:accentColor,
      //   stream: bloc.isLoadingStream,
      // ),
      body: SingleChildScrollView(
        padding: paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Choose your favorite genres',
              style: blueTitle,
            ),
            XGrid<String>(
              padding: const EdgeInsets.only(top: 36),
              columnCount: 2,
              list: const ['Romance', 'Action', 'Adventure', 'Family', 'Horror', 'Crime', 'Comedy', 'Sci-Fi'],
              builder: (context, index, list) => XSelectedBox(text: list[index])
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