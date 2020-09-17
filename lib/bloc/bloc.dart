import 'dart:io';
import 'dart:math';

import 'package:flutix_training/model/model.dart';
import 'package:flutix_training/share/share.dart';
import 'package:rxdart/rxdart.dart';

import 'package:flutix_training/service/service.dart';
import 'package:flutix_training/locator.dart';

part 'bloc_signin.dart';
part 'bloc_signup.dart';
part 'bloc_home.dart';
part 'bloc_maintabbar.dart';
part 'bloc_detailmovie.dart';
part 'bloc_booktime.dart';
part 'bloc_bookseat.dart';
part 'bloc_test.dart';
part 'bloc_checkout.dart';
part 'bloc_preference.dart';
part 'bloc_profile.dart';
part 'bloc_editprofile.dart';
part 'bloc_myticket.dart';
part 'bloc_ticketdetail.dart';
part 'bloc_mytransaction.dart';
part 'bloc_search.dart';

abstract class Bloc {
  Future<void> init();
  void dispose();
}