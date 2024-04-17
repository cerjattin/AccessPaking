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
  String? date_begin;
  String? date_end;
  String? placut;
  String? placpr;
  AutopModel? placaAutor;

  PlacasModel({
    this.saldo,
    this.estado,
    this.id,
    this.date_begin,
    this.date_end,
    this.placut,
    this.placpr,
    this.placaAutor,
  });

  factory PlacasModel.fromJson(Map<String, dynamic> json) => PlacasModel(
        saldo: json["Saldo"],
        estado: json["estado"],
        id: json["id"],
        date_begin: json["date_begin"],
        date_end: json["date_end"],
        placut: json["Placaaut"],
        placpr: json["Placapr"],
        placaAutor: AutopModel.fromJson(json["placa_autor"]),
      );

  Map<String, dynamic> toJson() => {
        "Saldo": saldo,
        "estado": estado,
        "id": id,
        "date_begin": date_begin,
        "date_end": date_end,
        "Placaut": placut,
        "Placapr": placpr,
        "placa_autor": placaAutor?.toJson(),
      };
}
