import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/services/meetings_service.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final MeetingsService _meetingsService = GetIt.instance.get<MeetingsService>();

  Meeting? _currentMeeting;

  Future<void> load()async{
    _currentMeeting = await _meetingsService.getCurrentMeeting();
    _emitValidState();
  }

  // void _loading(){
  //   HomeState currentState = state;
  //   if (currentState is HomeValid){
  //     emit(HomeLoading()); 
  //   }
  // }

  void _emitValidState(){
    emit(HomeValid(currentMeeting: _currentMeeting?.toEMeeting()));
  }
  
}

class HomeBlocBuilder extends RichBlocBuilder<HomeCubit, HomeState, HomeValid, HomeInvalid, HomeLoading>{
  const HomeBlocBuilder({super.key, required super.builder});
}