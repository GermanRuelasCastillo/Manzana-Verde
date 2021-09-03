import 'dart:convert';
import 'package:http/http.dart' as http;

class CrudApi {
  final String _url = 'https://6130edba8066ca0017fdab4a.mockapi.io/api/v1/';

  listado(url) async {
    return await http.get(Uri.parse(_url + url), headers: _setHeaders());
  }

  guardar(data, url) async {
    return await http.post(Uri.parse(_url + url),
        headers: _setHeaders(), body: json.encode(data));
  }

  actualizar(url) async {
    return await http.patch(Uri.parse(_url + url), headers: _setHeaders());
  }

  mostrar(url) async {
    return await http.read(Uri.parse(_url + url), headers: _setHeaders());
  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
      };
}
