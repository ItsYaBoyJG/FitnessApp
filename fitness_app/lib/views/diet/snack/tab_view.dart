import 'package:fitness_app/backend/auth/user_auth.dart';
import 'package:fitness_app/controllers/providers/state_providers.dart';
import 'package:fitness_app/controllers/providers/stream_providers.dart';
import 'package:fitness_app/models/equatables/date_id_eq.dart';
import 'package:fitness_app/views/diet/add_item/additempage.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SnackTabView extends ConsumerStatefulWidget {
  const SnackTabView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _SnackTabViewState();
  }
}

class _SnackTabViewState extends ConsumerState<SnackTabView> {
  final UserAuth _userAuth = UserAuth();

  @override
  Widget build(BuildContext context) {
    final date = ref.watch(dateTimeProvider);
    final item = ref.watch(snackItemStreamProvider(
        DateIdEquatable(id: _userAuth.getUserId(), date: date)));
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
                children: [
                  const Text(
                    'Add Snack',
                    style: TextStyle(
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
                                date: date,
                                tabName: 'snack',
                              );
                            });
                      },
                      icon: const Icon(Icons.add))
                ],
              ),
            ),
            item.when(data: (data) {
              if (data.docs.isNotEmpty) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * 0.65,
                    width: MediaQuery.of(context).size.width - 20,
                    child: ListView(
                      children: data.docs.map((value) {
                        Map<String, dynamic> listData =
                            value.data() as Map<String, dynamic>;
                        return Card(
                          child: ListTile(
                            title: Text('${listData['name']}'),
                            subtitle: Text('${listData['count']}'),
                            trailing: Text('${listData['calories']}'),
                          ),
                        );
                      }).toList(),
                    ));
              } else {
                return Container();
              }
            }, error: (error, stackTrace) {
              return ErrorWidget(error);
            }, loading: () {
              return const CircularProgressIndicator.adaptive();
            })
          ],
        ),
      ),
    );
  }
}
