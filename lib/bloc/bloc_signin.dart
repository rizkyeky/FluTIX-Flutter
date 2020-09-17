part of 'bloc.dart';

class SignInBloc implements Bloc {

  final AuthService _authService = locator.get<AuthService>(instanceName: 'Auth Service');

  @override
  void dispose() {
    _loadingController.close();
  }

  @override
  void init() {
    _loadingController.sink.add(false);
  }

  final BehaviorSubject<bool> _loadingController = BehaviorSubject();
  Stream<bool> get isLoadingStream => _loadingController.stream;


  Future<String> signIn(String name, String password) async {
    _loadingController.sink.add(true);
    final AuthResult result = await _authService.signIn(
      name, password).whenComplete(() => _loadingController.sink.add(false));

    if (result.user != null) {
      locator.call<User>(instanceName: 'User Active').duplicate(result.user);
      return 'User Active';
    }
    else {
      return result.message;
    }
  }


  
}