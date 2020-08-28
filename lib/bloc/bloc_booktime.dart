part of 'bloc.dart';

class BookTimeBloc implements Bloc {

  // final MovieService _movieService = MovieService();

  final BehaviorSubject<List<Movie>> _movieCarouselController = BehaviorSubject();
  Stream<List<Movie>> get movieCarouselStream => _movieCarouselController.stream;

  final DateTime _thisDate = DateTime.now();
  final List<Map<String, dynamic>> daysInWeek = [];

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

      getDaysInWeek();
    }
  }

  void getDaysInWeek() {

    int date = _thisDate.day;
    int weekday = _thisDate.weekday;

    final lastDateOfThisMonth = DateTime(_thisDate.year, _thisDate.month, 0);

    for (int i = 0; i < 7 ; i++) {
      
      final Map<String, dynamic> day = {};

      if (weekday > 7) {
        weekday = 1;
      }

      if (date > lastDateOfThisMonth.day) {
        date = 1;
      }
      
      switch (weekday) {
        case 1: 
          day['name'] = 'Mon';
          break;
        case 2: 
          day['name'] = 'Tus';
          break;
        case 3: 
          day['name'] = 'Wed';
          break;
        case 4: 
          day['name'] = 'Thus';
          break;
        case 5: 
          day['name'] = 'Fri';
          break;
        case 6: 
          day['name'] = 'Sat';
          break;
        default: day['name'] = 'Sun';
      }

      day['date'] = date;
      
      daysInWeek.add(day);
      
      weekday++;
      date++;
    }
  }


}