import 'package:flutter/material.dart';
import 'package:tomy_timer/utils/theme.dart';
import 'package:tomy_timer/utils/route_handling.dart';

import 'dependency_injection.dart' as di;

  void main() async{
    await di.setup();
    runApp(const MyApp());
  }
  
  class MyApp extends StatelessWidget {
    const MyApp({super.key});
  
    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
      return MaterialApp(
        title: 'Flutter Project Demo',
        theme: TomyTimerTheme.darkTheme,
        // darkTheme: TomyTimerTheme.darkTheme,
        onGenerateRoute: TomyTimerRouteHandling.onGenerateRoute,
      );
    }
  }