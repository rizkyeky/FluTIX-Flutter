part of 'bloc.dart';

class MyTicketsBloc implements Bloc {
  
  final TicketService _ticketService = locator.get<TicketService>(instanceName: 'Ticket Service');
  final User user = locator.get<User>(instanceName: 'User Active');
  final DateTime _thisDate = DateTime.now();
  
  @override
  void dispose() {
  }

  @override
  Future<void> init() async {
  }

  Future<List<Ticket>> getNewestMovies() async {
    final List<int> nowDayDate = [_thisDate.weekday,_thisDate.day,_thisDate.month,_thisDate.year];

    List<Ticket> tickets = [];
    tickets = await _ticketService.getTickets(user.id);
    
    if (tickets.isNotEmpty) {
      tickets = tickets.where((element) {
        if (element.dayDate[3] < nowDayDate[3] 
        || element.dayDate[2] < nowDayDate[2] 
        || element.dayDate[1] < nowDayDate[1] 
        || element.dayDate[0] < nowDayDate[0]) {
          return false;
        } else {
          return true;
        }
      }).toList();
    }

    return tickets; 
  }

  Future<List<Ticket>> getOldestMovies() async {
    final List<int> nowDayDate = [_thisDate.weekday,_thisDate.day,_thisDate.month,_thisDate.year];

    List<Ticket> tickets = [];
    tickets = await _ticketService.getTickets(user.id);
    
    if (tickets.isNotEmpty) {
      tickets = tickets.where((element) {
        if (element.dayDate[3] < nowDayDate[3] 
        || element.dayDate[2] < nowDayDate[2] 
        || element.dayDate[1] < nowDayDate[1] 
        || element.dayDate[0] < nowDayDate[0]) {
          return true;
        } else {
          return false;
        }
      }).toList();
    }

    return tickets; 
  }

  String convertTime(int minute) {
   
    final str = StringBuffer();

    if (minute > 60) {
      str.write((minute / 60).floor());
      str.write('h ');
    }
    if (minute % 60 != 0) {
      str.write(minute % 60);
      str.write('m');
    }
    return str.toString();
  }
}