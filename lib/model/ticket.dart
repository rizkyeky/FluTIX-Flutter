part of 'model.dart';

class Ticket {
  String id;
  String bookingCode;
  String place;
  Movie movie;
  int price;
  List<int> time;
  List<int> dayDate;
  List<String> seats;

  Ticket(
    this.id, 
    this.bookingCode, 
    this.place, 
    this.movie, 
    this.price,
    this.time,
    this.dayDate,
    this.seats, 
  );

  factory Ticket.initial() => Ticket(
    '',
    '',
    '',
    Movie.initial(),
    0,
    [],
    [],
    []
  );

  void copyWith({
    String id,
    String bookingCode,
    String place,
    Movie movie,
    int price,
    List<int> time,
    List<int> dayDate,
    List<String> seats
  }) {
    this.id = id ?? this.id;
    this.bookingCode = bookingCode ?? this.bookingCode;
    this.place = place ?? this.place;
    this.movie = movie ?? this.movie;
    this.price = price ?? this.price;
    this.time = time ?? this.time;
    this.dayDate = dayDate ?? this.dayDate;
    this.seats = seats ?? this.seats;
  }
}