part of 'bloc.dart';

class EditProfileBloc implements Bloc {

  final User user = locator.get<User>(instanceName: 'User Active');
  
  @override
  void dispose() {}

  @override
  Future<void> init() async {}

}