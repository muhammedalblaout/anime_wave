
import 'package:anime_wave/features/anime/domin/entites/category.dart';

class CategoryModel extends Category{
  CategoryModel({required super.id, required super.name});

  factory CategoryModel.fromJson(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['title'] as String,
    );
  }

}