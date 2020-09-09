part of 'service.dart';

class TicketService {
  fire_store.CollectionReference ticketCollection = fire_store.FirebaseFirestore
    .instance.collection("tickets");

  Future<void> saveTicket(String id, Ticket ticket) async {
    await ticketCollection.doc().set({
      "movieID": ticket.movie.id ?? "",
      "userID": id ?? "",
      "place": ticket.bookingPlace ?? "",
      "time": ticket.time ?? DateTime.now().millisecondsSinceEpoch,
      "bookCode": ticket.bookingCode ?? "",
      "seats": ticket.seats ?? [],
      "name": ticket.movie.title,
      "totalPrice": ticket.price
    });
  }

  // Future<List<Ticket>> getTickets(String userID) async {
  //   fire_store.QuerySnapshot snapshot = await ticketCollection.get();
  //   var documents = snapshot.docs.where((document) => document.data()['userID'] == userID);
  // }
}