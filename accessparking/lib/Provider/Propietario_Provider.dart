import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Models/Propietario.dart';

class PropietarioProvider {
  final String _endpoint = "https://dbpark-767b1-default-rtdb.firebaseio.com";

  Future<bool> crearpropietario(Propietario registerData) async {
    try {
      String? apto = registerData.apto;
      String? id = registerData.id;
      String? name = registerData.name;
      String? torre =
          registerData.torre; // Así es como obtenemos el valor seleccionado

      final Propietario propietario = Propietario(
        apto: apto,
        id: id,
        name: name,
        torre: torre,
        idconjunto: "", // Puedes llenar este campo si lo necesitas
      );

      final url = '$_endpoint/parking/propietario/idpropietario.json';
      final resp = await http.post(
        Uri.parse(url),
        body: propietarioToJson(propietario),
      );

      if (resp.statusCode == 200) {
        final decodeData = jsonDecode(resp.body);
        print(decodeData);
        return true;
      } else {
        throw Exception("Ocurrió algo ${resp.statusCode}");
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<List<Propietario>> getPropietario() async {
    try {
      final url = '$_endpoint/parking/propietario/idpropietario.json';
      final resp = await http.get(Uri.parse(url));

      if (resp.statusCode == 200) {
        final jsonData = jsonDecode(resp.body);

        if (jsonData != null && jsonData is Map<String, dynamic>) {
          List<Propietario> propietarios = [];

          jsonData.forEach((key, propietarioJson) {
            if (propietarioJson is Map<String, dynamic>) {
              final propietario = Propietario.fromJson(propietarioJson);
              propietario.id = key;
              propietarios.add(propietario);
            }
          });

          return propietarios;
        } else {
          print("La respuesta de la API no es un Map válido.");
          return []; // Devolver una lista vacía en caso de error
        }
      } else {
        throw Exception("Ocurrió algo ${resp.statusCode}");
      }
    } catch (e) {
      print("Error al obtener propietarios: $e");
      return []; // Devolver una lista vacía en caso de error
    }
  }

  Future<bool> updatepropietario(Propietario user) async {
    try {
      final url =
          '$_endpoint/parking/propietario/idpropietario/${user.id}.json';
      final resp = await http.post(
        Uri.parse(url),
        body: propietarioToJson(user),
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

  Future<int> borrarPropietario(String nombre) async {
    try {
      final url = '$_endpoint/parking/propietario/idpropietario.json';
      final resp = await http.get(Uri.parse(url));

      if (resp.statusCode == 200) {
        String body = utf8.decode(resp.bodyBytes);
        final jsonData = jsonDecode(body);

        if (jsonData != null && jsonData is Map<String, dynamic>) {
          for (final key in jsonData.keys) {
            final propietarioData = jsonData[key];

            if (propietarioData['name'] == nombre) {
              final urlBorrar =
                  '$_endpoint/parking/propietario/idpropietario/$key.json';
              final respBorrar = await http.delete(Uri.parse(urlBorrar));

              if (respBorrar.statusCode == 200) {
                return 1; // Propietario eliminado con éxito.
              } else {
                throw Exception(
                    "Ocurrió algo al intentar eliminar al propietario: ${respBorrar.statusCode}");
              }
            }
          }

          return 0; // No se encontró al propietario.
        } else {
          throw Exception("La respuesta de la API no es un Map válido.");
        }
      } else {
        throw Exception(
            "Ocurrió algo al intentar obtener propietarios: ${resp.statusCode}");
      }
    } catch (e) {
      print("Error al intentar borrar propietario por nombre: $e");
      return 0;
    }
  }
}
