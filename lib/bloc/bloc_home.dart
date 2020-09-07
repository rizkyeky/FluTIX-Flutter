part of 'bloc.dart';

class HomeBloc implements Bloc {

  final MovieService _movieService = MovieService();

  final BehaviorSubject<List<Movie>> _movieCarouselController = BehaviorSubject();
  Stream<List<Movie>> get movieCarouselStream => _movieCarouselController.stream;

  List<Movie> _movies = [];

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
    _movies = await _movieService.getMovies();
  }

  Future<List<Movie>> getMoviesCarousel(int start, int end) async {
    return _movies.sublist(start, end);
  }

}