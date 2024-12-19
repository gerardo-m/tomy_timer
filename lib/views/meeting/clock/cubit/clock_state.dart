part of 'clock_cubit.dart';

sealed class ClockState extends Equatable {
  const ClockState();

  @override
  List<Object?> get props => [];
}

final class ClockInitial extends ClockState {}

final class ClockValid extends ClockState{
  final Duration duration;
  final DateTime startTime;
  final Duration nextMilestone;
  final EMeetingItem? meetingItem;
  final Color color;

  const ClockValid({required this.duration, required this.startTime, required this.nextMilestone,  this.meetingItem, required this.color,});

  ClockValid copyWith({Duration? duration, DateTime? startTime, Duration? nextMilestone, EMeetingItem? meetingItem, Color? color}){
    return ClockValid(
      duration: duration ?? this.duration,
      startTime: startTime ?? this.startTime,
      nextMilestone: nextMilestone ?? this.nextMilestone,
      meetingItem: meetingItem ?? this.meetingItem,
      color: color ?? this.color,
    );
  }

  @override
  List<Object?> get props => [duration, startTime, nextMilestone, meetingItem, color];
}

final class ClockLoading extends ClockValid{
  const ClockLoading({required super.duration, required super.startTime, required super.nextMilestone,  super.meetingItem, required super.color});
}

final class ClockInvalid extends ClockState{}