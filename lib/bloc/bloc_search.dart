part of 'bloc.dart';

class SearchBloc implements Bloc {
  @override
  void dispose() {
  }

  @override
  Future<void> init() async {
    _activeSearch = false;
    _searchController.sink.add(_activeSearch);
  }

  final BehaviorSubject<bool> _searchController = BehaviorSubject();
  Stream<bool> get searchStream => _searchController.stream;

  bool _activeSearch;  
  bool get activeSearch => _activeSearch;

  void switchSearch() {
    if (_activeSearch) {
      _activeSearch = false;
    } else {
      _activeSearch = true;
    }
    _searchController.sink.add(_activeSearch);
  }
}