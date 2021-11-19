import 'package:drift/drift.dart';
import 'package:category/category_database.dart';

part 'category_dao.g.dart';

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(tables: [Category])
class CategoryDao extends DatabaseAccessor<CategoryDatabase>
    with _$CategoryDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CategoryDao(CategoryDatabase db) : super(db);

  // Stream<List<TodoEntry>> todosInCategory(Category category) {
  //   if (category == null) {
  //     return (select(todos)..where((t) => isNull(t.category))).watch();
  //   } else {
  //     return (select(todos)..where((t) => t.category.equals(category.id)))
  //         .watch();
  //   }
  // }
  Stream<List<CategoryData>> get allItems => select(category).watch();

  // Future<List<Todo>> get allTodos => select(todos).get();

  // Stream<List<TodoWithCategory>> get todoWithCategory {
  //   final query = select(todos).join([
  //     leftOuterJoin(categories, categories.id.equalsExp(todos.category)),
  //   ]);
  //   return query.watch().map((rows) {
  //     return rows.map((row) {
  //       return TodoWithCategory(
  //         row.readTable(todos),
  //         row.readTable(categories),
  //       );
  //     }).toList();
  //   });
  // }
}

// class TodoWithCategory {
//   TodoWithCategory(this.todo, this.category);

//   final Todo todo;
//   final Category category;
// }
