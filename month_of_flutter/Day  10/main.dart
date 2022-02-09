import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        title: "Exploring ListView",
        home: Scaffold(
          appBar: AppBar(
            title: Text('Basic List View'),
          ),
          body: getListView(),
        ),
      ),
    );

Widget getListView() {
  ListView listView = ListView(
    children: [
      ListTile(
        leading: Icon(Icons.landscape),
        title: Text('Landscape'),
        subtitle: Text('Beautiful View'),
        trailing: Icon(Icons.wb_sunny),
        onTap: () {
          print('LandScape button pressed');
        },
      ),
      ListTile(
        leading: Icon(Icons.laptop),
        title: Text('Windows'),
      ),
      ListTile(
        leading: Icon(Icons.phone),
        title: Text('Phone'),
      ),
      Text('Another element in List'),
      Container(
        decoration: BoxDecoration(color: Colors.red),
        height: 60,
      )
    ],
  );
  return listView;
}
