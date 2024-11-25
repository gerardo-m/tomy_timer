import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/meeting.dart';
import 'package:tomy_timer/models/meeting_item.dart';
import 'package:tomy_timer/models/template.dart';
import 'package:tomy_timer/services/meeting_items_service.dart';
import 'package:tomy_timer/services/meetings_service.dart';
import 'package:tomy_timer/services/templates_service.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  MeetingsService get _meetingsService => GetIt.instance.get<MeetingsService>();
  MeetingItemsService get _meetingItemsService => GetIt.instance.get<MeetingItemsService>();
  TemplatesService get _templatesService => GetIt.instance.get<TemplatesService>();

  Meeting? _currentMeeting;
  List<Template> _templates = [];

  Future<void> load()async{
    _currentMeeting = await _meetingsService.getCurrentMeeting();
    _templates = await _templatesService.loadTemplates();
    _emitValidState();
  }

  Future<int?> createNewMeeting()async{
    _loading();
    Meeting newMeeting = Meeting.createEmptyMeeting();
    Meeting? cand = await _meetingsService.saveMeeting(newMeeting);
    if (cand == null){
      emit(HomeInvalid());
      return null;
    }
    _currentMeeting = cand;
    MeetingItem item = MeetingItem.createEmptyMeetingItem(cand.id, 0);
    item.redTime = const Duration(minutes: 2).inMilliseconds;
    await _meetingItemsService.saveMeetingItem(item);
    _emitValidState();
    return cand.id;
  }

  /// Returns the id of the created meeting
  Future<int?> createMeetingFromTemplate(int templateId) async{
    _loading();
    Meeting? cand = await _meetingsService.generateFromTemplate(templateId);
    if (cand == null){
      emit(HomeInvalid());
      return null;
    }
    _currentMeeting = cand;
    _emitValidState();
    return cand.id;
  }

  Future<int?> createMeetingFromTomy(String data)async{
    _loading();
    Meeting? cand = await _meetingsService.generateFromTomy(data);
    if (cand == null){
       emit(HomeInvalid());
       return null;
    }
    _currentMeeting = cand;
    _emitValidState();
    return cand.id;
  }

  void _loading(){
    HomeState currentState = state;
    if (currentState is HomeValid){
      List<ETemplate> templates = _templates.map((e) => e.toETemplate(),).toList();
      emit(HomeLoading(currentMeeting: _currentMeeting?.toEMeeting(), templates: templates)); 
    }
  }

  void _emitValidState(){
    List<ETemplate> templates = _templates.map((e) => e.toETemplate(),).toList();
    emit(HomeValid(currentMeeting: _currentMeeting?.toEMeeting(), templates: templates));
  }
  
}

class HomeBlocBuilder extends RichBlocBuilder<HomeCubit, HomeState, HomeValid, HomeInvalid, HomeLoading>{
  const HomeBlocBuilder({super.key, required super.builder});
}