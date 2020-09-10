part of 'bloc.dart';

class ProfileBloc implements Bloc {

  final User user = locator.get<User>(instanceName: 'User Active');
  final AuthService _authService = locator.get<AuthService>(instanceName: 'Auth Service');

  final BehaviorSubject<File> _profilePictureController = BehaviorSubject();
  Stream<File> get profilePictureStream => _profilePictureController.stream;

  File _profileImage;
  File get profileImage => _profileImage;

  @override
  void dispose() {
    _profilePictureController.close();
  }

  @override
  Future<void> init() async {
    
  }

  Future<void> setProfilePicture() async {
    await getImage().then((image) async {
      user.photoURL = await uploadImage(image);
      _profilePictureController.sink.add(image);
    });
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}