import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manzana_verde/custom/manzana_styles.dart';
import 'package:manzana_verde/pages/detalle_almuerzo.dart';
import 'package:manzana_verde/services/crud.dart';
import 'package:manzana_verde/widgets/almuerzo.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:manzana_verde/widgets/skeleton_almuerzos.dart';
import 'package:manzana_verde/widgets/titulo_bar.dart';

class Almuerzos extends StatefulWidget {
  Almuerzos({Key? key}) : super(key: key);

  @override
  _AlmuerzosState createState() => _AlmuerzosState();
}

class _AlmuerzosState extends State<Almuerzos> {
  DatePickerController _controller = DatePickerController();
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
          title: Titulo(titulo: 'Almuerzo'),
          backgroundColor: Colors.white,
          // TODO: poner funcionalidad de dia heredado de listado de pedidos
          actions: <Widget>[
            Container(
                margin: EdgeInsets.only(right: 10),
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Text(
                      'Vie',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              fontSize: 17,
                              color: ManzanaStyles.fourthColor,
                              fontWeight: FontWeight.w600)),
                    ),
                    Text('29',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontSize: 18,
                                color: ManzanaStyles.fourthColor,
                                fontWeight: FontWeight.w600)))
                  ],
                ))
          ],
          leading: ManzanaBackButton()),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            this.almuerzos.length == 0
                ? ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SkeletonAlmuerzos(
                        index: index,
                      );
                    })
                : ListView.builder(
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: almuerzos.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context) =>
                                  DetalleAlmuerzo(almuerzo: almuerzos[index]),
                            ),
                          );
                        },
                        child: Almuerzo(
                          almuerzo: almuerzos[index],
                        ),
                      );
                    })
          ],
        )),
      ),
    );
  }

  _obtenerAlmuerzos() async {
    var p = await CrudApi().listado('Comida');
    var body = json.decode(p.body);
    setState(() {
      almuerzos.addAll(body);
    });
  }
}
