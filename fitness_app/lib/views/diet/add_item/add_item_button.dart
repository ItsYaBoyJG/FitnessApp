import 'package:fitness_app/backend/auth/user_auth.dart';
import 'package:fitness_app/controllers/providers/stream_providers.dart';
import 'package:fitness_app/models/equatables/date_id_eq.dart';
import 'package:fitness_app/backend/writes/write_to_db.dart';
import 'package:fitness_app/controllers/http_calls/off_functions.dart';
import 'package:fitness_app/controllers/providers/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class AddItemButton extends StatefulHookConsumerWidget {
  const AddItemButton({super.key, required this.tabName});

  final String tabName;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddItemButtonState();
  }
}

class _AddItemButtonState extends ConsumerState<AddItemButton> {
  final OffFunctions _offFunctions = OffFunctions();
  final WriteToDb _writeToDb = WriteToDb();
  final UserAuth _userAuth = UserAuth();

  @override
  Widget build(BuildContext context) {
    final date = ref.watch(dateTimeProvider);
    final product = ref.watch(selectedProductProvider);
    final macros = ref.watch(dailyMacroAmountsStreamProvider(
        DateIdEquatable(id: _userAuth.getUserId(), date: date)));
    final countController = useTextEditingController();

    return macros.when(data: (data) {
      if (data.exists == true && data.data() != null) {
        Map<String, dynamic> values = data.data() as Map<String, dynamic>;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0.5, 2.0, 1.5),
              child: Text('Add another item.'),
            ),
            OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Add?'),
                          content: SizedBox(
                            height: 200,
                            width: 250,
                            child: Column(
                              children: [
                                Text(
                                    'Do you want to add ${product.productName} to your ${widget.tabName}?'),
                                const Text('Number of servings?'),
                                TextFormField(
                                  controller: countController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  maxLength: 2,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          actions: [
                            OutlinedButton(
                                onPressed: () {
                                  try {
                                    final uId = _userAuth.getUserId();
                                    final calories = (values['calories'] +
                                            (product.nutriments!.getValue(
                                                Nutrient.energyKCal,
                                                PerSize.serving)!))
                                        .round();
                                    final protein = (values['protein'] +
                                            product.nutriments!.getValue(
                                                Nutrient.proteins,
                                                PerSize.serving)!)
                                        .round();
                                    final fat = (values['fat'] +
                                            product.nutriments!.getValue(
                                                Nutrient.fat, PerSize.serving)!)
                                        .round();

                                    final carbs = (values['carbs'] +
                                            product.nutriments!.getValue(
                                                Nutrient.carbohydrates,
                                                PerSize.serving)!)
                                        .round();

                                    ///save meal item
                                    _writeToDb.saveMealItem(
                                        uId,
                                        date,
                                        product.productName!,
                                        int.parse(countController.text),
                                        int.parse(product.nutriments!
                                            .getValue(Nutrient.energyKCal,
                                                PerSize.serving)
                                            .toString()
                                            .split('.')[0]),
                                        widget.tabName);

                                    /// save macros
                                    _writeToDb.updateDailyMacros(uId, date,
                                        calories, protein, fat, carbs);

                                    context.pop();
                                    ref.invalidate(
                                        dailyMacroAmountsStreamProvider);
                                  } on Exception catch (e) {
                                    print(e);
                                  }
                                },
                                child: const Text('Add item'))
                          ],
                        );
                      });
                },
                child: const Text('Add +'))
          ],
        );
      } else if (data.exists == false ||
          data.data() == null ||
          macros.hasError == true) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15.0, 0.5, 2.0, 1.5),
              child: Text('Add your first item.'),
            ),
            OutlinedButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text('Add?'),
                          content: SizedBox(
                            height: 200,
                            width: 250,
                            child: Column(
                              children: [
                                Text(
                                    'Do you want to add ${product.productName} to your ${widget.tabName}?'),
                                const Text('Number of servings?'),
                                TextFormField(
                                  controller: countController,
                                  textInputAction: TextInputAction.done,
                                  keyboardType: TextInputType.number,
                                  maxLength: 2,
                                  decoration: const InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(50))),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(50)),
                                    ),
                                    fillColor: Colors.white,
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                  ),
                                )
                              ],
                            ),
                          ),
                          actions: [
                            OutlinedButton(
                                onPressed: () {
                                  try {
                                    final uId = _userAuth.getUserId();
                                    final calories = int.parse(product
                                        .nutriments!
                                        .getValue(Nutrient.energyKCal,
                                            PerSize.serving)
                                        .toString()
                                        .split('.')[0]);

                                    final protein = (product.nutriments!
                                            .getValue(Nutrient.proteins,
                                                PerSize.serving)!)
                                        .round();

                                    final fat = (product.nutriments!.getValue(
                                            Nutrient.fat, PerSize.serving)!)
                                        .round();

                                    final carbs = (product.nutriments!.getValue(
                                            Nutrient.carbohydrates,
                                            PerSize.serving)!)
                                        .round();

                                    ///save meal item
                                    _writeToDb.saveMealItem(
                                        uId,
                                        date,
                                        product.productName!,
                                        int.parse(countController.text),
                                        calories,
                                        widget.tabName);

                                    /// save macros
                                    _writeToDb.saveDailyMacros(uId, date,
                                        calories, protein, fat, carbs);

                                    context.pop();
                                    ref.invalidate(
                                        dailyMacroAmountsStreamProvider);
                                  } catch (e) {
                                    print(e);
                                  }
                                },
                                child: const Text('Add item'))
                          ],
                        );
                      });
                },
                child: const Text('Add +'))
          ],
        );
      } else {
        return Text('nothing');
      }
    }, error: (error, stackTrace) {
      return Text('error');
    }, loading: () {
      return const Center(
        child: CircularProgressIndicator.adaptive(),
      );
    });
  }
}
