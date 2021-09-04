import 'package:flutter/material.dart';
import 'package:manzana_verde/pages/mis_pedidos.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Manzana Verde Test',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        color: Color.fromRGBO(229, 229, 229, 1),
        home: MisPedidos());
  }
}
