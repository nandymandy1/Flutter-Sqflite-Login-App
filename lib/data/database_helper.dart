import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';
import '../models/User.dart';

class DataBaseHelper {
  static final DataBaseHelper _instance = new DataBaseHelper.internal();
  factory DataBaseHelper() => _instance;
  static Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDb();
    return _db;
  }

  DataBaseHelper.internal();

  // To create the databse
  initDb() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "main.db");
    var ourDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return ourDb;
  }

  // _onCreate to create the database and its table
  void _onCreate(Database db, int version) async {
    await db.execute(
        "CREATE TABLE User(id INTEGER PRIMARY KEY, username TEXT, password TEXT)");
    print('Table is created');
  }

  // INSERTION Save the user when the user loggs in
  Future<int> saveUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.insert("User", user.toMap());
    return res;
  }

  // DELETION
  Future<int> deleteUser(User user) async {
    var dbClient = await db;
    int res = await dbClient.delete("User");
    return res;
  }
}
