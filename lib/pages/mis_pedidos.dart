import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:manzana_verde/ManzanaIcons.dart';
import 'package:manzana_verde/custom/manzana_styles.dart';
import 'package:manzana_verde/widgets/item_pedido.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';

class MisPedidos extends StatefulWidget {
  // MisPedidos({Key? key}) : super(key: key);

  @override
  _MisPedidosState createState() => _MisPedidosState();
}

class _MisPedidosState extends State<MisPedidos> {
  DatePickerController _controller = DatePickerController();
  DateTime _selectedValue = DateTime.now();
  var horarios = [
    {
      "titulo": 'Media mañana',
      "calorias": '200Kcal',
      "icon": ManzanaIcons.manzana,
      "creditos": false
    },
    {
      "titulo": 'Almuerzo',
      "calorias": '800Kcal',
      "icon": ManzanaIcons.almuerzo,
      "creditos": true
    },
    {
      "titulo": 'Media tarde',
      "calorias": '200Kcal',
      "icon": ManzanaIcons.mid_manzana,
      "creditos": false
    },
    {
      "titulo": 'Cena',
      "calorias": '800Kcal',
      "icon": ManzanaIcons.dinner_1,
      "creditos": false
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0),
          child: Column(
            children: [
              SizedBox(height: 15),
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
                  Icon(ManzanaIcons.dinner)
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [Text('0Kcal'), Text('22000Kcal')],
              ),
              SizedBox(height: 10),
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width * 0.90,
                lineHeight: 6.0,
                percent: 0.3,
                backgroundColor: ManzanaStyles.secondaryColor,
                progressColor: ManzanaStyles.thirdColor,
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
                onDateChange: (date) {
                  // New date selected
                  setState(() {
                    _selectedValue = date;
                  });
                },
              ),
              SizedBox(height: 10),
              for (var item in horarios) ItemPedido(pedido: item)
            ],
          ),
        ),
      ),
      // bottomNavigationBar: Menu(index: 1)
    );
  }
}
