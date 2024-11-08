part of 'meeting_cubit.dart';

sealed class MeetingState extends Equatable {
  const MeetingState();

  @override
  List<Object> get props => [];
}

final class MeetingInitial extends MeetingState {}

final class MeetingValid extends MeetingState{
  final EMeeting meeting;

  const MeetingValid({required this.meeting});
}

final class MeetingLoading extends MeetingValid{
  const MeetingLoading({required super.meeting});
}

final class MeetingInvalid extends MeetingState{}