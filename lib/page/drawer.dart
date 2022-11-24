import 'package:counter_7/main.dart';
import 'package:counter_7/model/mywatchlist.dart';
import 'package:counter_7/page/budget_data.dart';
import 'package:counter_7/page/budget_form.dart';
import 'package:counter_7/page/watch_list.dart';
import 'package:flutter/material.dart';

Drawer myDrawer(context){
  return Drawer(
    child: Column(
      children: [
        // Clickable menu
        ListTile(
          title: const Text('counter_7'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyHomePage())
            );
          }
        ),
        ListTile(
          title: const Text('Add Budget Info'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyFormPage())
            );
          }
        ),
        ListTile(
          title: const Text('Budget Data'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyDataPage())
            );
          }
        ),
        ListTile(
          title: const Text('My Watch List'),
          onTap: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const MyWatchListPage())
            );
          }
        ),
      ],
    ),
  );
}
