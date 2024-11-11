import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomy_timer/utils/routes.dart';
import 'package:tomy_timer/views/home/cubit/home_cubit.dart';
import 'package:tomy_timer/views/meeting/clock/cubit/clock_cubit.dart';
import 'package:tomy_timer/views/meeting/cubit/meeting_cubit.dart';
import 'package:tomy_timer/views/settings/cubit/settings_cubit.dart';
import 'package:tomy_timer/views/views.dart';
import 'package:flutter/material.dart';

class TomyTimerRouteHandling {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case TomyTimerRoutes.home:
        return _goHome(settings);
      case TomyTimerRoutes.meeting:
        return _goMeeting(settings);
      case TomyTimerRoutes.report:
        return _goReport(settings);
      case TomyTimerRoutes.pastMeetings:
        return _goPastMeetings(settings);
      case TomyTimerRoutes.settings:
        return _goSettings(settings);
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

  static Route<dynamic> _goHome(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return BlocProvider(
        create: (context) => HomeCubit()..load(),
        child: const HomeScreen(),
      );
    });
  }

  static Route<dynamic> _goMeeting(RouteSettings settings) {
    int? meetingId;
    if (settings.arguments != null) {
      Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      meetingId = args["id"];
    }
    return MaterialPageRoute(builder: (context) {
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ClockCubit()..load(),
          ),
          BlocProvider(
            create: (context) => MeetingCubit()..load(meetingId),
          ),
        ],
        child: const MeetingScreen(),
      );
    });
  }

  static Route<dynamic> _goReport(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return const ReportScreen();
    });
  }

  static Route<dynamic> _goPastMeetings(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return const PastMeetingsScreen();
    });
  }

  static Route<dynamic> _goSettings(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return BlocProvider(
        create: (context) => SettingsCubit(),
        child: const SettingsScreen(),
      );
    });
  }
}
