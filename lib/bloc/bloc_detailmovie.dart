part of 'bloc.dart';

class DetailMovieBloc implements Bloc {

  final MovieService _movieService = MovieService();
  final User _user = locator.get<User>(instanceName: 'User Active');
  
  final BehaviorSubject<bool> _favoriteController = BehaviorSubject();
  Stream<bool> get favoriteStream => _favoriteController.stream;

  Movie _movie;
  List<Cast> _casts = [];

  bool isInit = false;

  @override
  void dispose() {
    _favoriteController.close();
  }

  @override
  Future<void> init() async {
    _favoriteController.sink.add(false);
  }

  void checkFavoriteMovie(Movie movie) {
    if (_user.favoriteMovie.contains(movie)) {
      _favoriteController.sink.add(true);
    } else {
      _favoriteController.sink.add(false);
    }
  }

  Future<void> getMovieFromService(int id) async {
    _movie = await _movieService.getMovie(id);
  }

  Future<Movie> getDetailMovie(Movie movie) async {
    
    await getMovieFromService(movie.id);

    movie.runtime = _movie.runtime;

    return movie;
  }

  Future<void> getCastFromService(int id) async {
    _casts = await _movieService.getCasts(id);
  }

  Future<List<Cast>> getCasts(int id) async {
    await getCastFromService(id);
    return _casts;
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