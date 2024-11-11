part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object?> get props => [];
}

final class HomeInitial extends HomeState {}

final class HomeValid extends HomeState{

  final EMeeting? currentMeeting;

  const HomeValid({required this.currentMeeting});

  @override
  List<Object?> get props => [currentMeeting];
  
}

final class HomeLoading extends HomeValid{
  const HomeLoading({required super.currentMeeting});
}

final class HomeInvalid extends HomeState{}