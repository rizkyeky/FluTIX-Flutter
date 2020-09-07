import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart' as fire_auth;
import 'package:cloud_firestore/cloud_firestore.dart'  as fire_store;
import 'package:firebase_core/firebase_core.dart' as fire_core;
import 'package:http/http.dart' as http;

// import 'package:flutix_training/extension/extension.dart';

import 'package:flutix_training/model/model.dart';
import 'package:flutix_training/share/share.dart';
import 'package:flutix_training/locator.dart';

part 'service_auth.dart';
part 'service_user.dart';
part 'service_core.dart';
part 'service_movie.dart';
part 'service_ticket.dart';
part 'service_local.dart';