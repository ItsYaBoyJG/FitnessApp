import 'package:fitness_app/core/errors/failures.dart';
import 'package:fitness_app/features/workout/domain/entities/exercise.dart';
import 'package:fpdart/fpdart.dart';

abstract class WorkoutRepository {
  // Exercises
  Future<Either<Failure, List<Exercise>>> getExercises({
    required String userId,
    DateTime? date,
  });

  Future<Either<Failure, Exercise>> addExercise(Exercise exercise);

  Future<Either<Failure, Exercise>> updateExercise(Exercise exercise);

  Future<Either<Failure, void>> deleteExercise(String exerciseId);

  Stream<Either<Failure, List<Exercise>>> watchExercises({
    required String userId,
    DateTime? date,
  });

  // Workout Programs
  Future<Either<Failure, List<Map<String, dynamic>>>> getWorkoutPrograms();

  Future<Either<Failure, Map<String, dynamic>>> getWorkoutProgram(
    String programId,
  );

  // Health Data Integration
  Future<Either<Failure, int>> getTodaySteps();

  Future<Either<Failure, double>> getTodayCaloriesBurned();

  Future<Either<Failure, List<Map<String, dynamic>>>> getHealthData({
    required DateTime startDate,
    required DateTime endDate,
  });
}