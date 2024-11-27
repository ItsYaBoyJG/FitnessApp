import 'package:flutter/material.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class SearchList extends StatefulWidget {
  const SearchList({super.key, required this.results});

  final List<Product> results;

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.30,
      width: MediaQuery.of(context).size.width - 20,
      child: ListView.builder(
          itemCount: widget.results.length,
          itemBuilder: (context, index) {
            final data = widget.results[index];
            return Card(
              shape: RoundedRectangleBorder(
                side: const BorderSide(color: Colors.lightBlue),
                borderRadius: BorderRadius.circular(32.0),
              ),
              child: ListTile(
                isThreeLine: true,
                leading: data.genericName == ''
                    ? Text('${data.productName}')
                    : data.productName == ''
                        ? Text('$data.abbreviatedName')
                        : Text('${data.genericName}'),
                trailing: Text('${data.servingSize}'),
                subtitle: Text('${data.brands}'),
                onTap: () {},
              ),
            );
          }),
    );
  }
}
