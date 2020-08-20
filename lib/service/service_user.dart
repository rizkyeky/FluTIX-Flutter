part of 'service.dart';

class UserService {
  static CollectionReference _userCollection = FirebaseFirestore.instance.collection('user'); 

  static Future<void> updateUser(model.User user) async {
    String genres = '';

    for (String genre in user.favoriteGenre) {
      genres += (genre != user.favoriteGenre.last) ? ',' : '';
    }

    String countries = '';

    for (String country in user.favoriteGenre) {
      countries += (country != user.favoriteGenre.last) ? ',' : '';
    }

    await _userCollection.doc(user.id).set({
      'email': user.email,
      'name': user.name,
      'photoURL': user.photoURL,
      'favoriteGenre': genres,
      'favoriteCountry': countries,
    });
  }

  static Future<model.User> getUser(String id) async {
    DocumentSnapshot snapshot = await _userCollection.doc(id).get();

    return model.User(
      id,
      snapshot.data()["name"],
      snapshot.data()["email"],
      snapshot.data()["photoURL"],
      (snapshot.data()['favoriteGenre'] as String)
        .split(','),
      (snapshot.data()['favoriteCountry'] as String)
        .split(','),
    );

  }
}