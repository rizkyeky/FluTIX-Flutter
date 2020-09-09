part of 'bloc.dart';

class CheckoutBloc implements Bloc {

  bool isInit = false;

  final DateTime _thisDate = DateTime.now();
  DateTime get thisDate => _thisDate;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<void> init() async {
  }
}