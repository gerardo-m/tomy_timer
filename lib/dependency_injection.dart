import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/repositories/meeting_items_repository.dart';
import 'package:tomy_timer/repositories/meetings_repository.dart';
import 'package:tomy_timer/repositories/reports_repository.dart';
import 'package:tomy_timer/repositories_isar/meeting_items_repository_isar.dart';
import 'package:tomy_timer/repositories_isar/meetings_repository_isar.dart';
import 'package:tomy_timer/repositories_isar/reports_repository_isar.dart';
import 'package:tomy_timer/services/meeting_items_service.dart';
import 'package:tomy_timer/services/meetings_service.dart';
import 'package:tomy_timer/services/reports_service.dart';
import 'package:tomy_timer/utils/utils.dart';

final di = GetIt.instance;

/// Use this method to register singletons and other services
/// for your app, e.g. Firebase, ads
Future<bool?> setup() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupIsar();

  di.registerLazySingleton<MeetingsRepository>(() => MeetingsRepositoryIsar(di()));
  di.registerLazySingleton<MeetingItemsRepository>(() => MeetingItemsRepositoryIsar(di()));
  di.registerLazySingleton<ReportsRepository>(() => ReportsRepositoryIsar(di()));

  // Register your services here
  di.registerLazySingleton<MeetingsService>(() => MeetingsService(di()));
  di.registerLazySingleton<MeetingItemsService>(() => MeetingItemsService(di(), di()));
  di.registerLazySingleton<ReportsService>(() => ReportsService(di(), di(), di(), di()));
  return true;
}

Future<Isar> setupIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open(
    [
      MeetingSchema,
      MeetingItemSchema,
    ],
    directory: dir.path,
    name: Constants.dbName,
  );
  di.registerSingleton<Isar>(
    isar,
    dispose: (param) async => await isar.close(),
  );
  return isar;
}
