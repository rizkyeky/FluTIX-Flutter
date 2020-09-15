part of 'service.dart';

class TransactionService {
  final fire_store.CollectionReference _transactionCollection =
      fire_store.FirebaseFirestore.instance.collection('transactions');

  Future<void> saveTransaction(
      Transaction transaction) async {
    await _transactionCollection.doc().set({
      'userID': transaction.userID,
      'title': transaction.title,
      'subtitle': transaction.subtitle,
      'time': transaction.time.millisecondsSinceEpoch,
      'amount': transaction.amount,
      'picture': transaction.picture
    });
  }

  Future<List<Transaction>> getTransaction(String userID) async {
    final fire_store.QuerySnapshot snapshot = await _transactionCollection.get();

    final documents = snapshot.docs
        .where((document) => document.data()['userID'] == userID);

    return documents
        .map((e) => Transaction(
          e.data()['userID'] as String,
          e.data()['title'] as String,
          e.data()['subtitle'] as String,
          e.data()['amount'] as int,
          DateTime.fromMillisecondsSinceEpoch(e.data()['time'] as int),
          e.data()['picture'] as String
          ))
        .toList();
  }
}