part of 'model.dart';

class Ticket {
  String id;
  String bookingCode;
  String bookingPlace;
  Movie movie;
  int price;
  List<int> time;
  String bookingTime;
  List<int> dayDate;
  String bookingDayDate;
  List<String> seats;

  Ticket(
    this.id, 
    this.bookingCode, 
    this.bookingPlace, 
    this.movie, 
    this.price,
    this.time,
    this.bookingTime,
    this.dayDate,
    this.bookingDayDate,
    this.seats, 
  );

  factory Ticket.initial() => Ticket(
    '',
    '',
    '',
    Movie.initial(),
    0,
    [],
    '',
    [],
    '',
    []
  );

  void copyWith({
    String id,
    String bookingCode,
    String bookingPlace,
    Movie movie,
    int price,
    List<int> time,
    String bookingTime,
    List<int> dayDate,
    String bookingDayDate,
    List<String> seats
  }) {
    this.id = id ?? this.id;
    this.bookingCode = bookingCode ?? this.bookingCode;
    this.bookingTime = bookingTime ?? this.bookingTime;
    this.bookingDayDate = bookingDayDate ?? this.bookingDayDate;
    this.bookingPlace = bookingPlace ?? this.bookingPlace;
    this.movie = movie ?? this.movie;
    this.price = price ?? this.price;
    this.time = time ?? this.time;
    this.dayDate = dayDate ?? this.dayDate;
    this.seats = seats ?? this.seats;
  }
}