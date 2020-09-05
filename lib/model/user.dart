part of 'model.dart';

class User{
  final String id;
  final String name;
  final String email;
  // final String password;
  final String photoURL;
  final List<String> favoriteGenre; 
  final List<String> favoriteCountry;

  const User(this.id, this.name, this.email,
  this.photoURL, this.favoriteGenre, this.favoriteCountry);

  factory User.initial() => const User(
    '','','','',[],[] 
  );

  @override
  String toString() => '$id - $name, $email';
}