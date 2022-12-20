import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class DBHelper{
  initBD ()async{
    String databasePath = await getDatabasesPath();
    String path = join(databasePath,"dishesDb.db");


    var db = await openDatabase(path,version: 1, onCreate: onCreate);
    return db;
  }
  void onCreate(Database db, int version)async{
    await db.execute("CREATE TABLE Dishes (name TEXT, description TEXT, price DOUBLE)");
  }
}