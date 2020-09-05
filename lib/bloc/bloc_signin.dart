part of 'bloc.dart';

class SignInBloc implements Bloc {

  final AuthService _authService = locator.get<AuthService>(instanceName: 'Auth Service');

  @override
  void dispose() {
  }

  @override
  Future<void> init() async {
  }

  final BehaviorSubject<bool> _loadingController = BehaviorSubject();
  Stream<bool> get loadingStream => _loadingController.stream;

  final Map<String, String> _registerData = {};

  Future<void> signIn(String name, String password) async {
    AuthResult result = await _authService.signIn(
      name, password);
    
    if (result.user != null) {
      print('user valid');
    }
    else {
      print(result.message);
    }
  } 
  
}