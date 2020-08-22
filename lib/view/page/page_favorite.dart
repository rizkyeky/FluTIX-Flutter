part of 'page.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({Key key}) : super(key: key);

  final SignInBloc bloc = SignInBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopLinearProgressIndicator(
        backgroundColor: mainColor,
        valueColor:accentColor,
        stream: bloc.isLoadingStream,
      ),
      body: SingleChildScrollView(
        padding: paddingPage,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Choose your favorite genres',
              style: blueTitle,
            ),
            XGrid<String>(
              padding: EdgeInsets.only(top: 28),
              columnCount: 2,
              list: const ['Romance', 'Action', 'Adventure', 'Family', 'Horror', 'Crime', 'Comedy', 'Sci-Fi'],
              builder: (context, index, list) => Container(
                height: 60,
                width: 120,
                alignment: Alignment.center,
                child: Text(list[index], style: blueSubtitle,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: accentColor,
                    width: 3
                  )
                ),
              ),
            ),
            SizedBox(height: 36,),
            Text('Choose your favorite countries',
              style: blueTitle,
            ),
            XGrid<String>(
              padding: EdgeInsets.only(top: 36),
              columnCount: 2,
              list: const ['Romance', 'Action', 'Adventure', 'Family'],
              builder: (context, index, list) => Container(
                height: 60,
                width: 120,
                alignment: Alignment.center,
                child: Text(list[index], style: blueSubtitle,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(
                    color: accentColor,
                    width: 3
                  )
                ),
              ),
            ),
            SizedBox(height: 36,),
            FlatButton(
              onPressed: () {},
              child: Text('Finish'),
            )
          ],
        ),
      ) 
    );
  }
}