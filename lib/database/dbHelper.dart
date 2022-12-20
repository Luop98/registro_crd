import 'package:registro_crd/model/dish.dart';
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

  //creacion de datos

  Future<int> createDish (Dish dish) async{
    var dbReady = await db;
    return await dbReady!.rawInsert("INSERT INTO Dishes(name, description, price)VALUES ('${dish.name} ', '${dish.description} ','${dish.price} ')");
  }

  //actualizacion de datos

  Future <int> updateDish (Dish dish)async{
    var dbReady = await db;
    return await dbReady!.rawInsert("UPDATE Dish SET description = '${dish.description}',price = ' ${dish.price}' WHERE name = ' ${dish.name}' ");
    
  }

  //elimiar datos
 Future <int> deleteDish (String name)async{

   var dbReady = await db;
  return await dbReady!.rawInsert("DELETE FROM Dishes WHERE name = '$name '");
 }

 //lectura de datos

 Future <Dish> readDish (String name)async{
  var dbReady = await db;
  var read = await dbReady!.rawQuery("SELECT * FROM Dishes WHERE name = '${name} '");

  return Dish.fromMap(read[0]);

 }

}