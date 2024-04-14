import 'dart:convert';

ControlP controlPFromJson(String str) => ControlP.fromJson(json.decode(str));

String controlPToJson(ControlP data) => json.encode(data.toJson());

class Control {
  List<ControlP> items = [];

  Control();

  Control.fromJsonList(jsonList) {
    if (jsonList == null) {
      return;
    } else {
      jsonList.forEach((id, prod) {
        final control = ControlP.fromJson(prod);
        control.idreg = id;

        items.add(control);
      });
    }
  }
}

class ControlP {
  String? fecha;
  String? idautori;
  String? idpropietario;
  String? idreg;
  int? ingreso;
  String? placa;
  int? salida;

  ControlP({
    required this.fecha,
    required this.idautori,
    required this.idpropietario,
    required this.idreg,
    required this.ingreso,
    required this.placa,
    required this.salida,
  });

  factory ControlP.fromJson(Map<String, dynamic> json) => ControlP(
        fecha: json["fecha"],
        idautori: json["idautori"],
        idpropietario: json["idpropietario"],
        idreg: json["idreg"],
        ingreso: json["ingreso"],
        placa: json["placa"],
        salida: json["salida"],
      );

  Map<String, dynamic> toJson() => {
        "fecha": fecha,
        "idautori": idautori,
        "idpropietario": idpropietario,
        "idreg": idreg,
        "ingreso": ingreso,
        "placa": placa,
        "salida": salida,
      };
}
