import 'package:flutter/material.dart';

class DismissibleList extends StatefulWidget {
  const DismissibleList({super.key});

  @override
  State<DismissibleList> createState() => _DismissibleListState();
}

class _DismissibleListState extends State<DismissibleList> {
  final List<String> notiList = [];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: notiList.length,
        itemBuilder: (context, index) {
          final item = notiList[index];
          return Dismissible(
              key: Key(item),
              onDismissed: (direction) {
                setState(() {});
              },
              confirmDismiss: (direction) async {
                return await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Confirm'),
                        content: Text(''),
                        actions: <Widget>[],
                      );
                    });
              },
              background: Container(
                color: Colors.red,
              ),
              child: ListTile(
                title: Text(''),
              ));
        });
  }
}
