import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/services/meeting_items_service.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'clock_state.dart';

class ClockCubit extends Cubit<ClockState> {
  ClockCubit() : super(ClockInitial());

  bool _started = false;
  // bool _running = false;

  DateTime _startTime = DateTime.now();
  // Duration _duration = Duration.zero;

  Duration _nextMilestone = const Duration(minutes: 1);
  MeetingItem? _meetingItem;

  StreamSubscription<Duration>? _clockSubscription;

  MeetingItemsService get _meetingItemsService => GetIt.instance.get<MeetingItemsService>();

  void load() {
    reset();
    // emit(ClockValid(duration: Duration.zero, startTime: _startTime, nextMilestone: _nextMilestone));
  }

  Future<void> start() async {
    if (!_started) {
      // _running = true;
      _started = true;
      _startTime = DateTime.now();
      _clockSubscription?.cancel();
      _clockSubscription = _tick().listen(
        (duration) {
          _nextMilestone = _meetingItem!.getNextMilestone(duration);
          emit(ClockValid(
            duration: duration,
            startTime: _startTime,
            nextMilestone: _nextMilestone,
            meetingItem: _meetingItem?.toEMeetingItem(),
            color: getColor(),
          ));
        },
      );
    }
  }

  void stop() {
    // _running = false;
    _clockSubscription?.cancel();
  }

  Future<void> reset() async {
    _meetingItem = await _meetingItemsService.getCurrentMeetingItem();
    if (_meetingItem == null) {
      emit(ClockInvalid());
      return;
    }
    _startTime = DateTime.now();
    _started = false;
    _nextMilestone = _meetingItem!.getNextMilestone(Duration.zero);
    emit(ClockValid(
        duration: Duration.zero,
        startTime: _startTime,
        nextMilestone: _nextMilestone,
        meetingItem: _meetingItem?.toEMeetingItem(),
        color: Colors.transparent));
  }

  void setMilestones(Duration? green, Duration? ambar, Duration red) async{
    _meetingItem!.greenTime = green?.inMilliseconds;
    _meetingItem!.ambarTime = ambar?.inMilliseconds;
    _meetingItem!.redTime = red.inMilliseconds;
    await _meetingItemsService.saveMeetingItem(_meetingItem!);
    _nextMilestone = _meetingItem!.getNextMilestone(Duration.zero);
    ClockState currentState = state;
    if (currentState is ClockValid) {
      emit(currentState.copyWith(
        nextMilestone: _nextMilestone, 
        meetingItem: _meetingItem?.toEMeetingItem(),
      ));
    }
  }

  // void _loading(){
  //   ClockState currentState = state;
  //   if (currentState is ClockValid){
  //     emit(ClockLoading());
  //   }
  // }

  @override
  Future<void> close() {
    _clockSubscription?.cancel();
    return super.close();
  }

  Color getColor() {
    if (_nextMilestone == Duration.zero) return Colors.red;
    if (_nextMilestone == _meetingItem?.redDuration && _meetingItem?.ambarDuration != null) return Colors.yellow;
    if (_nextMilestone == _meetingItem?.ambarDuration && _meetingItem?.greenDuration != null) return Colors.green;
    return Colors.transparent;
  }

  Stream<Duration> _tick() {
    return Stream.periodic(
      const Duration(milliseconds: 10),
      (computationCount) {
        DateTime current = DateTime.now();
        return current.difference(_startTime);
      },
    );
  }
}

class ClockBlocBuilder extends RichBlocBuilder<ClockCubit, ClockState, ClockValid, ClockInvalid, ClockLoading> {
  const ClockBlocBuilder({super.key, required super.builder});
}
