part of 'bloc.dart';

class SearchBloc implements Bloc {
  
  final BehaviorSubject<bool> _searchController = BehaviorSubject();
  Stream<bool> get searchStream => _searchController.stream;
  
  @override
  void dispose() {
    _searchController.close();
  }

  @override
  void init() {
    _activeSearch = false;
    _searchController.sink.add(_activeSearch);
  }

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