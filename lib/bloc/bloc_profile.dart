part of 'bloc.dart';

class ProfileBloc implements Bloc {

  final User user = locator.get<User>(instanceName: 'User Active');
  final AuthService _authService = locator.get<AuthService>(instanceName: 'Auth Service');

  final BehaviorSubject<File> _profilePictureController = BehaviorSubject();
  Stream<File> get profilePictureStream => _profilePictureController.stream;

  File _profilePicture;
  File get profileImage => _profilePicture;

  @override
  void dispose() {
    _profilePictureController.close();
  }

  @override
  Future<void> init() async {
    
  }

  Future<void> setProfilePicture() async {
    _profilePicture = await getImage();
    if (_profilePicture != null) {
      _profilePictureController.sink.add(_profilePicture);
    } else {
      _profilePicture = File(basename('assets/no_image.png'));
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}