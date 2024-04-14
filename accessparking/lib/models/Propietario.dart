import 'dart:convert';

Propietario propietarioFromJson(String str) =>
    Propietario.fromJson(json.decode(str));

String propietarioToJson(Propietario data) => json.encode(data.toJson());

class Owner {
  List<Propietario> items = [];

  Owner();

  Owner.fromJsonList(jsonList) {
    if (jsonList == null) {
      return;
    } else {
      jsonList.forEach((id, prod) {
        final owner = Propietario.fromJson(prod);
        owner.id = id;

        items.add(owner);
      });
    }
  }
}

class Propietario {
  String? apto;
  String? id;
  String? idconjunto;
  String? name;
  String? torre;

  Propietario({
    required this.apto,
    required this.id,
    required this.idconjunto,
    required this.name,
    required this.torre,
  });

  factory Propietario.fromJson(Map<String, dynamic> json) => Propietario(
        apto: json["apto"],
        id: json["id"],
        idconjunto: json["idconjunto"],
        name: json["name"],
        torre: json["torre"],
      );

  Map<String, dynamic> toJson() => {
        "apto": apto,
        "id": id,
        "idconjunto": idconjunto,
        "name": name,
        "torre": torre,
      };
}
