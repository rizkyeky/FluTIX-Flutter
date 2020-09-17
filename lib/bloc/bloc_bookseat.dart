part of 'bloc.dart';

class BookSeatBloc implements Bloc {

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
  void dispose() {}

  @override
  void init() {}

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

  String _getBookingCode() => String.fromCharCodes(Iterable.generate(
    10, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  void onSelectSeats() {
    locator.call<Ticket>(instanceName: 'Ticket').copyWith(
      seats: _selectedSeats
    );
    locator.call<Ticket>(instanceName: 'Ticket').copyWith(
      bookingCode: _getBookingCode()
    );
  }
}