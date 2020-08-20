part of 'service.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<AuthResult> signUp(String name, String email,
  String password, List<String> favoriteGenre, List<String> favoriteCountry) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password
      );
      model.User user = result.user.convertToUser(name, favoriteGenre, favoriteCountry);
      await UserService.updateUser(user);
      return AuthResult(user: user);
    } catch (e) {
      return AuthResult(massage: e.toString());
    }
  }

  static Future<AuthResult> signIn(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email, password: password
      );
      model.User user = await result.user.fromFireStore();
      
      return AuthResult(user: user);
    } catch (e) {
      return AuthResult(massage: e.toString());
    }
  }

}

class AuthResult {
  final model.User user;
  final String massage;

  AuthResult({this.user, this.massage});
}