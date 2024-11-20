import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/template.dart';
import 'package:tomy_timer/models/template_item.dart';
import 'package:tomy_timer/services/templates_service.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'template_state.dart';

class TemplateCubit extends Cubit<TemplateState> {
  TemplateCubit() : super(TemplateInitial());

  late Template _template;

  final TemplatesService _templatesService = GetIt.instance.get<TemplatesService>();

  void load(int? id)async{
    if (id == null)return;
    Template? cand = await _templatesService.getTemplate(id);
    if (cand == null){
      emit(TemplateInvalid());
      return;
    }
    _template = cand;
    _emitValidState();
  }

  void changeScheduledTime(TimeOfDay time){
    _template.scheduledStartingTime = _template.scheduledStartingTime.copyWith(hour: time.hour, minute: time.minute, second: 0);
    _emitValidState();
  }

  void changeName(String name){
    _template.name = name;
  }

  Future<void> finishedChangingName()async{
    _loading();
    await _templatesService.saveTemplate(_template);
    _emitValidState();
  }

  /// Returns new item id
  Future<int?> createTemplateItem()async{
    int orderNumber = _template.items.length;
    TemplateItem item = TemplateItem.createEmptyTemplateItem(_template.id, orderNumber);
    TemplateItem? cand = await _templatesService.saveTemplateItem(item);
    if (cand ==null){
      emit(TemplateInvalid());
      return null;
    }
    _emitValidState();
    return cand.id;
  }

  void _loading(){
    TemplateState currentState = state;
    if (currentState is TemplateValid){
      List<ETemplateItem> items = _template.items.map((e) => e.toETemplateItem(),).toList();
      emit(TemplateLoading(template: _template.toETemplate(), items: items));
    }
  }

  void _emitValidState(){
    List<ETemplateItem> items = _template.items.map((e) => e.toETemplateItem(),).toList();
    emit(TemplateValid(template: _template.toETemplate(), items: items));
  }
  
}

class TemplateBlocBuilder extends RichBlocBuilder<TemplateCubit, TemplateState, TemplateValid, TemplateInvalid, TemplateLoading>{
  const TemplateBlocBuilder({super.key, required super.builder, super.buildWhen});
}