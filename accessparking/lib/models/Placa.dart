import 'dart:convert';

Placa placaFromJson(String str) => Placa.fromJson(json.decode(str));

String placaToJson(Placa data) => json.encode(data.toJson());

class Plate {
  List<Placa> items = [];

  Plate();

  Plate.fromJsonList(jsonList) {
    if (jsonList == null) {
      return;
    } else {
      jsonList.forEach((placa, prod) {
        final plate = Placa.fromJson(prod);
        plate.placa = placa;

        items.add(plate);
      });
    }
  }
}

class Placa {
  String? placa;
  String? estado;
  String? idautorizado;
  String? idpropietario;
  String? nameAutorizado;

  Placa({
    required this.placa,
    required this.estado,
    required this.idautorizado,
    required this.idpropietario,
    required this.nameAutorizado,
  });

  factory Placa.fromJson(Map<String, dynamic> json) => Placa(
        placa: json["Placa"],
        estado: json["estado"],
        idautorizado: json["idautorizado"],
        idpropietario: json["idpropietario"],
        nameAutorizado: json["name_autorizado"],
      );

  Map<String, dynamic> toJson() => {
        "Placa": placa,
        "estado": estado,
        "idautorizado": idautorizado,
        "idpropietario": idpropietario,
        "name_autorizado": nameAutorizado,
      };
}
