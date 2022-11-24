import 'dart:async';
import 'package:counter_7/db/budget_database.dart';
import 'package:counter_7/page/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';



class MyDataPage extends StatefulWidget {
    const MyDataPage({super.key});

    @override
    State<MyDataPage> createState() => _MyDataPageState();
}

class _MyDataPageState extends State<MyDataPage> {
  final Future<List<Card>> budgetList = getData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Budget Data'),
      ),
      drawer: myDrawer(context),
      body: Center(
        child: FutureBuilder(
          future: budgetList,
          builder: (context, snapshot) {
            List<Widget> children;
            if (snapshot.hasData) {
              children = snapshot.data!;
            } else if (snapshot.hasError) {
              children = [
                const Text('an error has occured'),
              ];
            } else {
              children = [
                const Text('Looking up Data'),
              ];
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: children,
            );
          },
        ),
      ),
    );
  }
}


Future<List<Card>> getData() async {
  List<Budget> data = await budgets();
  List<Card> dataWidget = [];
  for (var i =0; i < data.length; i++){
    Budget budget = data[i];
    dataWidget.add(
      Card(
        child: ListTile(
          title: Text(
            budget.title,
            style: TextStyle(fontSize: 20),
          ),
          isThreeLine: false,
          subtitle:Column( 
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('dd-MM-yyy').format(budget.date),
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 4),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(budget.amount.toString() + '\$'),
                    Text(budget.type)
                  ],
                ),
              ),
            ],
          ),
        ),

      )
    );
  }
  return dataWidget;
}
