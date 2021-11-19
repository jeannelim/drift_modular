import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:category/category_database.dart';
import 'package:todo/todo_database.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // runApp(MyApp());
  final db = CategoryDatabase(NativeDatabase.memory());
  print(db.allTables);

  final db2 = TodoDatabase(NativeDatabase.memory());
  print(db2.allTables);

  db.categoryDao.allItems.listen((event) {
    print('category in database: $event');
  });

  db2.todoDao.allItems.listen((event) {
    print('Todo-item in database: $event');
  });
  // Add another entry
  await db
      .into(db.category)
      .insert(CategoryCompanion.insert(description: 'Category 1'));

  await db
      .into(db.category)
      .insert(CategoryCompanion.insert(description: 'Category 2'));

  await db2.into(db2.todo).insert(TodoCompanion.insert(
      title: 'initial test', content: 'todo 1', category: const Value(1)));

  await db2.into(db2.todo).insert(TodoCompanion.insert(
      title: 'second test', content: 'todo 2', category: const Value(2)));
}
