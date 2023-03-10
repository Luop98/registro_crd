import 'package:flutter/material.dart';
import 'package:registro_crd/model/dish.dart';
import 'package:registro_crd/database/dbHelper.dart';
import 'dart:async';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.lightBlue[800],
          accentColor: Colors.cyanAccent[600]),
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String name, description;
  late double price;

  getName(name) {
    this.name = name;
    print(this.name);
  }

  getDescription(description) {
    this.description = description;
    print(this.description);
  }

  getPrice(price) {
    this.price = double.parse(price);
    print(this.price);
  }

  createData() {
    setState(() {
      var dbHelper = DBHelper();
    var dish = Dish(name, description, price);
    dbHelper.createDish(dish);
    });
    
  }

  updateData() {
    setState(() {
      var dbHelper = DBHelper();
    var dish = Dish(name, description, price);
    dbHelper.updateDish(dish);
    });
    
  }

  readData() {
    var dbHelper = DBHelper();
    Future<Dish> dish = dbHelper.readDish(name);
    dish.then((dishData) {
      print("${dishData.name}, ${dishData.description},${dishData.price}, ");
    });
  }

  //video20
  Future<List<Dish>> getAllDishes() async {
    var dbHelper = DBHelper();
    Future<List<Dish>> dishes = dbHelper.readAllDishes();
    return dishes;
  }

  deleteData() {
    setState(() {
      var dbHelper = DBHelper();
    dbHelper.deleteDish(name);
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Crud"),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TextField(
              decoration: InputDecoration(hintText: "Nombre"),
              onChanged: (String name) {
                getName(name);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Description"),
              onChanged: (String description) {
                getDescription(description);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Precio"),
              onChanged: (String price) {
                getPrice(price);
              },
            ),
            SizedBox(
              height: 15.0,
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Row(
                textDirection: TextDirection.ltr,
                children: <Widget> [
                  Padding(
                    padding: EdgeInsets.only(right: 22.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.green,
                      ),
                      child: TextButton(
                        onPressed: () {
                          createData();
                        },
                        child: Text(
                          "Crear",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 22.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.lightBlue,
                      ),
                      child: TextButton(
                        onPressed: () {
                          readData();
                        },
                        child: Text(
                          "Read",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 18.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange,
                      ),
                      child: TextButton(
                        onPressed: () {
                          updateData();
                        },
                        child: Text(
                          "Actualizar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.red,
                      ),
                      child: TextButton(
                        onPressed: () {
                          deleteData();
                        },
                        child: Text(
                          "Eliminar",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    
                  ),
                  
                ],
               ),
             ),
              Row(textDirection: TextDirection.ltr,
                children: <Widget>[
                  Expanded(
                    child: Text("Name:"),
                  ),
                  Expanded(
                    child: Text("Descrici??n:"),
                  ),
                   Expanded(
                    child: Text("Precio:"),
                  ),
                ],
                ),
               /* FutureBuilder<List<Dish>>(
                  future: getAllDishes(),
                  builder: (context, snapshot){
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index){
                        
                        return  Row(
                          textDirection: TextDirection.ltr,
                children: <Widget>[
                  Expanded(
                    child: Text(name[index]),
                  ),
                  Expanded(
                    child: Text( description[index]),
                  ),
                   Expanded(
                    child: Text(price.toString()),
                  ),
                ],
                );
                      },
                    );
                  },
                )*/
           ],
        ),
      ),
    );
  }
  
  
}
