part of 'service.dart';

class AuthService {
  static fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;
  static Stream<fireAuth.User> get userAuth => _auth.authStateChanges();

  static Future<bool> isSignIn() async {

    fireAuth.User user = await _auth.authStateChanges().first;
 
    if (user != null) return true;
    else return false;
  }

  static Stream<bool> isSignInStream() async* {
    await for (var user in _auth.authStateChanges()) {
      yield (user != null) ? true : false;
    }
  }

  static Future<AuthResult> signUp(String name, String email, String password, 
  List<String> favoriteGenre, List<String> favoriteCountry) async {

    try {
      fireAuth.UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
      
      User user = await UserService.setUser(User(
        result.user.uid,
        name,
        email,
        '',
        favoriteGenre,
        favoriteCountry
      ));  
      
      return AuthResult(user: user);
    
    } on fireAuth.FirebaseAuthException catch (e) {
      String errorType;
      
      if (e.code == 'weak-password') 
        errorType = 'password is too weak';
      else if (e.code == 'email-already-in-use') 
        errorType = 'email is already in use';
      
      return AuthResult(message: 'Error signUp: ' + errorType);
    
    } catch (e) {
      return AuthResult(message: 'Error signUp: ' + e.toString());
    }
  }

  static Future<AuthResult> signIn(String email, String password) async {
    try {
      fireAuth.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
      
      User user = await UserService.getUser(result.user.uid);
      return AuthResult(user: user);

    } catch (e) {
      return AuthResult(message: 'Error signIn: ' + e.toString());
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }
}

class AuthResult {
  final User user;
  final String message;

  AuthResult({this.user, this.message});
}