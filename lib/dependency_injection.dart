import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/repositories/meetings_repository.dart';
import 'package:tomy_timer/repositories_isar/meetings_repository_isar.dart';
import 'package:tomy_timer/services/meetings_service.dart';

final di = GetIt.instance;

/// Use this method to register singletons and other services
/// for your app, e.g. Firebase, ads
Future<bool?> setup() async{
  WidgetsFlutterBinding.ensureInitialized();
  await setupIsar();

  di.registerLazySingleton<MeetingsRepository>(() => MeetingsRepositoryIsar(di()),);

  // Register your services here
  di.registerLazySingleton<MeetingsService>(() => MeetingsService(di()));
  return true;
}

Future<Isar> setupIsar()async{
  final dir = await getApplicationDocumentsDirectory();
  final isar = await Isar.open([MeetingSchema], directory: dir.path);
  di.registerSingleton<Isar>(isar, dispose: (param) async => await isar.close(),);
  return isar;
}