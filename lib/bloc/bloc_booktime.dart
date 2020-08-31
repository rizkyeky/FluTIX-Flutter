part of 'bloc.dart';

class BookTimeBloc implements Bloc {

  // final MovieService _movieService = MovieService();

  final BehaviorSubject<int> _selectedDateController = BehaviorSubject();
  Stream<int> get selectedDateStream => _selectedDateController.stream;

  final BehaviorSubject<Map<String, int>> _selectedTimePlaceController = BehaviorSubject();
  Stream<Map<String, int>> get selectedTimePlaceStream => _selectedTimePlaceController.stream;

  final BehaviorSubject<Map<String, int>> _selectedBookController = BehaviorSubject();
  Stream<Map<String, int>> get selectedBookStream => _selectedBookController.stream;

  final DateTime _thisDate = DateTime.now();
  
  final List<Map<String, dynamic>> _daysInWeek = [];
  List<Map<String, dynamic>> get daysInWeek => _daysInWeek;
  
  Map<String, dynamic> _selectedDate = {};
  String _selectedPlace = '';
  String _selectedTime = '';

  Map<String, String> get selectedDateTimePlace => {
    'date': '${_selectedDate['name'] as String} ${_selectedDate['date']} ${_thisDate.year}',
    'time': _selectedTime,
    'place': _selectedPlace
  };

  Map<String, List<String>> timePlace = {
    'XXI Paris Van Java Mall': ['10:00', '12:00', '14:00'],
    'XXI Bandung Indah Plaza': ['10:10', '12:10', '14:10'],
    'XXI Ciwalk': ['10:20', '12:20', '14:20'],
    'CGV Bandung Elektronik Center': ['10:30', '12:30', '14:30'],
  };

  bool isInit = false;

  @override
  void dispose() {
    if (isInit) {
      isInit = false;

      _selectedDateController.close();
      _selectedTimePlaceController.close();
    }
  }

  @override
  Future<void> init() async {
    if (!isInit) {
      isInit = true;

      getDaysInWeek();
      _selectedDateController.sink.add(-1);
      _selectedTimePlaceController.sink.add({});
    }
  }

  void printSelected() {
    print('$_selectedDate $_selectedTime $_selectedPlace');
  }

  void selectDate(int index) {

    if (index == -1) {
      _selectedDateController.sink.add(index);

    }
    else if (_selectedDate != _daysInWeek[index]) {
      _selectedDate = _daysInWeek[index];
      _selectedDateController.sink.add(index);
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

  void selectTimePlace(String place, int indexTime) {
    
    if (indexTime == -1) {
      _selectedTimePlaceController.sink.add({});
      // print('$place $indexTime');
    }
    else {
      _selectedTimePlaceController.sink.add({place: indexTime});
      _selectedPlace = place;
      _selectedTime = timePlace[place][indexTime];
      // print('$place $indexTime');
    }
  }
}