import 'package:fitness_app/controllers/off_calls/off_functions.dart';
import 'package:fitness_app/models/search/search_bar.dart';
import 'package:fitness_app/views/diet/add_item/search_list.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key, required this.tabName});

  final String tabName;

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController controller = TextEditingController();
  OffFunctions _offFunctions = OffFunctions();

  List<Product> results = [];

  _getSearchItemList(String value) async {
    final result = await _offFunctions.getItemSuggestions(value);

    setState(() {
      results = result!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.80,
        width: double.infinity,
        child: Form(
            child: Column(
          children: [
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.fromLTRB(15.0, 0.5, 2.0, 1.5),
                  child: Text('Add or search for item.'),
                ),
                OutlinedButton(onPressed: () {}, child: const Text('Add +'))
              ],
            ),
            FoodSearchBar(
              height: 50,
              width: MediaQuery.of(context).size.width - 20,
              controller: controller,
              onFieldSubmitted: (value) {
                _getSearchItemList(value);
              },
            ),
            SearchList(results: results)
          ],
        )),
      ),
    );
  }
}
