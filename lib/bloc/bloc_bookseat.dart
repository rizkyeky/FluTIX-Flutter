part of 'bloc.dart';

class BookSeatBloc implements Bloc {

  final BehaviorSubject<List<String>> _selectedSeatsController = BehaviorSubject();
  Stream<List<String>> get selectedDateStream => _selectedSeatsController.stream;

  bool isInit = false;

  final List<List<String>> _seats = List.generate(
    9, (indexHuruf) => List.generate(
      9, (indexAngka) => '${String.fromCharCode(indexHuruf + 65)}${indexAngka + 1}'
    )
  );
  List<List<String>> get seats => _seats;
  
  final List<String> _selectedSeats = [];
  List<String> get selectedSeats => _selectedSeats;

  final List<String> _bookedSeats = List.generate(4, (index) => 'A${index+1}');
  List<String> get bookedSeats => _bookedSeats;

  @override
  void dispose() {
    if (isInit) {
      isInit = false;
      _selectedSeatsController.close();
    }
  }

  @override
  Future<void> init() async {
    if (!isInit) {
      isInit = true;
    }
  }

  void selectSeats(String seatName) {
    if (!_selectedSeats.contains(seatName)) {
      _selectedSeats.add(seatName);
    }
    else {
      _selectedSeats.remove(seatName);
    }
  }

  final String _chars = '1234567890';
  final Random _rnd = Random();

  String getIDTicket(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));
}