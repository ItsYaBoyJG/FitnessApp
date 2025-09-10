import 'package:equatable/equatable.dart';

class NutritionEntry extends Equatable {
  const NutritionEntry({
    required this.id,
    required this.userId,
    required this.foodName,
    required this.date,
    required this.mealType,
    required this.quantity,
    required this.calories,
    required this.protein,
    required this.carbs,
    required this.fat,
    this.barcode,
    this.imageUrl,
  });

  final String id;
  final String userId;
  final String foodName;
  final DateTime date;
  final MealType mealType;
  final double quantity; // in grams
  final double calories;
  final double protein; // in grams
  final double carbs; // in grams
  final double fat; // in grams
  final String? barcode;
  final String? imageUrl;

  @override
  List<Object?> get props => [
        id,
        userId,
        foodName,
        date,
        mealType,
        quantity,
        calories,
        protein,
        carbs,
        fat,
        barcode,
        imageUrl,
      ];

  NutritionEntry copyWith({
    String? id,
    String? userId,
    String? foodName,
    DateTime? date,
    MealType? mealType,
    double? quantity,
    double? calories,
    double? protein,
    double? carbs,
    double? fat,
    String? barcode,
    String? imageUrl,
  }) {
    return NutritionEntry(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      foodName: foodName ?? this.foodName,
      date: date ?? this.date,
      mealType: mealType ?? this.mealType,
      quantity: quantity ?? this.quantity,
      calories: calories ?? this.calories,
      protein: protein ?? this.protein,
      carbs: carbs ?? this.carbs,
      fat: fat ?? this.fat,
      barcode: barcode ?? this.barcode,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }
}

enum MealType {
  breakfast,
  lunch,
  dinner,
  snack;

  String get displayName {
    switch (this) {
      case MealType.breakfast:
        return 'Breakfast';
      case MealType.lunch:
        return 'Lunch';
      case MealType.dinner:
        return 'Dinner';
      case MealType.snack:
        return 'Snack';
    }
  }
}