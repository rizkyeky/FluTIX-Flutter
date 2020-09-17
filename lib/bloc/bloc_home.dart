part of 'bloc.dart';

class HomeBloc implements Bloc {

  final LocalService _localService = locator.get<LocalService>(instanceName: 'Local Service');
  final User _user = locator.get<User>(instanceName: 'User Active');

  List<Movie> _popularitymovies = [];
  List<Movie> _comingSoonMovies = [];
  List<Movie> _playingNowMovies = [];

  @override
  Future<void> init() async {
    await getMoviesFromService();
  }

  @override
  void dispose() {}

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
      _user.favoriteMovie.add(movie.id.toString());
    }
    else {
      _user.favoriteMovie.remove(movie.id.toString());
    }
  }
}