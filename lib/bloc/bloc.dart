import 'dart:async';

import 'package:flutix_training/model/model.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutix_training/service/service.dart';

part 'bloc_sigin.dart';
part 'bloc_sigup.dart';
part 'bloc_home.dart';
part 'bloc_maintabbar.dart';
part 'bloc_detailmovie.dart';
part 'bloc_booktime.dart';
part 'bloc_bookseat.dart';
part 'bloc_test.dart';
part 'bloc_checkout.dart';

abstract class Bloc {
  Future<void> init();
  void dispose();
}