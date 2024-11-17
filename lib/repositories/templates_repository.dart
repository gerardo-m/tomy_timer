import 'package:tomy_timer/models/template.dart';
  
abstract class TemplatesRepository{

  Future<Template?> getTemplate(int id);
  Future<Template?> createTemplate(Template template, {bool generateId = true});
  Future<Template?> updateTemplate(Template template);
  Future<void> deleteTemplate(int templateId);
  Future<List<Template>> getAllTemplates();
}