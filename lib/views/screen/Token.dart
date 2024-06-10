import 'package:flutter/material.dart';

class MyDismissibleList extends StatefulWidget {
  const MyDismissibleList({super.key});

  @override
  State<MyDismissibleList> createState() => _MyDismissibleListState();
}

class _MyDismissibleListState extends State<MyDismissibleList> {
  final List<String> items = List<String>.generate(10, (i) => 'Item ${i + 1}');
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Dismissible(
            key: Key(item),
            onDismissed: (direction) {
              setState(() {
                items.removeAt(index);
              });
            },
            background: Container(
              color: Colors.red,
            ),
            child: ListTile(
              title: Text('$item'),
            ),
          );
        });
  }
}
