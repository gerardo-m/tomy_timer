part of 'meeting_cubit.dart';

sealed class MeetingState extends Equatable {
  const MeetingState();

  @override
  List<Object> get props => [];
}

final class MeetingInitial extends MeetingState {}

final class MeetingValid extends MeetingState{
  final EMeeting meeting;
  final List<EMeetingItem> meetingItems;
  final int selectedItem;

  const MeetingValid({required this.meeting, required this.meetingItems, required this.selectedItem,});

  @override
  List<Object> get props => [meeting, meetingItems, selectedItem];
}

final class MeetingLoading extends MeetingValid{
  const MeetingLoading({required super.meeting, required super.meetingItems, required super.selectedItem,});
}

final class MeetingInvalid extends MeetingState{}