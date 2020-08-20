part of 'service.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  static Future signUp(String name, String email,
  String password, List<String> favoriteGenre, List<String> favoriteCountry) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password
      );
    } catch (e) {

    }
  }
}