import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:tomy_timer/utils/utils.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

import 'package:tomy_timer/dependency_injection.dart' as di;
import 'package:tomy_timer/views/widgets/rich_bloc_consumer.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsValid());

  Future<void> resetDb()async{
    _loading();
    final Isar isar = Isar.getInstance(Constants.dbName)!;
    await isar.writeTxn(() async{
      await isar.clear();
    });
    await _resetIsar();
    emit(SettingsValid());
  }

  Future<void> _resetIsar()async{
    await GetIt.instance.unregister<Isar>();
    await GetIt.instance.reset();
    await di.setup();
  }

  void _loading(){
    SettingsState currentState = state;
    if (currentState is SettingsValid){
      emit(SettingsLoading()); 
    }
  }
  
}

class SettingsBlocBuilder extends RichBlocBuilder<SettingsCubit, SettingsState, SettingsValid, SettingsInvalid, SettingsLoading>{
  const SettingsBlocBuilder({super.key, required super.builder});
}

class SettingsBlocConsumer extends RichBlocConsumer<SettingsCubit, SettingsState, SettingsValid, SettingsInvalid, SettingsLoading>{
  const SettingsBlocConsumer({super.key, required super.builder, required super.listener, super.buildWhen, super.listenWhen});
}