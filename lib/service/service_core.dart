part of 'service.dart';

class CoreService {
  static fireCore.FirebaseApp _app;

  static Future<void> init() async {
    _app = await fireCore.Firebase.initializeApp();
  }
}