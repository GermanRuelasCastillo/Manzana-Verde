import 'package:flutter/material.dart';
import 'package:manzana_verde/widgets/menu.dart';

class Hoy extends StatefulWidget {
  // Hoy({Key? key}) : super(key: key);

  @override
  _HoyState createState() => _HoyState();
}

class _HoyState extends State<Hoy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Row(
              children: [Text('Hoy')],
            )
          ],
        ),
        bottomNavigationBar: Menu(index: 0));
  }
}
