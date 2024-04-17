import 'dart:convert';

PropModel propModelFromJson(String str) => PropModel.fromJson(json.decode(str));

String propModelToJson(PropModel data) => json.encode(data.toJson());

class Propi {
  List<PropModel> items = [];

  Propi();

  Propi.fromJsonList(jsonList) {
    if (jsonList == null) {
      return;
    } else {
      jsonList.forEach((id, prod) {
        final prop = PropModel.fromJson(prod);
        prop.id = id;

        items.add(prop);
      });
    }
  }
}

class PropModel {
  String placa;
  String apto;
  String id;
  String mail;
  String name;
  String telefono;
  String torre;

  PropModel({
    required this.placa,
    required this.apto,
    required this.id,
    required this.mail,
    required this.name,
    required this.telefono,
    required this.torre,
  });

  factory PropModel.fromJson(Map<String, dynamic> json) => PropModel(
        placa: json["Placa"],
        apto: json["apto"],
        id: json["id"],
        mail: json["mail"],
        name: json["name"],
        telefono: json["telefono"],
        torre: json["torre"],
      );

  Map<String, dynamic> toJson() => {
        "Placa": placa,
        "apto": apto,
        "id": id,
        "mail": mail,
        "name": name,
        "telefono": telefono,
        "torre": torre,
      };
}
