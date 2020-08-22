part of 'service.dart';

class AuthService {
  final fire_auth.FirebaseAuth _auth = fire_auth.FirebaseAuth.instance;
  final UserService _userService = UserService();

  Future<bool> isSignIn() async {

    final fire_auth.User user = await _auth.authStateChanges().first;
 
    if (user != null) {
      return true;
    }
    else {
      return false;
    }
  }

  Stream<bool> isSignInStream() async* {
    await for (final fire_auth.User user in _auth.authStateChanges()) {
      yield user != null;
    }
  }

  Future<AuthResult> signUp(String name, String email, String password, 
  List<String> favoriteGenre, List<String> favoriteCountry) async {

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
        errorType = 'password is too weak';
      }
      else if (e.code == 'email-already-in-use') {
        errorType = 'email is already in use';
      }
      
      return AuthResult(message: 'Error signUp: $errorType');
    
    } catch (e) {
      return AuthResult(message: 'Error signUp: $e');
    }
  }

  Future<AuthResult> signIn(String email, String password) async {
    try {
      final fire_auth.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
      
      final User user = await _userService.getUser(result.user.uid);
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