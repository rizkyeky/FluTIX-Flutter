part of 'service.dart';

class AuthService {
  final fire_auth.FirebaseAuth _auth = fire_auth.FirebaseAuth.instance;
  final UserService _userService = UserService();

  bool _isSignIn = false;
  bool get isSignIn => _isSignIn;

  Future<void> init() async {
    final fire_auth.User user = await _auth.authStateChanges().first;
    _isSignIn = user != null;
  }

  Stream<bool> isSignInStream() async* {
    await for (final fire_auth.User user in _auth.authStateChanges()) {
      yield user != null;
    }
  }

  Future<AuthResult> signUp(String name, String email, String password, 
  {List<String> favoriteGenre = const [], List<String> favoriteCountry = const []}) async {

    try {
      final fire_auth.UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
      
      final User user = await _userService.setUser(User(
        result.user.uid,
        name,
        email,
        '',
        favoriteGenre,
        favoriteCountry
      ));  
      
      return AuthResult(user: user);
    
    } on fire_auth.FirebaseAuthException catch (e) {
      
      String errorType;
      
      if (e.code == 'weak-password') {
        errorType = 'Password is too weak';
      }
      else if (e.code == 'email-already-in-use') {
        errorType = 'Email is already in use';
      }
      
      return AuthResult(message: errorType);
    
    } catch (e) {
      return AuthResult(message: 'Error signUp: $e');
    }
  }

  Future<AuthResult> signIn(String email, String password) async {
    try {
      final fire_auth.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
      
      final User user = User.initial(); // await _userService.getUser(result.user.uid);
      return AuthResult(user: user);

    } catch (e) {
      return AuthResult(message: 'Error signIn: $e');
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class AuthResult {
  final User user;
  final String message;

  AuthResult({this.user, this.message});
}