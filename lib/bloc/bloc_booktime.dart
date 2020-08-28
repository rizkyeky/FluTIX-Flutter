part of 'bloc.dart';

class BookTimeBloc implements Bloc {

  // final MovieService _movieService = MovieService();

  final BehaviorSubject<int> _selectedDateController = BehaviorSubject();
  Stream<int> get selectedDateStream => _selectedDateController.stream;

  final DateTime _thisDate = DateTime.now();
  
  final List<Map<String, dynamic>> _daysInWeek = [];
  List<Map<String, dynamic>> get daysInWeek => _daysInWeek;
  
  Map<String, dynamic> selectedDate;

  bool isInit = false;

  @override
  void dispose() {
    if (isInit) {
      isInit = false;

      _selectedDateController.close();
    }
  }

  @override
  Future<void> init() async {
    if (!isInit) {
      isInit = true;

      getDaysInWeek();
      _selectedDateController.sink.add(-1);
    }
  }

  void selectDate(int index) {

    if (index == -1) {
      _selectedDateController.sink.add(index);

    }
    else if (selectedDate != _daysInWeek[index]) {
      selectedDate = _daysInWeek[index];
      _selectedDateController.sink.add(index);
      print(index);
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
          day['name'] = 'Mon'.toUpperCase();
          break;
        case 2: 
          day['name'] = 'Tus'.toUpperCase();
          break;
        case 3: 
          day['name'] = 'Wed'.toUpperCase();
          break;
        case 4: 
          day['name'] = 'Thus'.toUpperCase();
          break;
        case 5: 
          day['name'] = 'Fri'.toUpperCase();
          break;
        case 6: 
          day['name'] = 'Sat'.toUpperCase();
          break;
        default: day['name'] = 'Sun'.toUpperCase();
      }

      day['date'] = date;
      
      _daysInWeek.add(day);
      
      weekday++;
      date++;
    }
  }


}