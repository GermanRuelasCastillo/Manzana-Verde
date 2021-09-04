import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manzana_verde/custom/manzana_styles.dart';

class Menu extends StatefulWidget {
  final index;
  Menu({required this.index});

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  TextStyle textStyle = GoogleFonts.openSans(
      textStyle: TextStyle(
          fontSize: 10.0,
          color: ManzanaStyles.secondaryColor,
          fontWeight: FontWeight.w600));
  TextStyle textStyleActive = GoogleFonts.openSans(
      textStyle: TextStyle(
          fontSize: 10.0,
          color: ManzanaStyles.primaryColor,
          fontWeight: FontWeight.w600));
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: Container(
            width: size.width,
            height: 100,
            child: Stack(
              children: [
                CustomPaint(
                  size: Size(size.width, 100),
                  painter: BNBCustomPainter(),
                ),
                Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                        onPressed: () {},
                        backgroundColor: ManzanaStyles.primaryColor,
                        child: Icon(Icons.add),
                        elevation: 0.1)),
                Container(
                  width: size.width,
                  height: 80,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            IconButton(
                              padding: EdgeInsets.only(bottom: 0, top: 15),
                              icon: Icon(Icons.calendar_today,
                                  color: this.widget.index == 0
                                      ? ManzanaStyles.primaryColor
                                      : ManzanaStyles.secondaryColor),
                              onPressed: () {},
                            ),
                            Text('Hoy',
                                style: this.widget.index == 0
                                    ? textStyleActive
                                    : textStyle)
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              padding: EdgeInsets.only(bottom: 0, top: 15),
                              icon: Icon(Icons.local_dining_rounded,
                                  color: this.widget.index == 1
                                      ? ManzanaStyles.primaryColor
                                      : ManzanaStyles.secondaryColor),
                              onPressed: () {},
                            ),
                            Text('Mis Pedidos',
                                style: this.widget.index == 1
                                    ? textStyleActive
                                    : textStyle)
                          ],
                        ),
                        Container(
                          width: size.width * 0.20,
                        ),
                        Column(
                          children: [
                            IconButton(
                              padding: EdgeInsets.only(bottom: 0, top: 15),
                              icon: Icon(Icons.restaurant,
                                  color: this.widget.index == 2
                                      ? ManzanaStyles.primaryColor
                                      : ManzanaStyles.secondaryColor),
                              onPressed: () {},
                            ),
                            Text('Comidas',
                                style: this.widget.index == 2
                                    ? textStyleActive
                                    : textStyle)
                          ],
                        ),
                        Column(
                          children: [
                            IconButton(
                              padding: EdgeInsets.only(bottom: 0, top: 15),
                              icon: Icon(Icons.medical_services,
                                  color: this.widget.index == 3
                                      ? ManzanaStyles.primaryColor
                                      : ManzanaStyles.secondaryColor),
                              onPressed: () {},
                            ),
                            Text('Coach',
                                style: this.widget.index == 3
                                    ? textStyleActive
                                    : textStyle)
                          ],
                        )
                      ]),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Implement painting for custom
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 20);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
