import 'package:fitness_app/providers/future_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

final userIdProvider = StateProvider((ref) {
  return ref.watch(userIdFutureProvider).value;
});

///StateProvider used to hold the user age value during creation
final userAgeStateProvider = StateProvider((ref) => 0);

/// User gender state provider
final userGenderStateProvider = StateProvider((ref) => '');

/// User name/nickname or username state provider
final userNameStateProvider = StateProvider((ref) => '');

/// User profile created on date State provider
//final userProfileCreatedDateProvider = StateProvider((ref) => DateTime.now());

/// User Weight value number state provider ex:180
final userWeightValueProvider = StateProvider((ref) => 0.0);

/// User cm value number state provider ex: 178
final userCmHeightValueProvider = StateProvider((ref) => 0.0);

/// User activity level state provider
final userActivityLevelStateProvider = StateProvider((ref) => '');

/// User body fat state provider
final userBfPercStateProvider = StateProvider((ref) => 0);

/// User goal state state provider
final userGoalStateProvider = StateProvider((ref) => '');

/// User goal reason state provider
final userGoalReasonStateProvider = StateProvider((ref) => '');

/// User calorie state provider
final initialDailyCaloriesStateProvider = StateProvider((ref) => 0);

/// User protein state provider
final initialDailyProteinStateProvider = StateProvider((ref) => 0);

/// User fat state provider
final initialDailyFatStateProvider = StateProvider((ref) => 0);

/// User carbs state provider
final initialDailyCarbsStateProvider = StateProvider((ref) => 0);

final initialFatPercentageProvider = StateProvider((ref) => 0);

final initialCarbsPercentageProvider = StateProvider((ref) => 0);

final initialProteinPercentageProvider = StateProvider((ref) => 0);

/// Product selected boolean provider used on the Diet Tab and Search Results
/// list view. Value changes when a product name is selected and when a new
/// search term is searched
final productSelectedBoolProvider = StateProvider<bool>((ref) => false);

///Selected Product Provider
final selectedProductProvider = StateProvider((ref) => Product());

///Selected DateTime provider
final dateTimeProvider = StateProvider((ref) => DateTime.now());
