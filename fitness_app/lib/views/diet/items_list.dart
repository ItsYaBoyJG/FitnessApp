import 'package:flutter/material.dart';

//TODO: add db data for added items
class ItemsList extends StatefulWidget {
  const ItemsList({super.key, required this.listData});

  final Map<String, dynamic> listData;

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
          itemCount: widget.listData.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Text('${widget.listData}'),
                trailing: Text('Item Serving Size'),
              ),
            );
          }),
    );
  }
}
