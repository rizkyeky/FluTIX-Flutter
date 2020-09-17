part of 'bloc.dart';

class MyTransactionBloc implements Bloc {

  final TransactionService _transactionService = locator.get<TransactionService>(instanceName: 'Transaction Service');
  final User user = locator.get<User>(instanceName: 'User Active');

  @override
  void dispose() {
  }

  @override
  void init() {
  }

  Future<List<Transaction>> getTransactions() async {
    return _transactionService.getTransaction(user.id);
  }
}