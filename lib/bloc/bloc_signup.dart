part of 'bloc.dart';

class SignUpBloc implements Bloc {

  
  final AuthService _authService = AuthService();

  @override
  void dispose() {
  }

  @override
  Future<void> init() async {
  }

  final BehaviorSubject<bool> _loadingController = BehaviorSubject();
  Stream<bool> get loadingStream => _loadingController.stream;

  final Map<String, String> _registerData = {};

  Future<void> signUp() async {
    AuthResult result = await _authService.signUp(
      _registerData['name'], _registerData['email'], _registerData['password']);
  

  } 
}