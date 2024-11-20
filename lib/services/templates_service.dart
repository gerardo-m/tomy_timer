import 'dart:async';

import 'package:tomy_timer/models/template.dart';
import 'package:tomy_timer/models/template_item.dart';
import 'package:tomy_timer/repositories/template_items_repository.dart';
import 'package:tomy_timer/repositories/templates_repository.dart';
import 'package:tomy_timer/utils/constants.dart';

class TemplatesService{

  TemplatesRepository templatesRepository;
  TemplateItemsRepository templateItemsRepository;
  
  TemplatesService._({
    required this.templatesRepository,
    required this.templateItemsRepository,
  });

  factory TemplatesService(TemplatesRepository templatesRepository, TemplateItemsRepository templateItemsRepository,){
    return TemplatesService._(templatesRepository: templatesRepository, templateItemsRepository: templateItemsRepository);
  }

  Future<List<Template>> loadTemplates() async{
    return templatesRepository.getAllTemplates();
  }

  /// Get the template with the provided ID, and its items.
  Future<Template?> getTemplate(int id) async{
    Template? template = await templatesRepository.getTemplate(id);
    if (template == null) return null;
    template.items = await templateItemsRepository.getAllTemplateItems();
    return template;
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

  Future<TemplateItem?> getTemplateItem(int id)async{
    return templateItemsRepository.getTemplateItem(id);
  }

  Future<TemplateItem?> saveTemplateItem(TemplateItem templateItem) async{
    if (templateItem.id == Constants.newRecordId){
      return templateItemsRepository.createTemplateItem(templateItem);
    }else{
      return templateItemsRepository.updateTemplateItem(templateItem);
    }
  }
}