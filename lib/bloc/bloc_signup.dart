part of 'bloc.dart';

class SignUpBloc implements Bloc {
  @override
  void dispose() {
  }

  @override
  Future<void> init() async {
  }

  final BehaviorSubject<bool> _loadingController = BehaviorSubject();
  Stream<bool> get loadingStream => _loadingController.stream;

  
}