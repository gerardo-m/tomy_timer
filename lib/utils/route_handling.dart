import 'package:tomy_timer/utils/routes.dart';
import 'package:tomy_timer/views/views.dart';
import 'package:flutter/material.dart';

class TomyTimerRouteHandling{

  static Route<dynamic>? onGenerateRoute(RouteSettings settings){
    switch (settings.name) {
      case TomyTimerRoutes.home:
        return _goHome(settings);
      case TomyTimerRoutes.meeting:
        return _goMeeting(settings);
      default:
        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(child: Text('Route not Found')),
            );
          },
        );
    }
  }

  static Route<dynamic> _goHome(RouteSettings settings){
    return MaterialPageRoute(
      builder: (context){
        return const HomeScreen();
      }
    );
  }

  static Route<dynamic> _goMeeting(RouteSettings settings){
     return MaterialPageRoute(
      builder: (context){
        return const MeetingScreen();
      }
    );
  }
}
  