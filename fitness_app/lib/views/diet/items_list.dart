import 'package:flutter/material.dart';

//TODO: add db data for added items
class ItemsList extends StatefulWidget {
  const ItemsList({super.key, required this.tabName, required this.itemCount});

  final String tabName;
  final int itemCount;

  @override
  State<ItemsList> createState() => _ItemsListState();
}

class _ItemsListState extends State<ItemsList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.65,
      width: MediaQuery.of(context).size.width - 10,
      child: ListView.builder(
          itemCount: widget.itemCount,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text('Item Name'),
                trailing: Text('Item Serving Size'),
              ),
            );
          }),
    );
  }
}
