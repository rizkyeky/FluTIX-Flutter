
part of 'bloc.dart';

enum SwitchTab {home, search, cart, profile}

class MainTabBarBloc {

  // @override
  // void init() {
  //   _tab = SwitchTab.home;
  //   _tabController.sink.add(_tab);
  // }

  // @override
  // void dispose() {
  //   _tabController.close();
  // }

  MainTabBarBloc() {
    _tab = SwitchTab.home;
    _tabController.sink.add(_tab);
  }

  final BehaviorSubject<SwitchTab> _tabController = BehaviorSubject();
  Stream<SwitchTab> get tabStream => _tabController.stream;

  SwitchTab _tab;
  SwitchTab get tab => _tab;

  bool _activeIcon;
  bool get activeIcon => _activeIcon;

  void setTab(SwitchTab val) {
    if (val != _tab) {
      _tab = val;
      _tabController.sink.add(_tab);

      switch(val) {
        case SwitchTab.home: print("tab home");
        break;
        case SwitchTab.cart: print("tab cart");
        break;
        case SwitchTab.search: print("tab search");
        break;
        case SwitchTab.profile: print("tab profile");
      }
    }
  } 
}