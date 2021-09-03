import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manzana_verde/ManzanaIcons.dart';
import 'package:manzana_verde/custom/manzana_styles.dart';

class Almuerzo extends StatefulWidget {
  final almuerzo;
  Almuerzo({this.almuerzo});

  @override
  _AlmuerzoState createState() => _AlmuerzoState();
}

class _AlmuerzoState extends State<Almuerzo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
            bottom: 20.0, top: 20.0, left: 15.0, right: 15.0),
        decoration: new BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.white),
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 1,
                  offset: Offset(0, 3))
            ]),
        child: Column(
          children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  image: DecorationImage(
                      image: NetworkImage(this.widget.almuerzo["image"]),
                      fit: BoxFit.cover)),
            ),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width * 0.5,
                  child: Text(
                    this.widget.almuerzo['nombre'],
                    textAlign: TextAlign.start,
                    maxLines: 2,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                      color: ManzanaStyles.primaryColor,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.none,
                      fontSize: 17,
                    )),
                  ),
                ),
                this.widget.almuerzo["recomendado"] == true
                    ? Container(
                        alignment: Alignment.center,
                        height: 35,
                        width: 120,
                        color: Color.fromRGBO(53, 178, 102, 0.1),
                        child: Text('Recomendado',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.openSans(
                                textStyle: TextStyle(
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                    fontWeight: FontWeight.w600,
                                    color: ManzanaStyles.primaryColor))),
                      )
                    : SizedBox()
              ],
            ),
            SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(width: 5),
                Container(
                  width: 100,
                  child: Text(this.widget.almuerzo['calorias'] + 'Kcal',
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                        color: ManzanaStyles.fourthColor,
                        fontWeight: FontWeight.w600,
                      ))),
                ),
                Row(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 5, right: 5),
                        child: SvgPicture.asset('assets/icons/carbs.svg')),
                    this.widget.almuerzo["bajoGluten"] == true
                        ? Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: SvgPicture.asset('assets/icons/gluten.svg'))
                        : SizedBox(),
                    this.widget.almuerzo["bajoAzucar"] == true
                        ? Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: SvgPicture.asset('assets/icons/sugar.svg'))
                        : SizedBox(),
                    this.widget.almuerzo["bajoCarbohidratos"] == true
                        ? Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: SvgPicture.asset('assets/icons/fat.svg'))
                        : SizedBox(),
                    this.widget.almuerzo["lactosa"] == true
                        ? Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: SvgPicture.asset('assets/icons/lactosa.svg'))
                        : SizedBox(),
                    this.widget.almuerzo["bajoSodio"] == true
                        ? Padding(
                            padding: EdgeInsets.only(left: 5, right: 5),
                            child: SvgPicture.asset('assets/icons/sodium.svg'))
                        : SizedBox(),
                  ],
                ),
                SizedBox(width: 5),
              ],
            ),
            SizedBox(height: 15),
          ],
        ));
  }
}
