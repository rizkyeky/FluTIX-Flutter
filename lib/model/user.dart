part of 'model.dart';

class User extends Equatable{
  final String id;
  final String name;
  final String email;
  final String password;
  final String photoURL;
  final List<String> favoriteGenre; 
  final List<String> favoriteCountry;

  User(this.id, this.name, this.email, this.password,
  this.photoURL, this.favoriteGenre, this.favoriteCountry);

  @override
  List<Object> get props => [
    id, name, email, password, photoURL, favoriteGenre, favoriteCountry
  ];
}