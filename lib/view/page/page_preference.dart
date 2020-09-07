part of 'page.dart';

class PreferencePage extends Page<PreferenceBloc> {
  PreferencePage({Key key}) : super(key: key);

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
              padding: const EdgeInsets.only(top: 36),
              columnCount: 2,
              list: bloc.genres,
              builder: (context, index, list) => XSelectedBox(
                text: list[index],
                selectedColorBorder: mainColor,
                onSelected: (isSelected) {
                  if (isSelected) {
                    bloc.selectGenres(bloc.genres[index]);
                  } else {
                    bloc.selectGenres(bloc.genres[index]);
                  }
                },
              )
            ),
            const SizedBox(height: 36,),
            Text('Choose your favorite countries',
              style: blueTitle,
            ),
            XGrid<String>(
              padding: const EdgeInsets.only(top: 36),
              columnCount: 2,
              list: bloc.countries,
              builder: (context, index, list) => XSelectedBox(
                text: list[index],
                selectedColorBorder: mainColor,
                onSelected: (isSelected) {
                  if (isSelected) {
                    bloc.selectCountries(bloc.countries[index]);
                  } else {
                    bloc.selectCountries(bloc.countries[index]);
                  }
                },
              ),
            ),
            const SizedBox(height: 48,),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        highlightElevation: 0,
        backgroundColor: mainColor,
        onPressed: () {
          bloc.setUserPreference();
          Navigator.pushReplacementNamed(context, '/home');
        },
        child: const Icon(Icons.arrow_forward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void init() {
    // TODO: implement init
  }
}