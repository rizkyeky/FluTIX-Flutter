part of 'bloc.dart';

class HomeBloc {

  final MovieService _movieService = MovieService();

  final BehaviorSubject<List<Movie>> _movieCarouselController = BehaviorSubject();
  Stream<List<Movie>> get movieCarouselStream => _movieCarouselController.stream;

  List<Movie> _movies = [];

  bool isInit = false;

  Future<void> init() async {
    if (!isInit) {
      isInit = true;

      await getMoviesFromService();
    }
  }

  Future<void> getMoviesFromService() async {
    _movies = await _movieService.getMovies();
    print('get movies from service success');
    print('${_movies.length} movies');
  }

  Future<List<Movie>> getMoviesCarousel(int start, int end) async {
    
    // if (_movies.isEmpty) {
    //   await init();
    // }

    print('get ${_movies.length} movies from $start to $end success');
    return _movies.sublist(start, end);
  }
}