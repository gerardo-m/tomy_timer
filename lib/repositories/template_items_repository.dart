import 'package:tomy_timer/models/template_item.dart';
  
abstract class TemplateItemsRepository{

  Future<TemplateItem?> getTemplateItem(int id);
  Future<TemplateItem?> createTemplateItem(TemplateItem templateItem, {bool generateId = true});
  Future<TemplateItem?> updateTemplateItem(TemplateItem templateItem);
  Future<void> deleteTemplateItem(int templateItemId);
  Future<List<TemplateItem>> getAllTemplateItems();

  Future<List<TemplateItem>> getTemplateItems(int templateId);
}