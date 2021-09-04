import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manzana_verde/custom/manzana_styles.dart';
import 'package:manzana_verde/pages/mis_pedidos.dart';
import 'package:manzana_verde/widgets/titulo_bar.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:shared_preferences/shared_preferences.dart';

class DetalleAlmuerzo extends StatefulWidget {
  final almuerzo;
  DetalleAlmuerzo({this.almuerzo});

  @override
  _DetalleAlmuerzoState createState() => _DetalleAlmuerzoState();
}

class _DetalleAlmuerzoState extends State<DetalleAlmuerzo> {
  bool camote = false;
  bool papa = false;
  bool arroz = false;
  bool picante = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Titulo(titulo: 'Detalle'),
        leading: ManzanaBackButton(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // IMAGEN
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DetailScreen(
                      image: this.widget.almuerzo["image"],
                    );
                  }));
                },
                child: Container(
                  height: 230,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      image: DecorationImage(
                          image: NetworkImage(this.widget.almuerzo["image"]),
                          fit: BoxFit.cover)),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              // TITULO
              Text(
                this.widget.almuerzo["nombre"],
                style: GoogleFonts.openSans(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w700)),
              ),
              SizedBox(
                height: 15,
              ),
              // ES RECOMENDADO
              this.widget.almuerzo["recomendado"] == true
                  ? Row(
                      children: [ManzanaRecomendado()],
                    )
                  : SizedBox(),
              SizedBox(
                height: 15,
              ),
              // INGREDIENTES
              Text('Ingredientes: ' + this.widget.almuerzo["ingredientes"]),
              SizedBox(
                height: 15,
              ),
              // TABLA NUTRICIONAL
              Container(
                height: 70,
                decoration: new BoxDecoration(
                  border:
                      Border.all(width: 1, color: ManzanaStyles.fourthColor),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  // textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SubTitulo(titulo: 'Kcal'),
                        TituloVerde(titulo: this.widget.almuerzo["calorias"])
                      ],
                    ),
                    Container(
                        height: 35, width: 1, color: ManzanaStyles.fourthColor),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SubTitulo(titulo: 'Grasa'),
                        TituloVerde(titulo: this.widget.almuerzo["grasa"])
                      ],
                    ),
                    Container(
                        height: 35, width: 1, color: ManzanaStyles.fourthColor),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SubTitulo(titulo: 'Carbo'),
                        TituloVerde(
                            titulo: this.widget.almuerzo["carbohidratos"])
                      ],
                    ),
                    Container(
                        height: 35, width: 1, color: ManzanaStyles.fourthColor),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SubTitulo(titulo: 'Prote'),
                        TituloVerde(titulo: this.widget.almuerzo["proteinas"])
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 22,
              ),
              // CARACTERISTICAS
              Container(
                child: Wrap(
                  children: [
                    this.widget.almuerzo["bajoGluten"] == true
                        ? _aditamentos('gluten', 'Bajo en gluten')
                        : SizedBox(),
                    this.widget.almuerzo["bajoAzucar"] == true
                        ? _aditamentos('sugar', 'Bajo en azucar')
                        : SizedBox(),
                    this.widget.almuerzo["noEngorda"] == true
                        ? _aditamentos('fat', 'No engorda')
                        : SizedBox(),
                    this.widget.almuerzo["lactosa"] == true
                        ? _aditamentos('lactosa', 'Sin lactosa')
                        : SizedBox(),
                    this.widget.almuerzo["bajoSodio"] == true
                        ? _aditamentos('sodium', 'Bajo en sodio')
                        : SizedBox(),
                    this.widget.almuerzo["bajoCarbohidratos"] == true
                        ? _aditamentos('carbs', 'Bajo en carbo')
                        : SizedBox(),
                  ],
                ),
              ),
              // ENSALADA CESAR
              // TODO: agrega funcionalidad de agregar ensalada al pedido
              Container(
                height: 89,
                decoration: new BoxDecoration(
                  border:
                      Border.all(width: 1, color: ManzanaStyles.fourthColor),
                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Row(
                  // textDirection: TextDirection.rtl,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          image: DecorationImage(
                              image: NetworkImage(
                                  "https://backend.manzanaverde.la/api/v1/photo/1200x625-122-ensalada-cesar.jpeg"),
                              fit: BoxFit.cover)),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ensalada Cesar',
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          )),
                        ),
                        ManzanaRecomendado(),
                        SubTitulo(
                          titulo: '200Kcal',
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                              ManzanaStyles.thirdColor)),
                      child: Text(
                        'Agregar',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                color: ManzanaStyles.fourthColor,
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              _checkbox('Camote', camote),
              _checkbox('Papa', papa),
              _checkbox('Arroz', arroz),
              Divider(
                color: ManzanaStyles.fourthColor,
              ),
              _checkbox('Incluir picante', picante),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: ManzanaStyles.thirdColor,
                    fixedSize: Size(MediaQuery.of(context).size.width, 51)),
                onPressed: _pedido,
                child: Text('Agregar al pedido',
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: ManzanaStyles.fourthColor,
                            fontWeight: FontWeight.w600,
                            fontSize: 14))),
              ),
              SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  _aditamentos(icon, label) {
    return Container(
      margin: EdgeInsets.only(bottom: 15, top: 10),
      width: MediaQuery.of(context).size.width * 0.3,
      child: Row(
        children: [
          SvgPicture.asset('assets/icons/' + icon + '.svg'),
          SizedBox(width: 5),
          SubTitulo(
            titulo: label,
          )
        ],
      ),
    );
  }

  _checkbox(label, controller) {
    return CheckboxListTile(
      title: Text(
        label,
        style: TextStyle(color: ManzanaStyles.fourthColor),
      ),
      onChanged: (bool? value) {
        // TODO: con datos danimicos aca se podria reducir las condicionales
        setState(() {
          if (label == 'Camote') {
            camote = !camote;
          } else if (label == 'Papa') {
            papa = !papa;
          } else if (label == 'Arroz') {
            arroz = !arroz;
          } else {
            picante = !picante;
          }
        });
      },
      value: controller,
      activeColor: ManzanaStyles.primaryColor,
      checkColor: Colors.white,
      controlAffinity: ListTileControlAffinity.leading,
    );
  }

  _pedido() async {
    var data = {
      'id_almuerzo': this.widget.almuerzo["id"],
      'arroz': this.arroz,
      'papa': this.papa,
      'camote': this.camote,
      'picante': this.picante,
    };
    SharedPreferences storage = await SharedPreferences.getInstance();
    storage.setString('pedido', json.encode(data));
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => MisPedidos()),
        (Route<dynamic> route) => false);
  }
}
