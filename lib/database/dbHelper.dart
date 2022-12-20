import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';

class DBHelper{

  Database? _db;

  initBD ()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,"dishesDb.db");


    var db = await openDatabase(path,version: 1, onCreate: onCreate);
    return db;
  }
  void onCreate(Database db, int version)async{
    await db.execute("CREATE TABLE Dishes (name TEXT, description TEXT, price DOUBLE)");
  }

  Future <Database?> get db async{
      if(_db == null){
        _db = await initBD();
        return _db;
      }else{
        return _db; 
      }
  }
}