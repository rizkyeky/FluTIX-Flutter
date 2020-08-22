part of 'service.dart';

class UserService {
  final fire_store.CollectionReference _userCollection = fire_store.FirebaseFirestore
    .instance.collection('user'); 

  Future<User> setUser(User user) async {

    final StringBuffer genres = StringBuffer();
    for (final String genre in user.favoriteGenre) {
      genres.write(genre + ((genre != user.favoriteGenre.last) ? ',' : ''));
    }

    final StringBuffer countries = StringBuffer();
    for (final String country in user.favoriteCountry) {
      countries.write(country + ((country != user.favoriteCountry.last) ? ',' : ''));
    }

    await _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'photoURL': user.photoURL,
      'favoriteGenre': genres,
      'favoriteCountry': countries.toString(),
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