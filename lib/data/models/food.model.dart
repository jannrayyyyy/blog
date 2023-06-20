import 'package:blog/domain/entities/cuisine.entity.dart';

// ignore: must_be_immutable
class CuisineModel extends CuisineEntity {
  CuisineModel({
    super.uid,
    required super.title,
    required super.desc,
    required super.image,
    required super.isFavorite,
    required super.procedure,
    required super.ingredients,
    required super.notes,
  });

  factory CuisineModel.fromJson(Map<String, dynamic> json) {
    return CuisineModel(
      uid: json['uid'],
      title: json['title'],
      desc: json['desc'],
      image: json['image'],
      isFavorite: json['isFavorite'],
      procedure: json['procedures'],
      ingredients: json['ingredients'],
      notes: json['notes'],
    );
  }

  factory CuisineModel.toEntity(CuisineEntity cuisine) {
    return CuisineModel(
      uid: cuisine.uid,
      title: cuisine.desc,
      desc: cuisine.desc,
      image: cuisine.image,
      isFavorite: cuisine.isFavorite,
      procedure: cuisine.procedure,
      ingredients: cuisine.ingredients,
      notes: cuisine.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'title': title,
      'desc': desc,
      'image': image,
      'isFavorite': isFavorite,
      'procedure': procedure,
      'ingredients': ingredients,
      'notes': notes,
    };
  }
}
