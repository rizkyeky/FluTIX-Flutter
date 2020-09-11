part of 'bloc.dart';

class CheckoutBloc implements Bloc {

  final TicketService _ticketService = TicketService();

  final DateTime _thisDate = DateTime.now();
  DateTime get thisDate => _thisDate;

  @override
  void dispose() {
  }

  @override
  Future<void> init() async {
  }

  Future<void> onCheckOut() async {
    locator.call<Ticket>(instanceName: 'Ticket').copyWith(dayDate: [
      _thisDate.weekday,
      _thisDate.day
    ]);
    locator.call<Ticket>(instanceName: 'Ticket').copyWith(time: [
      _thisDate.hour,
      _thisDate.minute,
      _thisDate.second,
    ]);

    final Ticket ticket = locator.get<Ticket>(instanceName: 'Ticket');
    final String userID = locator.get<User>(instanceName: 'User Active').id;

    await _ticketService.saveTicket(userID, ticket);
  }
}