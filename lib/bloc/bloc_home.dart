part of 'bloc.dart';

class HomeBloc {

  final MovieService _movieService = MovieService();

  final BehaviorSubject<bool> _isLoadingController = BehaviorSubject();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  List<Movie> _movies = [];

  Future<void> getMoviesFromService() async {
    if (_movies.isEmpty) {
      _movies = await _movieService.getMovies();
    }
  }

  Stream<Movie> getMovieFromIndex(int index) async* {
    
    await getMoviesFromService();

    yield _movies[index];
  }
}