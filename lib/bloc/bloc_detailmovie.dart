part of 'bloc.dart';

class DetailMovieBloc implements Bloc {

  final MovieService _movieService = MovieService();

  final BehaviorSubject<List<Movie>> _movieCarouselController = BehaviorSubject();
  Stream<List<Movie>> get movieCarouselStream => _movieCarouselController.stream;

  Movie _movie = Movie.initial();

  bool isInit = false;

  @override
  void dispose() {
    if (isInit) {
      isInit = false;
    }
  }

  @override
  Future<void> init() async {
    if (!isInit) {
      isInit = true;
    }
  }

  Future<void> getMovieFromService(int id) async {
    _movie = await _movieService.getMovie(id);
  }

  Future<Movie> getMovie(int id) async {
    if (_movie == null) {
      await getMovieFromService(id);
    }

    return _movie;
  }
}