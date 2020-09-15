library page;

// import 'dart:io';

import 'package:flutix_training/bloc/bloc.dart';
import 'package:flutix_training/locator.dart';
import 'package:flutix_training/view/component/component.dart';
import 'package:flutix_training/model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutix_training/share/share.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:intl/intl.dart';

part 'page_signin.dart';
part 'page_signup.dart';
part 'page_preference.dart';
part 'page_home.dart';
part 'page_detailmovie.dart';
part 'page_book_time.dart';
part 'page_book_seat.dart';
part 'page_checkout.dart';
part 'page_maintabbar.dart';
part 'page_success_checkout.dart';
part 'page_profile.dart';
part 'page_editprofile.dart';
part 'page_myticket.dart';
part 'page_ticketdetail.dart';
// part 'page_test.dart';

SnackBar snackBar({
  String contentText, String labelText, VoidCallback onPressed
}) => SnackBar(
  content: Text(contentText),
  action: SnackBarAction(
    label: labelText,
    onPressed: onPressed,
  ),
);

abstract class Page<T extends Bloc> extends StatefulWidget {

  final T bloc = locator<T>();
  
  Page({
    Key key,
  }) : super(key: key);

  @override
  _PageState<T> createState() => _PageState<T>();

  @protected
  void init();

  @protected
  void dispose();

  @protected
  Widget build(BuildContext context);
}

class _PageState<T extends Bloc> extends State<Page<T>> {
  
  @override
  void initState() {
    if (widget.init != null) {
      widget.init();
      widget.bloc.init();
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.dispose != null) {
      widget.dispose();
      widget.bloc.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.build(context);
  }
}