import 'package:fitness_app/controllers/http_calls/off_functions.dart';
import 'package:fitness_app/controllers/providers/state_providers.dart';
import 'package:fitness_app/views/diet/add_item/selected_item.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:openfoodfacts/openfoodfacts.dart';

class SearchList extends ConsumerStatefulWidget {
  const SearchList({super.key, required this.results});

  final List<Product> results;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SearchListState();
  }
}

class _SearchListState extends ConsumerState<SearchList> {
  OffFunctions _offFunctions = OffFunctions();

  @override
  Widget build(BuildContext context) {
    final selected = ref.watch(productSelectedBoolProvider);

    if (selected == false) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * 0.35,
        width: MediaQuery.of(context).size.width - 20,
        child: ListView.builder(
            itemCount: widget.results.length,
            itemBuilder: (context, index) {
              final data = widget.results[index];

              return SizedBox(
                height: 100,
                width: MediaQuery.of(context).size.width - 5,
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: Colors.lightBlue),
                    borderRadius: BorderRadius.circular(32.0),
                  ),
                  child: ListTile(
                    titleTextStyle:
                        const TextStyle(fontSize: 14.0, color: Colors.black),
                    subtitleTextStyle:
                        const TextStyle(fontSize: 10.0, color: Colors.black),
                    leadingAndTrailingTextStyle:
                        const TextStyle(fontSize: 10.0, color: Colors.black),
                    //  isThreeLine: true,
                    title: Text('${data.productName}'),
                    //  subtitle: ,
                    leading: SizedBox(
                      height: 150,
                      width: 80,
                      child: data.imageFrontUrl == null
                          ? Container()
                          : Image.network(
                              data.imageFrontUrl!,
                              width: 80,
                              height: 80,
                            ),
                    ),
                    trailing: SizedBox(
                      height: 50,
                      width: 100,
                      child: data.servingSize != null
                          ? Text('Service size: ${data.servingSize}')
                          : data.servingQuantity != null
                              ? Text(
                                  'Service Quantity: ${data.servingQuantity}')
                              : Container(),
                    ),
                    onTap: () {
                      ref.read(productSelectedBoolProvider.notifier).state =
                          true;
                      ref.read(selectedProductProvider.notifier).state = data;
                    },
                  ),
                ),
              );
            }),
      );
    } else {
      return const SelectedItem();
    }
  }
}
