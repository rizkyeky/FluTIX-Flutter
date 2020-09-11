part of 'bloc.dart';

class BookTimeBloc implements Bloc {

  final BehaviorSubject<int> _selectedDateController = BehaviorSubject();
  Stream<int> get selectedDateStream => _selectedDateController.stream;

  final BehaviorSubject<Map<String, int>> _selectedTimePlaceController = BehaviorSubject();
  Stream<Map<String, int>> get selectedTimePlaceStream => _selectedTimePlaceController.stream;

  final DateTime _thisDate = DateTime.now();
  DateTime get thisDate => _thisDate;
  
  final List<Map<String, dynamic>> _daysInWeek = [];
  List<Map<String, dynamic>> get daysInWeek => _daysInWeek;
  
  Map<String, dynamic> _selectedDate = {};
  
  String _selectedPlace = '';
  String get place => _selectedPlace;

  String _selectedTime = '';
  String get time => _selectedTime;

  final Map<String, List<String>> _timePlace = {
    'XXI Paris Van Java Mall': ['10:00', '12:00', '14:00'],
    'XXI Bandung Indah Plaza': ['10:10', '12:10', '14:10'],
    'XXI Ciwalk': ['10:20', '12:20', '14:20'],
    'CGV Bandung Elektronik Center': ['10:30', '12:30', '14:30'],
  };
  Map<String, List<String>> get timePlace => _timePlace;


  @override
  void dispose() {
    _selectedTimePlaceController.close();
    _selectedDateController.close();
  }

  @override
  Future<void> init() async {
      _getDaysInWeek();
      _selectedDateController.sink.add(-1);
      _selectedTimePlaceController.sink.add({});
  }

  void selectDate(int index) {

    if (index == -1) {
      _selectedDate = {};
      _selectedDateController.sink.add(index);
    }
    else if (_selectedDate != _daysInWeek[index]) {
      _selectedDate = _daysInWeek[index];
      _selectedDateController.sink.add(index);
    }
  }

  void _getDaysInWeek() {

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
      
      _daysInWeek.add(day);
      
      weekday++;
      date++;
    }
  }

  void selectTimePlace(String place, int indexTime) {
    
    if (indexTime == -1) {
      _selectedPlace = '';
      _selectedTime = '';
      _selectedTimePlaceController.sink.add({});
    }
    else {
      _selectedPlace = place;
      _selectedTime = timePlace[place][indexTime];
      _selectedTimePlaceController.sink.add({place: indexTime});
    }
  }

  void onSelectedBookTime() {
    locator.call<Ticket>(instanceName: 'Ticket')
      .copyWith(bookingDayDate: '${_selectedDate['name']} ${_selectedDate['date']} ${_thisDate.month} ${_thisDate.year}');
    locator.call<Ticket>(instanceName: 'Ticket')
      .copyWith(bookingPlace: _selectedPlace);
    locator.call<Ticket>(instanceName: 'Ticket')
      .copyWith(bookingTime: _selectedTime);
  }
}