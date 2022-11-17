import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


Future<Database> getDatabase() async {
  // Avoid errors caused by flutter upgrade.
  // Importing 'package:flutter/widgets.dart' is required.
  WidgetsFlutterBinding.ensureInitialized();
  // Open the database and store the reference.
  final database = openDatabase(
    // Set the path to the database. Note: Using the `join` function from the
    // `path` package is best practice to ensure the path is correctly
    // constructed for each platform.
    join(await getDatabasesPath(), 'budget_database.db'),
    // When the database is first created, create a table to store budget.
    onCreate: (db, version) {
      // Run the CREATE TABLE statement on the database.
      return db.execute(
        'CREATE TABLE budget(id INTEGER PRIMARY KEY, title TEXT, amount INTEGER, type TEXT, date DATETIME)',
      );
    },
    // Set the version. This executes the onCreate function and provides a
    // path to perform database upgrades and downgrades.
    version: 1,
  );

  return database;
}

// Define a function that inserts budgets into the database
Future<void> insertBudget(Budget budget) async {
  // Get a reference to the database.
  final db = await getDatabase();

  // Insert the budget into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  await db.insert(
    'budget',
    budget.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Budget>> budgets() async{
  // Get a reference to the database.
  final db = await getDatabase();

  // Query the table for all The Budgets.
  final List<Map<String, dynamic>> maps = await db.query('budget');

  // Convert the List<Map<String, dynamic> into a List<Budget>.
  return List.generate(maps.length, (i) {
    return Budget(
      title: maps[i]['title'],
      amount: maps[i]['amount'],
      type: maps[i]['type'],
      date: maps[i]['date'],
    );
  });
}

/// A class for budget entry
class Budget {
  final String title;
  final int amount;
  final String type;
  final DateTime date;

  const Budget({
    required this.title,
    required this.amount,
    required this.type,
    required this.date,
  });
  // Convert a budget into a Map
  Map<String, dynamic> toMap() {
    return {
      'title' : title,
      'name' : amount,
      'type' : type,
      'date' : date,
    };
  }
}

