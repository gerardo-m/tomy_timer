import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:tomy_timer/models/template.dart';
import 'package:tomy_timer/services/templates_service.dart';
import 'package:tomy_timer/views/widgets/rich_bloc_builder.dart';

part 'templates_state.dart';

class TemplatesCubit extends Cubit<TemplatesState> {
  TemplatesCubit() : super(TemplatesInitial());

  List<Template> _templates = [];

  final TemplatesService _templatesService = GetIt.instance.get<TemplatesService>();

  void load()async{
    _templates  = await _templatesService.loadTemplates();
    _emitValidState();
  }

  /// Return the new template id
  Future<int?> createTemplate()async{
    _loading();
    Template template = Template.createEmptyTemplate();
    Template? createdTemplate = await _templatesService.saveTemplate(template);
    if (createdTemplate == null){
      emit(TemplatesInvalid());
      return null;
    }
    _emitValidState();
    return createdTemplate.id;
  }

  void _loading(){
    TemplatesState currentState = state;
    if (currentState is TemplatesValid){
      List<ETemplate> eTemplates = _templates.map((e) => e.toETemplate(),).toList();
      emit(TemplatesLoading(templates: eTemplates)); 
    }
  }

  void _emitValidState(){
    List<ETemplate> eTemplates = _templates.map((e) => e.toETemplate(),).toList();
    emit(TemplatesValid(templates: eTemplates)); 
  }
  
}

class TemplatesBlocBuilder extends RichBlocBuilder<TemplatesCubit, TemplatesState, TemplatesValid, TemplatesInvalid, TemplatesLoading>{
  const TemplatesBlocBuilder({super.key, required super.builder, super.buildWhen});
}