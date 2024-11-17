import 'dart:async';

import 'package:tomy_timer/models/template.dart';
import 'package:tomy_timer/repositories/templates_repository.dart';
import 'package:tomy_timer/utils/constants.dart';

class TemplatesService{

  TemplatesRepository templatesRepository;
  
  TemplatesService._({
    required this.templatesRepository,
  });

  factory TemplatesService(TemplatesRepository templatesRepository){
    return TemplatesService._(templatesRepository: templatesRepository);
  }

  Future<List<Template>> loadTemplates() async{
    return templatesRepository.getAllTemplates();
  }

  Future<Template?> getTemplate(int id) async{
    return templatesRepository.getTemplate(id);
  }

  Future<Template?> saveTemplate(Template template) async{
    if (template.id == Constants.newRecordId){
      return templatesRepository.createTemplate(template);
    }else{
      return templatesRepository.updateTemplate(template);
    }
  }

  Future<void> deleteTemplate(int id){
    return templatesRepository.deleteTemplate(id);
  }
}