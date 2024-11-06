part of 'clock_cubit.dart';

sealed class ClockState extends Equatable {
  const ClockState();

  @override
  List<Object> get props => [];
}

final class ClockInitial extends ClockState {}

final class ClockValid extends ClockState{
  final Duration duration;
  final DateTime startTime;

  const ClockValid({required this.duration, required this.startTime});

  @override
  List<Object> get props => [duration, startTime];
}

final class ClockLoading extends ClockValid{
  const ClockLoading({required super.duration, required super.startTime});
}

final class ClockInvalid extends ClockState{}