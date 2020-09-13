part of 'bloc.dart';

class EditProfileBloc implements Bloc {

  final User user = locator.get<User>(instanceName: 'User Active');
  final AuthService _auth = locator.get<AuthService>(instanceName: 'Auth Service');
  final UserService _userService = locator.get<UserService>(instanceName: 'User Service');
  
  File _profilePicture;
  File get profileImage => _profilePicture;

  @override
  void dispose() {}

  @override
  Future<void> init() async {}

  Future<void> resetPassword() async {
    _auth.resetPassword(user.email);
  }

  Future<void> updateUser(String name, String email) async {
    user.copyWith(name: name, email: email);
    await _userService.updateUser(user.id, name: name, email: email);
  }

  Future<void> setProfilePicture() async {
    await getImage().then((value) async {
      _profilePicture = value;
      await uploadImage(_profilePicture).then((url) => 
        user.copyWith(photoURL: url)
      );
    }).catchError((e) {});
  }
}