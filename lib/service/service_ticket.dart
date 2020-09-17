part of 'service.dart';

class TicketService {
  fire_store.CollectionReference ticketCollection = fire_store.FirebaseFirestore
    .instance.collection("tickets");

  Future<void> saveTicket(String userID, Ticket ticket) async {
    await ticketCollection.doc().set({
      "movieID": ticket.movie.id ?? "",
      "movieName": ticket.movie.title ?? "",
      "userID": userID ?? "",
      "price": ticket.price ?? 0,
      "seats": ticket.seats.join(',') ?? "",
      "time": ticket.time.join(':') ?? "",
      "dayDate": ticket.dayDate.join(',') ?? "",
      "bookingCode": ticket.bookingCode ?? "",
      "bookingPlace": ticket.bookingPlace ?? "",
      "bookingDayDate": ticket.bookingDayDate ?? "",
      "bookingTime": ticket.bookingTime ?? ""
    });
  }

  Future<List<Ticket>> getTickets(String userId) async {
    final fire_store.QuerySnapshot snapshot = await ticketCollection.get();
    final Iterable<fire_store.QueryDocumentSnapshot> documents = snapshot.docs.where(
      (element) =>  element.data()['userID'] == userId
    );

    final MovieService movieService = MovieService();
    final UserService userService = UserService();

    final List<Ticket> tickets = [];
    for (final fire_store.QueryDocumentSnapshot doc in documents) {
      
      final Movie movie = await movieService.getMovie((doc.data()['movieID'] as num).toInt());
      final User user = await userService.getUser(doc.data()['userID'] as String);
      
      tickets.add(Ticket(
        doc.data()['ticketID'] as String, 
        user.name, 
        doc.data()['bookingCode'] as String, 
        doc.data()['bookingPlace'] as String, 
        movie,
        (doc.data()['price'] as num).toInt(), 
        (doc.data()['time'] as String).split(':').map<int>((e) => int.parse(e)).toList(),
        doc.data()['bookingTime'] as String, 
        (doc.data()['dayDate'] as String).split(',').map<int>((e) => int.parse(e)).toList(),
        doc.data()['bookingDayDate'] as String, 
        (doc.data()['seats'] as String).split(',')
      ));
    }
    return tickets;
  }
}