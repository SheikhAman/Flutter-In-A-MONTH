import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: "Exploring ListView",
        home: Scaffold(
          appBar: AppBar(
            title: Text('Long List'),
          ),
          body: getListView(),
        ),
      ),
    );

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
        debugPrint('${listItems[index]} was tapped');
      },
    );
  });
  return listView;
}
