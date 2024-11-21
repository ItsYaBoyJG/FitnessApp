import 'package:fitness_app/views/diet/add_item/additempage.dart';
import 'package:fitness_app/views/diet/items_list.dart';
import 'package:flutter/material.dart';

class TabViewBase extends StatelessWidget {
  const TabViewBase({super.key, required this.tabName});

  final String tabName;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: const Color.fromRGBO(219, 228, 255, 1.0),
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Track my $tabName',
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Color.fromRGBO(122, 158, 255, 1.0),
                    ),
                  ),
                  IconButton(
                      onPressed: () async {
                        await showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return AddItemPage(
                                tabName: tabName,
                              );
                            });
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
            ),
            ItemsList(
              tabName: tabName,
              itemCount: 5,
            )
          ],
        ),
      ),
    );
  }
}
