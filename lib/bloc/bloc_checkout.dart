part of 'bloc.dart';

class CheckoutBloc implements Bloc {

  bool isInit = false;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  Future<void> init() async {
    if (!isInit) {
      isInit = true;
    }
  }

}