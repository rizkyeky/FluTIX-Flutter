part of 'service.dart';

class UserService {
  final fire_store.CollectionReference _userCollection = fire_store.FirebaseFirestore
    .instance.collection('user'); 

  Future<User> setUser(User user) async {

    final String genres = user.favoriteGenre.join(',');
    final String countries = user.favoriteCountry.join(',');

    await _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'photoURL': user.photoURL,
      'favoriteGenre': genres,
      'favoriteCountry': countries,
    });

    return user;
  }

  Future<User> getUser(String id) async {
    final fire_store.DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return User(
      id,
      snapshot.data()["name"] as String,
      snapshot.data()["email"] as String,
      snapshot.data()["photoURL"] as String,
      snapshot.data()['favoriteGenre']
        .split(',') as List<String>,
      snapshot.data()['favoriteCountry']
        .split(',') as List<String>,
    );
  }
}