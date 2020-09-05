part of 'bloc.dart';

class SignInBloc implements Bloc {

  final AuthService _authService = locator.get<AuthService>(instanceName: 'Auth Service');

  @override
  void dispose() {
    _loadingController.close();
  }

  @override
  Future<void> init() async {
    _loadingController.sink.add(false);
  }

  final BehaviorSubject<bool> _loadingController = BehaviorSubject();
  Stream<bool> get isLoadingStream => _loadingController.stream;

  // final Map<String, String> _registerData = {};

  Future<bool> signIn(String name, String password) async {
    _loadingController.sink.add(true);
    final AuthResult result = await _authService.signIn(
      name, password).whenComplete(() => _loadingController.sink.add(false));
    
    if (result.user != null) {
      print('user valid');
      return true;
    }
    else {
      print(result.message);
      return false;
    }
  }


  
}