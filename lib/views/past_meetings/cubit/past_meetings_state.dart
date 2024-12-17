part of 'past_meetings_cubit.dart';

sealed class PastMeetingsState extends Equatable {
  const PastMeetingsState();

  @override
  List<Object?> get props => [];
}

final class PastMeetingsInitial extends PastMeetingsState {}

final class PastMeetingsValid extends PastMeetingsState{

  @override
  List<Object?> get props => [];
}

final class PastMeetingsLoading extends PastMeetingsValid{}

final class PastMeetingsInvalid extends PastMeetingsState{}