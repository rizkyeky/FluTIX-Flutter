// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutix_training/main.dart';
import 'package:flutix_training/service/service.dart';

Future<void> main() async {
  
  DateTime _thisDate = DateTime.now();
  List<Map<String, dynamic>> _daysInWeek = [];


  void getDaysInWeek() {

    final Map<String, dynamic> day = {};
    
    int date = _thisDate.day;
    int weekday = _thisDate.weekday;

    final lastDateOfThisMonth = DateTime(_thisDate.year, _thisDate.month, 0);

    for (int i = 0; i < 7 ; i++) {

      if (weekday > 7) {
        weekday = 1;
      }

      if (date > lastDateOfThisMonth.day) {
        date = 1;
      }
      
      switch (weekday) {
        case 1: 
          day['name'] = 'Mon';
          break;
        case 2: 
          day['name'] = 'Tus';
          break;
        case 3: 
          day['name'] = 'Wed';
          break;
        case 4: 
          day['name'] = 'Thus';
          break;
        case 5: 
          day['name'] = 'Fri';
          break;
        case 6: 
          day['name'] = 'Sat';
          break;
        default: day['name'] = 'Sun';
      }
        day['date'] = date;
        
        print(day);
        
        _daysInWeek.add(day);
        
        weekday++;
        date++;
    }
  }
    getDaysInWeek();

  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget( const App(isSignIn: true));

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
