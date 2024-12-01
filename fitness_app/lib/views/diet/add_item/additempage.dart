import 'package:fitness_app/backend/auth/user_auth.dart';
import 'package:fitness_app/backend/writes/write_to_db.dart';
import 'package:fitness_app/controllers/http_calls/off_functions.dart';
import 'package:fitness_app/models/widgets/search/search_bar.dart';
import 'package:fitness_app/views/diet/add_item/search_list.dart';
import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class AddItemPage extends StatefulWidget {
  const AddItemPage({super.key, required this.tabName, required this.date});

  final String tabName;
  final DateTime date;

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  TextEditingController controller = TextEditingController();
  final OffFunctions _offFunctions = OffFunctions();
  final WriteToDb _writeToDb = WriteToDb();
  final UserAuth _userAuth = UserAuth();

  List<Product> results = [];

  void _getSearchItemList(String value) async {
    final result = await _offFunctions.getItemSuggestions(value);
    print(result);

    if (result == '' || result == null) {
      print('nothing ');
    }

    setState(() {
      //  results = result!;
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
                OutlinedButton(
                    onPressed: () {
                      //  _writeToDb.saveMealItem(_userAuth.getUserId(), date, name, count, calories, meal)
                    },
                    child: const Text('Add +'))
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
