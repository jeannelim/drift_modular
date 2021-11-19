import 'package:drift/drift.dart';
import 'package:todo/todo_database.dart';

part 'todo_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Todo])
class TodoDao extends DatabaseAccessor<TodoDatabase> with _$TodoDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  TodoDao(TodoDatabase db) : super(db);

  Stream<List<TodoData>> get allItems => select(todo).watch();
}
