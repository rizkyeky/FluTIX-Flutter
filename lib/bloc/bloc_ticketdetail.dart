part of 'bloc.dart';

class TicketDetailBloc implements Bloc {

  User user = locator.get<User>(instanceName: 'User Active');

  @override
  void dispose() {}

  @override
  void init() {}

}