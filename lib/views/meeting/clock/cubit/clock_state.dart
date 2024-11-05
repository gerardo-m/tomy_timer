part of 'clock_cubit.dart';

sealed class ClockState extends Equatable {
  const ClockState();

  @override
  List<Object> get props => [];
}

final class ClockInitial extends ClockState {}

final class ClockValid extends ClockState{}

final class ClockLoading extends ClockValid{}

final class ClockInvalid extends ClockState{}