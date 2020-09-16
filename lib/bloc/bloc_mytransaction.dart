part of 'bloc.dart';

class MyTransactionBloc implements Bloc {

  final TransactionService _transactionService = TransactionService();
  final User user = locator.get<User>(instanceName: 'User Active');

  @override
  void dispose() {
  }

  @override
  Future<void> init() async {
  }

  Future<List<Transaction>> getTransactions() async {
    return _transactionService.getTransaction(user.id);
  }

}