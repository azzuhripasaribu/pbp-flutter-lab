import 'package:counter_7/db/budget_database.dart';
import 'package:counter_7/drawer.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  TextEditingController dateinput = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String _title = "";
  int _amount = 0;
  String _type = "Choose Type";
  DateTime _date = DateTime.now();
  final List<String> _listType = ["Choose Type","Income", "Expense"];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Budget Info'),
      ),
      drawer: myDrawer(context),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Title",
                      labelText: "Title",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Behavior when data is typed
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Behavior when data is Saved
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title can not be empty';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: InputDecoration(
                      hintText: "Amount",
                      labelText: "Amount",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    // Behavior when data is typed
                    onChanged: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    // Behavior when data is Saved
                    onSaved: (String? value) {
                      setState(() {
                        _amount = int.parse(value!);
                      });
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return "Amount can not be empty";
                      }
                      // if (int.parse(value!) < 0) {
                      //   return "Amount can not be negative";
                      // }
                      return null;
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: dateinput,
                    decoration: InputDecoration(
                      icon: const Icon(Icons.calendar_today),
                      hintText: "Select a Date",
                      labelText: "Select a Date",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    readOnly: true,
                    // Behavior when data is typed
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1970),
                        lastDate: DateTime.now(),
                      );
                      if (pickedDate != null) {
                        _date = pickedDate;
                        String formatedDate = DateFormat('dd-MM-yyy').format(pickedDate);
                        setState(() {
                          dateinput.text = formatedDate;
                        });
                      }
                    },
                    // Validator as form validation
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Date is not selected';
                      }
                      return null;
                    },
                  ),
                ),
                DropdownButton<String>(
                  value: _type,
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: _listType.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _type = value!;
                    });
                  },
                ),
              ]
            ),
          ), 
        ),
      ),
      floatingActionButton: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.blue),
        ),
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            Budget budget = Budget(
              title: _title,
              amount: _amount,
              type: _type,
              date: _date,
            );

            insertBudget(budget);
          }
        },
        child: const Text(
          "Save",
          style: TextStyle(color: Colors.white),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

