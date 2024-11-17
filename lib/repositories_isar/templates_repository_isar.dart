import 'package:isar/isar.dart';

import 'package:tomy_timer/models/template.dart';
import 'package:tomy_timer/repositories/templates_repository.dart';

class TemplatesRepositoryIsar extends TemplatesRepository {

  final Isar isar;

  TemplatesRepositoryIsar._({
    required this.isar,
  });

  factory TemplatesRepositoryIsar(Isar isar){
    return TemplatesRepositoryIsar._(isar: isar);
  }
  
  @override
  Future<Template?> createTemplate(Template template, {bool generateId = true}) async {
    await isar.writeTxn(() async{
      await isar.templates.put(template);
    });
    return template;
  }

  @override
  Future<void> deleteTemplate(int templateId) async{
    await isar.writeTxn(() async{
      await isar.templates.delete(templateId);
    });
  }

  @override
  Future<Template?> getTemplate(int id) async{
    return isar.templates.get(id);
  }

  @override
  Future<Template?> updateTemplate(Template template) async{
    await isar.writeTxn(() async{
      await isar.templates.put(template);
    });
    return template;
  }
  
  @override
  Future<List<Template>> getAllTemplates() {
    return isar.templates.where().findAll();
  }

}
