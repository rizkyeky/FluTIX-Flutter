part of 'service.dart';

class LocalService {

  final MovieService _movieService = locator.get<MovieService>(instanceName: 'Movie Service');

  List<Movie> _playingNowMovies = [];
  List<Movie> get playingNowMovies => _playingNowMovies;
  
  List<Movie> _popularMovies = [];
  List<Movie> get popularMovies => _popularMovies;

  List<Movie> _comingSoonMovies = [];
  List<Movie> get comingSoonMovies => _comingSoonMovies;

  bool isInit = false;

  Future<void> init() async {
    if (!isInit) {
      _playingNowMovies = await _movieService.getMovies(MovieSortType.playingnow);
      _popularMovies = await _movieService.getMovies(MovieSortType.popularity);
      _comingSoonMovies = await _movieService.getMovies(MovieSortType.comingsoon);
      
      isInit = true;
    }
  }

}