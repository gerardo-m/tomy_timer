import 'package:isar/isar.dart';

import 'package:tomy_timer/models/template_item.dart';
import 'package:tomy_timer/repositories/template_items_repository.dart';

class TemplateItemsRepositoryIsar extends TemplateItemsRepository {

  final Isar isar;

  TemplateItemsRepositoryIsar._({
    required this.isar,
  });

  factory TemplateItemsRepositoryIsar(Isar isar){
    return TemplateItemsRepositoryIsar._(isar: isar);
  }
  
  @override
  Future<TemplateItem?> createTemplateItem(TemplateItem templateItem, {bool generateId = true}) async {
    await isar.writeTxn(() async{
      await isar.templateItems.put(templateItem);
    });
    return templateItem;
  }

  @override
  Future<void> deleteTemplateItem(int templateItemId) async{
    await isar.writeTxn(() async{
      await isar.templateItems.delete(templateItemId);
    });
  }

  @override
  Future<TemplateItem?> getTemplateItem(int id) async{
    return isar.templateItems.get(id);
  }

  @override
  Future<TemplateItem?> updateTemplateItem(TemplateItem templateItem) async{
    await isar.writeTxn(() async{
      await isar.templateItems.put(templateItem);
    });
    return templateItem;
  }
  
  @override
  Future<List<TemplateItem>> getAllTemplateItems() {
    return isar.templateItems.where().findAll();
  }

}
