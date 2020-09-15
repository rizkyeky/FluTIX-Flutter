part of 'model.dart';

class Transaction {
  final String userID;
  final String title;
  final String subtitle;
  final int amount;
  final DateTime time;
  final String picture;

  Transaction(
    this.userID,
    this.title,
    this.subtitle,
    this.amount,
    this.time,
    this.picture
  );

}
