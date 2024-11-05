
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'clock_state.dart';

class ClockCubit extends Cubit<ClockState> {
  ClockCubit() : super(ClockInitial());

  // void _loading(){
  //   ClockState currentState = state;
  //   if (currentState is ClockValid){
  //     emit(ClockLoading()); 
  //   }
  // }
  
}

class ClockBlocBuilder extends RichBlocBuilder<ClockCubit, ClockState, ClockValid, ClockInvalid, ClockLoading>{
  const ClockBlocBuilder({super.key, required super.builder});
}