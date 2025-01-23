import 'package:fitness_app/models/recipe_component.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe {
  Recipe({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.cookingTime,
    required this.components,
    required this.steps,
  });

  final String id;
  final String title;
  final String description;
  final String imageUrl;
  final String cookingTime;
  final List<RecipeComponent> components;
  final List<String> steps;

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);
}
