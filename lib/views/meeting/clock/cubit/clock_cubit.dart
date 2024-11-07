
import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'clock_state.dart';

class ClockCubit extends Cubit<ClockState> {
  ClockCubit() : super(ClockInitial());

  bool _started = false;
  // bool _running = false;

  DateTime _startTime = DateTime.now();
  // Duration _duration = Duration.zero;

  StreamSubscription<Duration>? _clockSubscription;

  void load(){
    reset();
    emit(ClockValid(duration: Duration.zero, startTime: _startTime));
  }

  Future<void> start() async{
    if (!_started){
      // _running = true;
      _started = true;
      _startTime = DateTime.now();
      _clockSubscription?.cancel();
      _clockSubscription = _tick().listen((duration) => emit(ClockValid(duration: duration, startTime: _startTime)),);
    }
  }

  void stop(){
    // _running = false;
    _clockSubscription?.cancel();
  }

  void reset(){
    // _duration = Duration.zero;
    _startTime = DateTime.now();
    // _running = false;
    _started = false;
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

  Stream<Duration> _tick(){
    return Stream.periodic(const Duration(milliseconds: 10), (computationCount) {
      DateTime current = DateTime.now();
      return current.difference(_startTime);
    },);
  }
  
}

class ClockBlocBuilder extends RichBlocBuilder<ClockCubit, ClockState, ClockValid, ClockInvalid, ClockLoading>{
  const ClockBlocBuilder({super.key, required super.builder});
}