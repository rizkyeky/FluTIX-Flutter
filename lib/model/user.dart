part of 'model.dart';

class User{
  String id;
  String name;
  String email;
  // final String password;
  String photoURL;
  List<String> favoriteGenre; 
  List<String> favoriteCountry;

  User(this.id, this.name, this.email,
  this.photoURL, this.favoriteGenre, this.favoriteCountry);

  factory User.initial() => User(
    '','','','',[],[] 
  );

  @override
  String toString() => '$id - $name, $email';

  void copyWith({
    String id,
    String name,
    String email,
    String photoURL, 
    List<String> favoriteGenre,
    List<String> favoriteCountry
  }) {
    this.id = id ?? this.id;
    this.name = name ?? this.name;
    this.email = email ?? this.email;
    this.photoURL = photoURL ?? this.photoURL;
    this.favoriteGenre = favoriteGenre ?? this.favoriteGenre;
    this.favoriteCountry = favoriteCountry ?? this.favoriteCountry;
  }

  void duplicate(User user) {
    id = user.id;
    name = user.name;
    email = user.email;
    photoURL = user.photoURL;
    favoriteGenre = user.favoriteGenre;
    favoriteCountry = user.favoriteCountry;
  }
}