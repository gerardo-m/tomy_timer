import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/template_item.dart';
import 'package:tomy_timer/services/templates_service.dart';
import 'package:tomy_timer/utils/utils.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'template_item_state.dart';

class TemplateItemCubit extends Cubit<TemplateItemState> {
  TemplateItemCubit() : super(TemplateItemInitial());

  late TemplateItem _item;

  final TemplatesService _templatesService = GetIt.instance.get<TemplatesService>();

  void load(int? id)async{
    if (id ==null){
      emit(TemplateItemInvalid());
      return ;
    }
    TemplateItem? cand = await _templatesService.getTemplateItem(id);
    if (cand == null){
      emit(TemplateItemInvalid());
      return ;
    }
    _item = cand;
    _emitValidState();
  }

  void changeName(String name){
    _item.name = name;
  }

  void changeRole(String role){
    _item.role = role;
  }

  void changeRoleType(RoleType rolyType){
    _item.roleType = rolyType;
    save();
  }

  void changeGreenTime(Duration duration)async{
    if (duration == Duration.zero){
      _item.greenTime = null;
    }else{
      _item.greenTime = duration.inMilliseconds;
    }
    await _templatesService.saveTemplateItem(_item);
  }

  void changeAmbarTime(Duration duration)async{
    if (duration == Duration.zero){
      _item.ambarTime = null;
    }else{
      _item.ambarTime = duration.inMilliseconds;
    }
    await _templatesService.saveTemplateItem(_item);
  }

  void changeRedTime(Duration duration)async{
    _item.redTime = duration.inMilliseconds;
    await _templatesService.saveTemplateItem(_item);
  }

  void changeScheduledTime(TimeOfDay time)async{
    _loading();
    _item.scheduledStartTime = _item.scheduledStartTime.copyWith(hour: time.hour, minute: time.minute, second: 0);
    save();
  }

  Future<void> save()async{
    await _templatesService.saveTemplateItem(_item);
    _emitValidState();
  }

  void _loading(){
    TemplateItemState currentState = state;
    if (currentState is TemplateItemValid){
      emit(TemplateItemLoading(item: _item.toETemplateItem()));
    }
  }

  void _emitValidState(){
    emit(TemplateItemValid(item: _item.toETemplateItem()));
  }
  
}

class TemplateItemBlocBuilder extends RichBlocBuilder<TemplateItemCubit, TemplateItemState, TemplateItemValid, TemplateItemInvalid, TemplateItemLoading>{
  const TemplateItemBlocBuilder({super.key, required super.builder, super.buildWhen});
}