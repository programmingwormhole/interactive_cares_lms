import '../utils/assets_manager.dart';

class CategoryModel {
  String title;
  String icon;

  CategoryModel ({required this.title, required this.icon});
}

List<CategoryModel> getCategories = [
  CategoryModel(title: 'Website', icon: ImageManager.web),
  CategoryModel(title: 'Graphics', icon: ImageManager.graphic),
  CategoryModel(title: 'Editing', icon: ImageManager.video),
  CategoryModel(title: 'Development', icon: ImageManager.personalDevelopment),
  CategoryModel(title: 'Math', icon: ImageManager.math),
];