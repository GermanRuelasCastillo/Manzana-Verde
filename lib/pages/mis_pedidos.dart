import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manzana_verde/bloc/pedido_bloc.dart';
import 'package:manzana_verde/custom/manzana_styles.dart';
import 'package:manzana_verde/widgets/item_pedido.dart';
import 'package:manzana_verde/widgets/menu.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class MisPedidos extends StatefulWidget {
  // MisPedidos({Key? key}) : super(key: key);

  @override
  _MisPedidosState createState() => _MisPedidosState();
}

class _MisPedidosState extends State<MisPedidos> {
  DatePickerController _controller = DatePickerController();
  final pedidosBloc = new PedidosBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 15.0, right: 15.0),
              child: Column(
                children: [
                  SizedBox(height: 15),
                  // HEADER
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/profile.jpeg',
                        height: 40,
                      ),
                      Text(
                        'Mis pedidos',
                        style: GoogleFonts.openSans(
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                                color: ManzanaStyles.fourthColor)),
                      ),
                      // TODO: HACER FUNCIONALIDADES DE NIVEL Y BOTON DE AUTO
                      SvgPicture.asset('assets/level.svg'),
                      SvgPicture.asset('assets/auto.svg'),
                      SvgPicture.asset('assets/icons/dinner.svg'),
                    ],
                  ),
                  SizedBox(height: 20),
                  // LINEA DE CALORIAS
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('0Kcal'), Text('22000Kcal')],
                  ),
                  SizedBox(height: 10),
                  // BARRA DE PROGRESO DE CALORIAS
                  StreamBuilder(
                    stream: pedidosBloc.caloriasCalculo,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      print(snapshot.data);
                      return LinearPercentIndicator(
                        width: MediaQuery.of(context).size.width * 0.90,
                        lineHeight: 6.0,
                        percent: 0.1,
                        backgroundColor: ManzanaStyles.secondaryColor,
                        progressColor: ManzanaStyles.thirdColor,
                      );
                    },
                  ),
                  SizedBox(height: 10),
                  // TODO: Funcionalidad de filtro según fecha
                  DatePicker(
                    DateTime.now(),
                    daysCount: 5,
                    width: 60,
                    height: 80,
                    locale: 'es',
                    controller: _controller,
                    initialSelectedDate: DateTime.now(),
                    selectionColor: ManzanaStyles.thirdColor,
                    selectedTextColor: ManzanaStyles.fourthColor,
                    deactivatedColor: ManzanaStyles.fourthColor,
                    onDateChange: (date) {},
                  ),
                  Divider(
                    color: ManzanaStyles.fourthColor,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 70,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/maletin.svg'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Entregar en:',
                              style: GoogleFonts.openSans(
                                  textStyle: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: ManzanaStyles.secondaryColor)),
                            ),
                            Text('Av Mariscal Ramón Castilla 1155',
                                style: GoogleFonts.openSans(
                                    textStyle: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600,
                                        color: ManzanaStyles.fourthColor)))
                          ],
                        ),
                        Icon(Icons.arrow_right_outlined)
                      ],
                    ),
                  ),
                  Divider(
                    color: ManzanaStyles.fourthColor,
                  ),
                  SizedBox(height: 10),
                  StreamBuilder(
                    stream: pedidosBloc.getCarta,
                    builder: (_, AsyncSnapshot snapshot) {
                      final pedidos = snapshot.data ?? [];
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: pedidos.length,
                        itemBuilder: (BuildContext context, i) {
                          return ItemPedido(pedido: pedidos[i]);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Menu(index: 1));
  }
}
