import 'package:fitness_app/data/off_functions/off_functions.dart';
import 'package:fitness_app/view/diet/widgets/search_bar.dart';
import 'package:fitness_app/view/diet/widgets/add_item_button.dart';
import 'package:fitness_app/view/diet/widgets/search_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class AddItemPage extends StatefulHookConsumerWidget {
  const AddItemPage({super.key, required this.tabName, required this.date});

  final String tabName;
  final DateTime date;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _AddItemPageState();
  }
}

class _AddItemPageState extends ConsumerState<AddItemPage> {
  final OffFunctions _offFunctions = OffFunctions();

  List<Product> results = [];

  void _getSearchItemList(String value) async {
    final result = await _offFunctions.searchProduct(value);

    setState(() {
      results = result!;
    });
  }

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();

    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.80,
        width: double.infinity,
        child: Form(
            child: Column(
          children: [
            AddItemButton(tabName: widget.tabName),
            FoodSearchBar(
              height: 50,
              width: MediaQuery.of(context).size.width - 20,
              controller: controller,
              onFieldSubmitted: (value) {
                _getSearchItemList(value);
              },
              onTap: () {
                controller.clear();
                results.clear();
              },
            ),
            (controller.text != '' && controller.text.length >= 2)
                ? results.isNotEmpty
                    ? SearchList(results: results)
                    : const Center(
                        child: CircularProgressIndicator.adaptive(),
                      )
                : Container()
          ],
        )),
      ),
    );
  }
}
