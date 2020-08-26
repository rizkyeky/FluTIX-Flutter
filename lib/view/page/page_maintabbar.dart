part of 'page.dart';

class MainTabBarPage extends StatelessWidget {

  final HomePage homePage = HomePage();
  // final SearchView searchView = SearchView();

  final MainTabBarBloc _bloc = locator.get<MainTabBarBloc>(instanceName: 'MainTabBar Bloc');

  MainTabBarPage({Key key}) : super(key: key);

  // @override
  // void init() {
  // }

  // @override
  // void dispose() {
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<SwitchTab>(
          stream: _bloc.tabStream,
          builder: (context, snap) {
            switch (snap.data) {
              case SwitchTab.home: 
                return homePage;
                break;
              case SwitchTab.search: 
                return const Center(child: Icon(Icons.search));
                break;
              case SwitchTab.cart: 
                return const Center(child: Icon(Icons.shopping_cart),);
                break;
              case SwitchTab.profile: 
                return const Center(child: Icon(Icons.account_circle),);
                break;
              default:
                return const Center(child: CircularProgressIndicator(),);
            }
          }
        ),
      ),
      bottomNavigationBar: XBottomNavigator(_bloc)
    );
  }
}

class XBottomNavigator extends StatelessWidget {

  final MainTabBarBloc bloc;

  const XBottomNavigator(this.bloc, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      height: 48,
      child: Material(
        color: mainColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: (stream.data == SwitchTab.home) 
                    ? const Icon( Icons.home, key: Key("active"), color: Colors.white,)
                    : const Icon(Icons.home, key: Key("notactive")),
                )
              ), 
              onPressed: () {
                bloc.setTab(SwitchTab.home);
              },
            ),
            IconButton(
              icon:StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: (stream.data == SwitchTab.search) 
                    ? const Icon( Icons.search, key: Key("active"), color: Colors.white,)
                    : const Icon(Icons.search, key: Key("notactive")),
                )
              ), 
              onPressed: () {
                bloc.setTab(SwitchTab.search);
              },
            ),
            IconButton(
              icon:StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: (stream.data == SwitchTab.cart) 
                    ? const Icon( Icons.shopping_cart, key: Key("active"), color: Colors.white,)
                    : const Icon(Icons.shopping_cart, key: Key("notactive")),
                )
              ),  
              onPressed: () {
                bloc.setTab(SwitchTab.cart);
              },
            ),
            IconButton(
              icon:StreamBuilder<SwitchTab>(
                stream: bloc.tabStream,
                builder: (context, stream) => AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: (stream.data == SwitchTab.profile) 
                    ? const Icon( Icons.account_circle, key: Key("active"), color: Colors.white,)
                    : const Icon(Icons.account_circle, key: Key("notactive")),
                )
              ), 
              onPressed: () {
                bloc.setTab(SwitchTab.profile);
              },
            ),
          ],
        ),
      ),
    );
  }
}