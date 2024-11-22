part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeValid extends HomeState{

  final EMeeting? currentMeeting;
  final List<ETemplate> templates;

  const HomeValid({required this.currentMeeting, required this.templates});

  @override
  List<Object?> get props => [currentMeeting];
  
}

final class HomeLoading extends HomeValid{
  const HomeLoading({required super.currentMeeting, required super.templates});
}

final class HomeInvalid extends HomeState{}