part of 'bloc.dart';

class PreferenceBloc implements Bloc {

  final UserService _userService = locator.get<UserService>(instanceName: 'User Service');

  final BehaviorSubject<bool> _loadingController = BehaviorSubject();
  Stream<bool> get isLoadingStream => _loadingController.stream;
  
  final List<String> _selectedGenres = [];
  List<String> get selectedGenres => _selectedGenres;

  final List<String> _selectedCountries = [];
  List<String> get selectedCountries => _selectedCountries;

  final List<String> _genres = ['Romance', 'Action', 'Adventure', 'Family', 'Horror', 'Crime', 'Comedy', 'Sci-Fi'];
  List<String> get genres => _genres;

  final List<String> _countries = ['Western', 'Indonesia', 'Japan', 'Korea'];
  List<String> get countries => _countries;


  @override
  void dispose() {
    _loadingController.close();
  }

  @override
  Future<void> init() async {
    _loadingController.sink.add(false);
  }

  void selectGenres(String genre) {
    if (!_selectedGenres.contains(genre)) {
      _selectedGenres.add(genre);
    }
    else {
      _selectedGenres.remove(genre);
    }
  }

  void selectCountries(String country) {
    if (!_selectedCountries.contains(country)) {
      _selectedCountries.add(country);
    }
    else {
      _selectedCountries.remove(country);
    }
  }

  Future<void> setUserPreference() async {
    final User user = locator.get<User>(instanceName: 'User Active');
    
    _loadingController.sink.add(true);
    await _userService.updateUser(user.id, favGenres: _selectedGenres, favCountries: _selectedCountries)
    .whenComplete(() => _loadingController.sink.add(false));
  }
}