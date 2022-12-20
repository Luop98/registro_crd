import 'package:flutter/material.dart';

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
  String? name, description;
  double? price;

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
    print("create");
  }

  readData() {
    print("read");
  }

  updateData() {
    print("update");
  }

  deleteData() {
    print("delete");
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
                children: [
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
            )
          ],
        ),
      ),
    );
  }
}
