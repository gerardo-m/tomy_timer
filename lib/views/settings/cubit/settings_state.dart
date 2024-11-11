part of 'settings_cubit.dart';

sealed class SettingsState extends Equatable {
  const SettingsState();

  @override
  List<Object> get props => [];
}

final class SettingsInitial extends SettingsState {}

final class SettingsValid extends SettingsState{}

final class SettingsLoading extends SettingsValid{}

final class SettingsInvalid extends SettingsState{}