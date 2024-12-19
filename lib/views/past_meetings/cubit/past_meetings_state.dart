part of 'past_meetings_cubit.dart';

sealed class PastMeetingsState extends Equatable {
  const PastMeetingsState();

  @override
  List<Object> get props => [];
}

final class PastMeetingsInitial extends PastMeetingsState {}

final class PastMeetingsValid extends PastMeetingsState{

  final List<EReport> pastMeetings;

  const PastMeetingsValid({required this.pastMeetings});

  @override
  List<Object> get props => [pastMeetings];
}

final class PastMeetingsLoading extends PastMeetingsValid{
  const PastMeetingsLoading({required super.pastMeetings});
}

final class PastMeetingsInvalid extends PastMeetingsState{}