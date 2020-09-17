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
  void init() {}

  Future<void> signOut() async {
    await _authService.signOut();
  }
}