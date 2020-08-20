part of 'extension.dart';

extension FirebaseUserExtension on firebaseAuth.User {
  User convertToUser(String name, String password, List<String> favoriteGenre, List<String> favoriteCountry) => 
  User(uid, name, email, password, photoURL, favoriteGenre, favoriteCountry);
}