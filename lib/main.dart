import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomy_timer/utils/theme.dart';
import 'package:tomy_timer/utils/route_handling.dart';
import 'package:tomy_timer/views/meeting/clock/cubit/clock_cubit.dart';
import 'package:tomy_timer/views/meeting/cubit/meeting_cubit.dart';

import 'dependency_injection.dart' as di;

void main() async {
  await di.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ClockCubit()..load(),
        ),
        BlocProvider(
          create: (context) => MeetingCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Project Demo',
        theme: TomyTimerTheme.lightTheme,
        darkTheme: TomyTimerTheme.darkTheme,
        onGenerateRoute: TomyTimerRouteHandling.onGenerateRoute,
      ),
    );
  }
}
