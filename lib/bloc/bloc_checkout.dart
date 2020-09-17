part of 'bloc.dart';

class CheckoutBloc implements Bloc {

  final TicketService _ticketService = TicketService();
  final TransactionService _transactionService = TransactionService();
  final ticket = locator.call<Ticket>(instanceName: 'Ticket');

  final DateTime _thisDate = DateTime.now();
  DateTime get thisDate => _thisDate;

  final int _moviePrice = 20000;
  int get moviePrice => _moviePrice;

  final int _feePrice = 5000;
  int get feePrice => _feePrice;

  int get starCount => (ticket.movie.voteAverage/2).round();
  int get seatsLen => ticket.seats.length;
  int get totalPrice => (_moviePrice * seatsLen) + (_feePrice * seatsLen);

  final List<String> _paymentGateways = ['Gopay', 'OVO', 'Dana', 'Link Aja'];
  List<String> get paymentGateways => _paymentGateways;

  @override
  void dispose() {}

  @override
  Future<void> init() async {}
  
  Future<void> onCheckOut() async {
    locator.call<Ticket>(instanceName: 'Ticket').copyWith(price: totalPrice);
    
    locator.call<Ticket>(instanceName: 'Ticket').copyWith(dayDate: [
      _thisDate.weekday,
      _thisDate.day,
      _thisDate.month,
      _thisDate.year,
    ]);
    locator.call<Ticket>(instanceName: 'Ticket').copyWith(time: [
      _thisDate.hour,
      _thisDate.minute,
      _thisDate.second,
    ]);

    final String userID = locator.get<User>(instanceName: 'User Active').id;

    await _ticketService.saveTicket(userID, ticket);

    final Transaction transaction = Transaction(
      userID, 
      ticket.movie.title, 
      ticket.bookingPlace, 
      totalPrice, ticket.time, ticket.movie.posterPath
    );

    await _transactionService.saveTransaction(transaction);
  }
}