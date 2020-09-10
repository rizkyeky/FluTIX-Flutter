part of 'bloc.dart';

class CheckoutBloc implements Bloc {

  bool isInit = false;

  final DateTime _thisDate = DateTime.now();
  DateTime get thisDate => _thisDate;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<void> init() async {
  }

  void onCheckOut() {
    locator.call<Ticket>(instanceName: 'Ticket').copyWith(dayDate: [
      _thisDate.weekday,
      _thisDate.day
    ]);
    locator.call<Ticket>(instanceName: 'Ticket').copyWith(time: [
      _thisDate.hour,
      _thisDate.minute,
      _thisDate.second,
    ]);
  }
}