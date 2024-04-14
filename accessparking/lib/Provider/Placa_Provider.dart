import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Placa.dart';

class PlacarProvider {
  final String _endpoint = "https://dbpark-767b1-default-rtdb.firebaseio.com";

  Future<bool> crearplaca(Placa user) async {
    try {
      final url = '$_endpoint/parking/placas_reg/idautorizacion/idautori.json';
      final resp = await http.post(
        Uri.parse(url),
        body: placaToJson(user),
      );

      if (resp.statusCode == 200) {
        final decodeData = jsonDecode(resp.body);
        print(decodeData);
        return true;
      } else {
        throw Exception("Ocurrio Algo ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
      return false;
      //throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }

  Future<List<Placa>> getPropiertaio() async {
    final url = '$_endpoint/parking/placas_reg/idautorizacion/idautori.json';
    final resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);
      final user = Plate.fromJsonList(jsonData);
      return user.items;
    } else {
      throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }

  Future<bool> updatepropietario(Placa user) async {
    try {
      final url =
          '$_endpoint/parking/placas_reg/idautorizacion/idautori/${user.placa}.json';
      final resp = await http.post(
        Uri.parse(url),
        body: placaToJson(user),
      );

      if (resp.statusCode == 200) {
        final decodeData = jsonDecode(resp.body);
        print(decodeData);
        return true;
      } else {
        throw Exception("Ocurrio Algo ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
      return false;
      //throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }

  Future<int> borrarUser(String placa) async {
    try {
      final url =
          '$_endpoint/parking/placas_reg/idautorizacion/idautori$placa.json';
      final resp = await http.delete(Uri.parse(url));

      if (resp.statusCode == 200) {
        final decodeData = jsonDecode(resp.body);
        print(decodeData);
        return 1;
      } else {
        throw Exception("Ocurrio Algo ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
      return 0;
      //throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }
}
