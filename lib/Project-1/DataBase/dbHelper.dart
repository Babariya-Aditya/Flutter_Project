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
  static final String _image = 'image';
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
      path,
      version: _dbVersion,
      onCreate: (db, version) {
        return db.execute(
            'CREATE TABLE $_tableCategory ($_id INTEGER PRIMARY KEY AUTOINCREMENT,'
            '$_title TEXT,'
            '$_desc TEXT,'
                '$_image TEXT,'
            '$_date INTEGER)');
      },
    );
  }

  Future<int?> insert(Category category) async {
    final db = await getDatabase();
    return await db?.insert(_tableCategory, category.toMap());
  }

  Future<List<Category>> getCategoryList() async {
    List<Category> categoryList = [];
    final db = await getDatabase();
    final List<Map<String, dynamic>> list =
        await db!.rawQuery("select * from $_tableCategory");
    categoryList =
        List.generate(list.length, (index) => Category.fromMap(list[index]))
            .toList();
    return categoryList;
  }

  Future<int> update(Category? category) async {
    final db = await getDatabase();
    return await db!.update(_tableCategory, category!.toMap(),
        where: '$_id=?', whereArgs: [category.id]);
  }
  Future<int>delete(int id) async {
    final db= await getDatabase();
    return await db!.delete(_tableCategory,where: '$_id',whereArgs: [id]);
  }
}
