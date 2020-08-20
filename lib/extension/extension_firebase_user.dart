part of 'extension.dart';

extension FirebaseUserExtension on User {
  model.User convertToUser(String name, List<String> favoriteGenre, List<String> favoriteCountry) => 
  model.User(uid, name, email, photoURL, favoriteGenre, favoriteCountry);

  Future<model.User> fromFireStore() async => await UserService.getUser(this.uid);
}