// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class CuisineEntity extends Equatable {
  String? uid;
  final String title;
  final String desc;
  final String image;
  final bool isFavorite;
  final List procedure;
  final List ingredients;
  final List notes;
  CuisineEntity({
    this.uid,
    required this.title,
    required this.desc,
    required this.image,
    required this.isFavorite,
    required this.procedure,
    required this.ingredients,
    required this.notes,
  });

  @override
  List<Object?> get props => [title];
}
