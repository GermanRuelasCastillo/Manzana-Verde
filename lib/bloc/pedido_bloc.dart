import 'dart:async';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

var CARTAS = [
  {
    "titulo": 'Media mañana',
    "calorias": '200Kcal',
    "icon": 'manzana',
    "creditos": false,
    "pedido": ""
  },
  {
    "titulo": 'Almuerzo',
    "calorias": '800Kcal',
    "icon": 'almuerzo',
    "creditos": true,
    "pedido": ""
  },
  {
    "titulo": 'Media tarde',
    "calorias": '200Kcal',
    "icon": 'mid_manzana',
    "creditos": false,
    "pedido": ""
  },
  {
    "titulo": 'Cena',
    "calorias": '800Kcal',
    "icon": 'dinner_1',
    "creditos": false,
    "pedido": ""
  }
];

class PedidosBloc {
  Stream<List<Object>> get getCarta async* {
    final List<Object> pedidos = [];
    SharedPreferences storage = await SharedPreferences.getInstance();
    // storage.remove('pedido');
    var pedidoStorage = storage.getString('pedido');
    for (var carta in CARTAS) {
      if (pedidoStorage != null && carta["titulo"] == 'Almuerzo') {
        carta['pedido'] = pedidoStorage.toString();
      }
      pedidos.add(carta);
    }
    yield pedidos;
  }

  StreamController<int> _caloriasCalculo = new StreamController<int>();
  Stream<int> get caloriasCalculo => _caloriasCalculo.stream;

  PedidosBloc() {
    this.getCarta.listen((pedido) {
      this._caloriasCalculo.add(6);
    });
  }
  dispose() {
    _caloriasCalculo.close();
  }
}
