part of 'bloc.dart';

class HomeBloc {
  final BehaviorSubject<bool> _isLoadingController = BehaviorSubject();
  Stream<bool> get isLoadingStream => _isLoadingController.stream;

}