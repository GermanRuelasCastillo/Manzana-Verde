import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manzana_verde/custom/manzana_styles.dart';

class ItemPedido extends StatefulWidget {
  final pedido;
  ItemPedido({this.pedido});

  @override
  _ItemPedidoState createState() => _ItemPedidoState();
}

class _ItemPedidoState extends State<ItemPedido> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Icon(
            this.widget.pedido["icon"],
            size: 39,
            // color: ManzanaStyles.primaryColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(this.widget.pedido["titulo"]),
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
                  onPressed: () {},
                ),
        ],
      ),
    );
  }
}
