import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: "Exploring ListView",
        home: Scaffold(
          appBar: AppBar(
            title: Text('Long List'),
          ),
          body: getListView(),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              debugPrint('Fab Clicked');
            },
            child: Icon(Icons.add),
            tooltip: 'Add One More Item',
          ),
        ),
      ),
    );

void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
      content: Text('You just tapped the $item'),
      action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            print('Performing dummy UNDO operation');
          }));

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// Data Source
List<String> getListElements() {
  var items = List<String>.generate(1000, (index) => 'Item $index');
  return items;
}

Widget getListView() {
  var listItems = getListElements();

  ListView listView = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
        showSnackBar(context, listItems[index]);
      },
    );
  });
  return listView;
}
