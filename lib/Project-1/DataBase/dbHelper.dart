import 'package:adi_project/Project-1/Modal/category.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Db_helper {

  static final String _dbname = 'Shopio.db';
  static final int _dbVersion = 1;
  static Database? _database;
  static final String _tableCategory = 'category';

  static final String _id = 'id';
  static final String _title = 'title';
  static final String _desc = 'description';
  static final String _date = 'date';

  Future<Database?> getDatabase() async {
    if (_database == null) {
      _database = await createDatabase();
    }
    return _database;
  }

  Future<Database?> createDatabase() async {
    var path = join(await getDatabasesPath(), _dbname);
    print("path: $path");
    return await openDatabase(
      path, version: _dbVersion, onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE $_tableCategory ($_id INTEGER PRIMARY KEY AUTOINCREMENT,$_title TEXT,$_desc TEXT,$_date INTEGER)');

    },);
  }
  Future<int?> insertDatabase(Category category) async {
    final db = await  getDatabase();
    return await db?.insert(_tableCategory,category.toMap());
  }


}