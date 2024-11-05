import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final di = GetIt.instance;

/// Use this method to register singletons and other services
/// for your app, e.g. Firebase, ads
Future<bool?> setup() async{
  WidgetsFlutterBinding.ensureInitialized();

  // Register your services here
  return true;
}
  