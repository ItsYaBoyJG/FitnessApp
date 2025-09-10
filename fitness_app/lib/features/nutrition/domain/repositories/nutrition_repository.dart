import 'package:fitness_app/core/errors/failures.dart';
import 'package:fitness_app/features/nutrition/domain/entities/nutrition_entry.dart';
import 'package:fitness_app/features/nutrition/domain/entities/recipe.dart';
import 'package:fpdart/fpdart.dart';

abstract class NutritionRepository {
  // Nutrition Entries
  Future<Either<Failure, List<NutritionEntry>>> getNutritionEntries({
    required String userId,
    required DateTime date,
  });

  Future<Either<Failure, NutritionEntry>> addNutritionEntry(
    NutritionEntry entry,
  );

  Future<Either<Failure, NutritionEntry>> updateNutritionEntry(
    NutritionEntry entry,
  );

  Future<Either<Failure, void>> deleteNutritionEntry(String entryId);

  Stream<Either<Failure, List<NutritionEntry>>> watchNutritionEntries({
    required String userId,
    required DateTime date,
  });

  // Recipes
  Future<Either<Failure, List<Recipe>>> getRecipes(String userId);

  Future<Either<Failure, Recipe>> addRecipe(Recipe recipe);

  Future<Either<Failure, Recipe>> updateRecipe(Recipe recipe);

  Future<Either<Failure, void>> deleteRecipe(String recipeId);

  Stream<Either<Failure, List<Recipe>>> watchRecipes(String userId);

  // Food Search (OpenFoodFacts)
  Future<Either<Failure, List<Map<String, dynamic>>>> searchFood(
    String query,
  );

  Future<Either<Failure, Map<String, dynamic>>> getFoodByBarcode(
    String barcode,
  );
}