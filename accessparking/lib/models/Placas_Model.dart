import 'dart:convert';

import 'package:accessparking/models/AutoP_Model.dart';

PlacasModel placasModelFromJson(String str) =>
    PlacasModel.fromJson(json.decode(str));

String placasModelToJson(PlacasModel data) => json.encode(data.toJson());

class Placa {
  List<PlacasModel> items = [];

  Placa();

  Placa.fromJsonList(jsonList) {
    if (jsonList == null) {
      return;
    } else {
      jsonList.forEach((id, prod) {
        final placa = PlacasModel.fromJson(prod);
        placa.id = id;

        items.add(placa);
      });
    }
  }
}

class PlacasModel {
  String? saldo;
  String? estado;
  String? id;
  String? idpropietario;
  String? namePropietario;
  AutopModel? placaAutor;

  PlacasModel({
    this.saldo,
    this.estado,
    this.id,
    this.idpropietario,
    this.namePropietario,
    this.placaAutor,
  });

  factory PlacasModel.fromJson(Map<String, dynamic> json) => PlacasModel(
        saldo: json["Saldo"],
        estado: json["estado"],
        id: json["id"],
        idpropietario: json["idpropietario"],
        namePropietario: json["name_propietario"],
        placaAutor: AutopModel.fromJson(json["placa_autor"]),
      );

  Map<String, dynamic> toJson() => {
        "Saldo": saldo,
        "estado": estado,
        "id": id,
        "idpropietario": idpropietario,
        "name_propietario": namePropietario,
        "placa_autor": placaAutor?.toJson(),
      };
}
