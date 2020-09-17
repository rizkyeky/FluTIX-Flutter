part of 'page.dart';

class MainTabBarPage extends Page<MainTabBarBloc> {

  final HomePage homePage = HomePage();
  final ProfilePage profilePage = ProfilePage();
  final SearchPage searchPage = SearchPage();

  MainTabBarPage({Key key}) : super(key: key);

  @override
  void init() {
  }

  @override
  void dispose() {
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<SwitchTab>(
          stream: bloc.tabStream,
          builder: (context, snap) {
            switch (snap.data) {
              case SwitchTab.home: 
                return homePage;
                break;
              case SwitchTab.search: 
                return searchPage;
                break;
              case SwitchTab.favorite: 
                return const Center(child: Icon(Icons.favorite),);
                break;
              case SwitchTab.promo: 
                return const Center(child: Icon(Icons.card_giftcard));
                break;
              case SwitchTab.profile: 
                return profilePage;
                break;
              default:
                return const Center(child: CircularProgressIndicator(),);
            }
          }
        ),
      ),
      bottomNavigationBar: XBottomNavigator(bloc.tabStream, bloc.setTab)
    );
  }
}

class XBottomNavigator extends StatelessWidget {

  final Stream<SwitchTab> stream;
  final Function(SwitchTab) setTab;

  const XBottomNavigator(this.stream, this.setTab, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      height: 48,
      child: Material(
        color: whiteColor,
        shape: const Border(top: BorderSide(color: borderColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              splashColor: accentColor,
              icon: StreamBuilder<SwitchTab>(
                stream: stream,
                builder: (context, stream) => AnimatedSwitcher(
                  switchInCurve: Curves.fastOutSlowIn,
                  switchOutCurve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 600),
                  child: (stream.data == SwitchTab.home) 
                    ? const Icon( Icons.home, key: Key("active"), color: mainColor,)
                    : const Icon(Icons.home, key: Key("notactive"), color: greyColor),
                )
              ), 
              onPressed: () {
                setTab(SwitchTab.home);
              },
            ),
            IconButton(
              splashColor: accentColor,
              icon:StreamBuilder<SwitchTab>(
                stream: stream,
                builder: (context, stream) => AnimatedSwitcher(
                  switchInCurve: Curves.fastOutSlowIn,
                  switchOutCurve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 600),
                  child: (stream.data == SwitchTab.search) 
                    ? const Icon( Icons.search, key: Key("active"), color: mainColor,)
                    : const Icon(Icons.search, key: Key("notactive"), color: greyColor),
                )
              ), 
              onPressed: () {
                setTab(SwitchTab.search);
              },
            ),
            IconButton(
              splashColor: accentColor,
              icon:StreamBuilder<SwitchTab>(
                stream: stream,
                builder: (context, stream) => AnimatedSwitcher(
                  switchInCurve: Curves.fastOutSlowIn,
                  switchOutCurve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 600),
                  child: (stream.data == SwitchTab.favorite) 
                    ? const Icon( Icons.favorite, key: Key("active"), color: mainColor,)
                    : const Icon(Icons.favorite_border, key: Key("notactive"), color: greyColor),
                )
              ),  
              onPressed: () {
                setTab(SwitchTab.favorite);
              },
            ),
            IconButton(
              splashColor: accentColor,
              icon:StreamBuilder<SwitchTab>(
                stream: stream,
                builder: (context, stream) => AnimatedSwitcher(
                  switchInCurve: Curves.fastOutSlowIn,
                  switchOutCurve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 600),
                  child: (stream.data == SwitchTab.promo) 
                    ? const Icon( Icons.card_giftcard, key: Key("active"), color: mainColor,)
                    : const Icon(Icons.card_giftcard, key: Key("notactive"), color: greyColor),
                )
              ),  
              onPressed: () {
                setTab(SwitchTab.promo);
              },
            ),
            IconButton(
              splashColor: accentColor,
              icon:StreamBuilder<SwitchTab>(
                stream: stream,
                builder: (context, stream) => AnimatedSwitcher(
                  switchInCurve: Curves.fastOutSlowIn,
                  switchOutCurve: Curves.fastOutSlowIn,
                  duration: const Duration(milliseconds: 600),
                  child: (stream.data == SwitchTab.profile) 
                    ? const Icon( Icons.account_circle, key: Key("active"), color: mainColor,)
                    : const Icon(Icons.account_circle, key: Key("notactive"), color: greyColor),
                )
              ), 
              onPressed: () {
                setTab(SwitchTab.profile);
              },
            ),
          ],
        ),
      ),
    );
  }
}