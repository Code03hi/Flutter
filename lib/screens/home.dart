import 'package:flutter/material.dart';
import 'package:flutter_catalog/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    String name = "Bhagwanjha";

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: Scaffold.of(context).openDrawer,
              icon: Icon(Icons.menu),
            );
          },
        ),
        elevation: 1.2,
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        title: Text("Catalog", style: TextStyle(color: Colors.black)),
      ),
      body: Material(
        color: Colors.white,
        child: Center(child: Container(child: Text("Hello $name"))),
      ),
      drawer: MyDrawer(),
    );
  }
}
