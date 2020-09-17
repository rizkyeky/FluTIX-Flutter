part of 'bloc.dart';

class SignUpBloc implements Bloc {

  
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

  Future<String> signUp(String name, String email, String password) async {
    _loadingController.sink.add(true);
    final AuthResult result = await _authService.signUp(
      name, email, password)
      .whenComplete(() => _loadingController.sink.add(false));

    if (result.user != null) {
      locator.call<User>(instanceName: 'User Active').duplicate(result.user);
      return 'User added';
    }
    else {
      return result.message;
    }
  } 
}