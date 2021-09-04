import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manzana_verde/custom/manzana_styles.dart';
import 'package:manzana_verde/pages/almuerzos.dart';
import 'package:manzana_verde/services/crud.dart';
import 'package:manzana_verde/widgets/titulo_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ItemPedido extends StatefulWidget {
  final pedido;
  ItemPedido({this.pedido});

  @override
  _ItemPedidoState createState() => _ItemPedidoState();
}

class _ItemPedidoState extends State<ItemPedido> {
  var almuerzo = [];
  @override
  void initState() {
    super.initState();
    if (this.widget.pedido["pedido"] != '') {
      _obtenerPlato();
    }
  }

  Widget build(BuildContext context) {
    return this.widget.pedido["pedido"] == ''
        ? Container(
            margin: EdgeInsets.only(bottom: 15),
            height: 87,
            // color: ManzanaStyles.backgroud,
            decoration: BoxDecoration(
              color: ManzanaStyles.backgroud,
              border: Border.all(
                color: ManzanaStyles.secondaryColor,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SvgPicture.asset(
                  'assets/icons/' + this.widget.pedido["icon"] + '.svg',
                  height: 39,
                  color: this.widget.pedido["creditos"] == false
                      ? ManzanaStyles.secondaryColor
                      : ManzanaStyles.primaryColor,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      this.widget.pedido["titulo"],
                      style: TextStyle(
                          color: this.widget.pedido["creditos"] == false
                              ? ManzanaStyles.secondaryColor
                              : ManzanaStyles.primaryColor),
                    ),
                    Text(this.widget.pedido["calorias"])
                  ],
                ),
                this.widget.pedido["creditos"] == false
                    ? Text('No tienes créditos')
                    : FlatButton(
                        child: Text(
                          'Agregar',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                                  fontSize: 15.0, fontWeight: FontWeight.w600)),
                        ),
                        color: ManzanaStyles.thirdColor,
                        textColor: ManzanaStyles.fourthColor,
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoPageRoute(
                              fullscreenDialog: true,
                              builder: (context) => Almuerzos(),
                            ),
                          );
                        },
                      ),
              ],
            ))
        : Container(
            margin: EdgeInsets.only(bottom: 15),
            height: 87,
            decoration: new BoxDecoration(
              border: Border.all(width: 1, color: ManzanaStyles.fourthColor),
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: this.almuerzo.length > 0
                ? Row(
                    // textDirection: TextDirection.rtl,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return DetailScreen(
                              image: this.almuerzo[0]["image"] ?? '',
                            );
                          }));
                        },
                        child: Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12.0)),
                              image: DecorationImage(
                                  image:
                                      NetworkImage(this.almuerzo[0]['image']),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(
                              this.almuerzo[0]['nombre'] ?? '',
                              maxLines: 2,
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: ManzanaStyles.primaryColor,
                              )),
                            ),
                          ),
                          SubTitulo(
                            titulo: this.almuerzo[0]['calorias'] ?? '' + 'Kcal',
                          )
                        ],
                      ),
                      InkWell(
                        onTap: _eliminarPedido,
                        child: SvgPicture.asset('assets/icons/delete.svg'),
                      )
                    ],
                  )
                : SizedBox(),
          );
  }

  void _obtenerPlato() async {
    var alm = json.decode(this.widget.pedido["pedido"]);
    var p = await CrudApi().listado('Comida/' + alm["id_almuerzo"]);
    var body = json.decode(p.body);
    setState(() {
      almuerzo.add(body);
    });
  }

  void _eliminarPedido() async {
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.remove('pedido');
    setState(() {
      this.almuerzo = [];
      this.widget.pedido["pedido"] = '';
    });
  }
}
