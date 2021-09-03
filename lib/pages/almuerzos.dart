import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manzana_verde/custom/manzana_styles.dart';
import 'package:manzana_verde/services/crud.dart';
import 'package:manzana_verde/widgets/almuerzo.dart';

class Almuerzos extends StatefulWidget {
  Almuerzos({Key? key}) : super(key: key);

  @override
  _AlmuerzosState createState() => _AlmuerzosState();
}

class _AlmuerzosState extends State<Almuerzos> {
  var almuerzos = [];
  @override
  void initState() {
    super.initState();
    // cargando = true;
    _obtenerAlmuerzos();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Almuerzo',
            style: GoogleFonts.openSans(
                textStyle: TextStyle(
                    color: ManzanaStyles.fourthColor,
                    fontWeight: FontWeight.w600))),
        backgroundColor: Colors.white,
        // actions: <Widget>[Text('1')],
        leading: Container(
          alignment: Alignment.center,
          child: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text('Atrás',
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: ManzanaStyles.fourthColor,
                        decoration: TextDecoration.underline))),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            for (var item in almuerzos)
              Almuerzo(
                almuerzo: item,
              ),
          ],
        )),
      ),
    );
  }

  _obtenerAlmuerzos() async {
    var p = await CrudApi().listado('Comida');
    var body = json.decode(p.body);
    print(body);
    setState(() {
      almuerzos.addAll(body);
    });
  }
}
