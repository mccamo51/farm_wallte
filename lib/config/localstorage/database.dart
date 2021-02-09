import 'package:farmWallet/model/RecordModel.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:path/path.dart';

class DBProvider {
  DBProvider._();
  static final DBProvider db = DBProvider._();
  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'farmerRecord.db'),
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE records (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            fullname TEXT,
            gender TEXT,
            age TEXT,
            location TEXT,
            image TEXT,
            phone TEXT,
            createDate TEXT
          )
      ''');
      },
      version: 1,
    );
  }

  //inserting intp the database
  addOfflineRedcord(RecordModel model) async {
    final db = await database;

    var res = await db.rawInsert('''
      INSERT INTO records (
        fullname,
        gender,
        age,
        location,
        image,
        phone,
        createDate
      ) VALUES (?,?, ?, ?, ?, ?, ?)
    ''', [
      model.fullname,
      model.gender,
      model.age,
      model.location,
      model.image,
      model.phoneNumber,
      model.date
    ]);

    return res;
  }

  getOfflineRecords() async {
    final db = await database;
    var res = await db.rawQuery("SELECT * FROM records");
    return res.toList();
  }

  deleteOfflineRecord(int id) async {
    final db = await database;
    var res = await db.rawDelete("DELETE FROM records WHERE id=$id");
    return res;
  }
}
