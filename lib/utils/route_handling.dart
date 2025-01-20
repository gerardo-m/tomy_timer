import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomy_timer/utils/routes.dart';
import 'package:tomy_timer/views/home/cubit/home_cubit.dart';
import 'package:tomy_timer/views/meeting/cubit/meeting_cubit.dart';
import 'package:tomy_timer/views/past_meetings/cubit/past_meetings_cubit.dart';
import 'package:tomy_timer/views/report/cubit/report_cubit.dart';
import 'package:tomy_timer/views/settings/cubit/settings_cubit.dart';
import 'package:tomy_timer/views/template/cubit/template_cubit.dart';
import 'package:tomy_timer/views/template_item/cubit/template_item_cubit.dart';
import 'package:tomy_timer/views/templates/cubit/templates_cubit.dart';
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
      case TomyTimerRoutes.templates:
        return _goTemplates(settings);
      case TomyTimerRoutes.template:
        return _goTemplate(settings);
      case TomyTimerRoutes.templateItem:
        return _goTemplateItem(settings);
      case TomyTimerRoutes.qrCode:
        return _goQrCode(settings);
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
      context.read<MeetingCubit>().load(meetingId);
      return const MeetingScreen();
    });
  }

  static Route<dynamic> _goReport(RouteSettings settings) {
    int? meetingId;
    int? reportId;
    if (settings.arguments != null) {
      Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      reportId = args["id"];
      meetingId = args["meeting_id"];
    }
    if (reportId != null) {
      return MaterialPageRoute(builder: (context) {
        return BlocProvider(
          create: (context) => ReportCubit()..load(reportId!),
          child: const ReportScreen(),
        );
      });
    } else {
      return MaterialPageRoute(builder: (context) {
        return BlocProvider(
          create: (context) => ReportCubit()..generate(meetingId ?? -1),
          child: const ReportScreen(),
        );
      });
    }
  }

  static Route<dynamic> _goPastMeetings(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return BlocProvider(
        create: (context) => PastMeetingsCubit()..load(),
        child: const PastMeetingsScreen(),
      );
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

  static Route<dynamic> _goTemplates(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return BlocProvider(
        create: (context) => TemplatesCubit()..load(),
        child: const TemplatesScreen(),
      );
    });
  }

  static Route<dynamic> _goTemplate(RouteSettings settings) {
    int? templateId;
    if (settings.arguments != null) {
      Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      templateId = args["id"];
    }
    return MaterialPageRoute(builder: (context) {
      return BlocProvider(
        create: (context) => TemplateCubit()..load(templateId),
        child: const TemplateScreen(),
      );
    });
  }

  static Route<dynamic> _goTemplateItem(RouteSettings settings) {
    int? id;
    if (settings.arguments != null) {
      Map<String, dynamic> args = settings.arguments as Map<String, dynamic>;
      id = args["id"];
    }
    return MaterialPageRoute(builder: (context) {
      return BlocProvider(
        create: (context) => TemplateItemCubit()..load(id),
        child: const TemplateItemScreen(),
      );
    });
  }

  static Route<dynamic> _goQrCode(RouteSettings settings) {
    return MaterialPageRoute(builder: (context) {
      return const QrCodeScreen();
    });
  }
}
