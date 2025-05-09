import 'package:fitness_app/providers/future_providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

final userIdProvider = StateProvider((ref) {
  return ref.watch(userIdFutureProvider).value;
});

///StateProvider used to hold the user age value during creation
final userAgeProvider = StateProvider((ref) => 0);

/// User gender  provider
final userGenderProvider = StateProvider((ref) => '');

/// User name/nickname or username  provider
final userNameProvider = StateProvider((ref) => '');

/// User profile created on date  provider
//final userProfileCreatedDateProvider = StateProvider((ref) => DateTime.now());

/// User Weight value number  provider ex:180
final userWeightValueProvider = StateProvider((ref) => 0.0);

/// User cm value number  provider ex: 178
final userCmHeightValueProvider = StateProvider((ref) => 0.0);

/// User activity level  provider
final userActivityLevelProvider = StateProvider((ref) => '');

/// User body fat  provider
final userBfPercProvider = StateProvider((ref) => 0);

/// User goal   provider
final userGoalProvider = StateProvider((ref) => '');

/// User goal reason  provider
final userGoalReasonProvider = StateProvider((ref) => '');

/// User calorie  provider
final initialDailyCaloriesProvider = StateProvider((ref) => 0);

/// User protein  provider
final initialDailyProteinProvider = StateProvider((ref) => 0);

/// User fat  provider
final initialDailyFatProvider = StateProvider((ref) => 0);

/// User carbs  provider
final initialDailyCarbsProvider = StateProvider((ref) => 0);

final initialFatPercProvider = StateProvider((ref) => 0);

final initialCarbsPercProvider = StateProvider((ref) => 0);

final initialProteinPercProvider = StateProvider((ref) => 0);

/// Product selected boolean provider used on the Diet Tab and Search Results
/// list view. Value changes when a product name is selected and when a new
/// search term is searched
final productSelectedProvider = StateProvider<bool>((ref) => false);

///Selected Product Provider
final selectedProductProvider = StateProvider((ref) => Product());

///Selected DateTime provider
final dateTimeProvider = StateProvider((ref) => DateTime.now());
