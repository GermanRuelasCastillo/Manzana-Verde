import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manzana_verde/custom/manzana_styles.dart';

class Titulo extends StatelessWidget {
  final titulo;
  const Titulo({this.titulo});

  @override
  Widget build(BuildContext context) {
    return Text(this.titulo,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(
                color: ManzanaStyles.fourthColor,
                fontWeight: FontWeight.w600)));
  }
}

class ManzanaBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}

class ManzanaRecomendado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 35,
      width: 120,
      color: Color.fromRGBO(53, 178, 102, 0.1),
      child: Text('Recomendado',
          style: GoogleFonts.openSans(
              textStyle: TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  fontWeight: FontWeight.w600,
                  color: ManzanaStyles.primaryColor))),
    );
  }
}

class TituloVerde extends StatelessWidget {
  final titulo;
  const TituloVerde({this.titulo});
  @override
  Widget build(BuildContext context) {
    return Text(this.titulo,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(
                fontSize: 16,
                color: ManzanaStyles.primaryColor,
                fontWeight: FontWeight.w600)));
  }
}

class SubTitulo extends StatelessWidget {
  final titulo;
  const SubTitulo({this.titulo});
  @override
  Widget build(BuildContext context) {
    return Text(this.titulo,
        style: GoogleFonts.openSans(
            textStyle: TextStyle(
                fontSize: 12,
                color: ManzanaStyles.fourthColor,
                fontWeight: FontWeight.w600)));
  }
}

class DetailScreen extends StatelessWidget {
  final image;
  const DetailScreen({this.image});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ManzanaStyles.fourthColor,
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'Manzana Verde',
            child: Image.network(
              this.image,
            ),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
