import 'package:fitness_app/providers/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class SelectedItem extends ConsumerStatefulWidget {
  const SelectedItem({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SelectedItemState();
  }
}

class _SelectedItemState extends ConsumerState<SelectedItem> {
  @override
  Widget build(BuildContext context) {
    final product = ref.watch(selectedProductProvider);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.38,
      width: MediaQuery.of(context).size.width - 20,
      child: Column(
        children: [
          Container(
            height: 55,
            width: 50,
            margin: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.045),
            child: IconButton(
                onPressed: () {
                  ref.read(productSelectedProvider.notifier).state = false;
                },
                icon: const Icon(Icons.close)),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.28,
            width: MediaQuery.of(context).size.width - 5,
            child: ListView(
              children: [
                Card(
                  child: ListTile(
                    titleTextStyle:
                        const TextStyle(fontSize: 14.0, color: Colors.black),
                    subtitleTextStyle:
                        const TextStyle(fontSize: 10.0, color: Colors.black),
                    leadingAndTrailingTextStyle:
                        const TextStyle(fontSize: 10.0, color: Colors.black),
                    //  isThreeLine: true,
                    title: Text('${product.productName}'),
                    //  subtitle: ,
                    leading: SizedBox(
                      height: 250,
                      width: 80,
                      child: product.imageFrontUrl == null
                          ? Container()
                          : Image.network(
                              product.imageFrontUrl!,
                              width: 100,
                              height: 100,
                            ),
                    ),
                    trailing: product.servingSize != null
                        ? Text('Service size: ${product.servingSize}')
                        : product.servingQuantity != null
                            ? Text(
                                'Service Quantity: ${product.servingQuantity}')
                            : Container(),
                  ),
                ),
                Card(
                  child: ListTile(
                    leading: product.ingredients!.isNotEmpty
                        ? TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        height: 300,
                                        width: 300,
                                        child: ListView.builder(
                                            itemCount:
                                                product.ingredients!.length,
                                            itemBuilder: (context, index) {
                                              return Text(
                                                  '${product.ingredients![index]}');
                                            }),
                                      ),
                                      actions: [
                                        OutlinedButton(
                                            onPressed: () {
                                              context.pop();
                                            },
                                            child: const Text('Close'))
                                      ],
                                    );
                                  });
                            },
                            child: const Text('Ingredients'))
                        : Container(),
                    title: product.allergens!.names.isNotEmpty
                        ? TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        height: 300,
                                        width: 300,
                                        child: ListView.builder(
                                            itemCount:
                                                product.allergens!.names.length,
                                            itemBuilder: (context, index) {
                                              return Text(product
                                                  .allergens!.names[index]);
                                            }),
                                      ),
                                      actions: [
                                        OutlinedButton(
                                            onPressed: () {
                                              context.pop();
                                            },
                                            child: const Text('Close'))
                                      ],
                                    );
                                  });
                            },
                            child: const Text('Allergins'))
                        : Container(),
                    trailing: product.nutritionData == true
                        ? TextButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      content: SizedBox(
                                        height: 300,
                                        width: 300,
                                        child: ListView(
                                          children: [
                                            Text(
                                              'Calories: ${product.nutriments!.getValue(Nutrient.energyKCal, PerSize.serving)}',
                                            ),
                                            Text(
                                              'Protein: ${product.nutriments!.getValue(Nutrient.proteins, PerSize.serving)}',
                                            ),
                                            Text(
                                              'Fat: ${product.nutriments!.getValue(Nutrient.fat, PerSize.serving)}',
                                            ),
                                            Text(
                                              'Trans Fat: ${product.nutriments!.getValue(Nutrient.transFat, PerSize.serving)}',
                                            ),
                                            Text(
                                              'Saturated Fat:${product.nutriments!.getValue(Nutrient.saturatedFat, PerSize.serving)}',
                                            ),
                                            Text(
                                              'Mono. Fat: ${product.nutriments!.getValue(Nutrient.monounsaturatedFat, PerSize.serving)}',
                                            ),
                                            Text(
                                              'Poly. Fat: ${product.nutriments!.getValue(Nutrient.polyunsaturatedFat, PerSize.serving)}',
                                            ),
                                            Text(
                                              'Carbohydrates: ${product.nutriments!.getValue(Nutrient.carbohydrates, PerSize.serving)}',
                                            ),
                                            Text(
                                              'Cholesterol: ${product.nutriments!.getValue(Nutrient.cholesterol, PerSize.serving)}',
                                            ),
                                            Text(
                                              'Fiber: ${product.nutriments!.getValue(Nutrient.fiber, PerSize.serving)}',
                                            ),
                                            Text(
                                              'Sodium: ${product.nutriments!.getValue(Nutrient.sodium, PerSize.serving)}',
                                            ),
                                            //     Text(
                                            //      '${product.nutriments!.getValue(Nutrient., PerSize.serving)}'),
                                            //      Text(
                                            //     '${product.nutriments!.getValue(Nutrient.energyKCal, PerSize.serving)}'),
                                            //     Text(
                                            //     '${product.nutriments!.getValue(Nutrient.energyKCal, PerSize.serving)}'),
                                            //     Text(
                                            //     '${product.nutriments!.getValue(Nutrient.energyKCal, PerSize.serving)}'),
                                          ],
                                        ),
                                      ),
                                      actions: [
                                        OutlinedButton(
                                            onPressed: () {
                                              context.pop();
                                            },
                                            child: const Text('Close'))
                                      ],
                                    );
                                  });
                            },
                            child: const Text('Nutrients'))
                        : Container(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
