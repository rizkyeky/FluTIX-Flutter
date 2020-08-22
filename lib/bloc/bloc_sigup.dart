part of 'bloc.dart';

class SignUpBloc {
  final BehaviorSubject<bool> _isLoadingController = BehaviorSubject();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

  SignUpBloc() {
    _isLoadingController.listen((value) {
      print(value);
    });
  }

  Future<void> setLoading(bool val) async {
    _isLoadingController.sink.add(val);    
  }
}