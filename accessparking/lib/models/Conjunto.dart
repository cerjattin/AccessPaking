// ignore: file_names
import 'dart:convert';

Conjunto conjuntoFromJson(String str) => Conjunto.fromJson(json.decode(str));

String conjuntoToJson(Conjunto data) => json.encode(data.toJson());

class Residential {
  List<Conjunto> items = [];

  Residential();

  Residential.fromJsonList(jsonList) {
    if (jsonList == null) {
      return;
    } else {
      jsonList.forEach((id, prod) {
        final residential = Conjunto.fromJson(prod);
        residential.id = id;

        items.add(residential);
      });
    }
  }
}

class Conjunto {
  int? cantpark;
  String? dir;
  String? id;
  String? name;
  String? nameAdmin;

  Conjunto({
    required this.cantpark,
    required this.dir,
    required this.id,
    required this.name,
    required this.nameAdmin,
  });

  factory Conjunto.fromJson(Map<String, dynamic> json) => Conjunto(
        cantpark: json["cantpark"],
        dir: json["dir"],
        id: json["id"],
        name: json["name"],
        nameAdmin: json["name_admin"],
      );

  Map<String, dynamic> toJson() => {
        "cantpark": cantpark,
        "dir": dir,
        "id": id,
        "name": name,
        "name_admin": nameAdmin,
      };
}
