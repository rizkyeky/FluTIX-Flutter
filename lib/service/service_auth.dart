part of 'service.dart';

class AuthService {
  static fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;

  static Future<AuthResult> signUp(String name, String email,
  String password, List<String> favoriteGenre, List<String> favoriteCountry) async {
    try {
      fireAuth.UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password
      );
      User user = result.user.convertToUser(name, favoriteGenre, favoriteCountry);
      await UserService.updateUser(user);
      return AuthResult(user: user);
    } catch (e) {
      return AuthResult(massage: e.toString());
    }
  }

  static Future<AuthResult> signIn(String email, String password) async {
    try {
      fireAuth.UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password
      );
      User user = await result.user.fromFireStore();
      
      return AuthResult(user: user);
    } catch (e) {
      return AuthResult(massage: e.toString());
    }
  }
}

class AuthResult {
  final User user;
  final String massage;

  AuthResult({this.user, this.massage});
}