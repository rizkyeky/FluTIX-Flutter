part of 'bloc.dart';

class SignUpBloc implements Bloc {

  
  final AuthService _authService = locator.get<AuthService>(instanceName: 'Auth Service');

  @override
  void dispose() {
  }

  @override
  Future<void> init() async {
  }

  final BehaviorSubject<bool> _loadingController = BehaviorSubject();
  Stream<bool> get loadingStream => _loadingController.stream;

  // final Map<String, String> _registerData = {};

  Future<void> signUp(String name, String email, String password) async {
    final AuthResult result = await _authService.signUp(
      name, email, password);

    if (result.user != null) {
      print('user added');
    }
    else {
      print(result.message);
    }
  } 
}