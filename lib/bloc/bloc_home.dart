part of 'bloc.dart';

class HomeBloc implements Bloc {

  final LocalService _localService = locator.get<LocalService>(instanceName: 'Local Service');
  final User _user = locator.call<User>(instanceName: 'User Active');

  final BehaviorSubject<List<Movie>> _movieCarouselController = BehaviorSubject();
  // Stream<List<Movie>> get movieCarouselStream => _movieCarouselController.stream;

  List<Movie> _popularitymovies = [];
  List<Movie> _comingSoonMovies = [];
  List<Movie> _playingNowMovies = [];

  bool isInit = false;

  @override
  Future<void> init() async {
    if (!isInit) {
      isInit = true;

      await getMoviesFromService();
    }
  }

  @override
  void dispose() {
    _movieCarouselController.close();
  }

  Future<void> getMoviesFromService() async {
    _popularitymovies = _localService.popularMovies;
    _comingSoonMovies = _localService.comingSoonMovies;
    _playingNowMovies = _localService.playingNowMovies;
  }

  Future<List<Movie>> getPopularityMoviesList(int start, int end) async {
    return _popularitymovies.sublist(start, end);
  }

  Future<List<Movie>> getComingSoonMoviesList(int start, int end) async {
    return _comingSoonMovies.sublist(start, end);
  }

  Future<List<Movie>> getPlayingNowMoviesList(int start, int end) async {
    return _playingNowMovies.sublist(start, end);
  }

  void setFavoriteMovie(Movie movie) {
    if (!_user.favoriteMovie.contains(movie)) {
      _user.favoriteMovie.add(movie);
    }
    else {
      _user.favoriteMovie.remove(movie);
    }
  }
}