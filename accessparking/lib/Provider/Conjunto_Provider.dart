import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Conjunto.dart';

class CuotaProvider {
  final String _endpoint = "https://dbpark-767b1-default-rtdb.firebaseio.com";

  Future<bool> crearcontrol(Conjunto user) async {
    try {
      final url = '$_endpoint/parking/conjuntos/idConjunto.json';
      final resp = await http.post(
        Uri.parse(url),
        body: conjuntoToJson(user),
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

  Future<List<Conjunto>> getControl() async {
    final url = '$_endpoint/parking/conjuntos/idConjunto.json';
    final resp = await http.get(Uri.parse(url));

    if (resp.statusCode == 200) {
      String body = utf8.decode(resp.bodyBytes);
      final jsonData = jsonDecode(body);
      final user = Residential.fromJsonList(jsonData);
      return user.items;
    } else {
      throw Exception("Ocurrio Algo ${resp.statusCode}");
    }
  }

  Future<bool> updatecontrol(Conjunto user) async {
    try {
      final url = '$_endpoint/parking/conjuntos/idConjunto${user.id}.json';
      final resp = await http.post(
        Uri.parse(url),
        body: conjuntoToJson(user),
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

  Future<int> borrarControl(String id) async {
    try {
      final url = '$_endpoint/parking/conjuntos/idConjunto/$id.json';
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
