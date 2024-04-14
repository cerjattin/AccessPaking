import 'dart:convert';

Cuota cuotaFromJson(String str) => Cuota.fromJson(json.decode(str));

String cuotaToJson(Cuota data) => json.encode(data.toJson());

class Fee {
  List<Cuota> items = [];

  Fee();

  Fee.fromJsonList(jsonList) {
    if (jsonList == null) {
      return;
    } else {
      jsonList.forEach((id, prod) {
        final fee = Cuota.fromJson(prod);
        fee.id = id;

        items.add(fee);
      });
    }
  }
}

class Cuota {
  String? ao;
  String? fechapago;
  String? id;
  String? idpropietario;
  String? periodo;
  String? saldo;
  String? valor;
  String? vrpago;

  Cuota({
    required this.ao,
    required this.fechapago,
    required this.id,
    required this.idpropietario,
    required this.periodo,
    required this.saldo,
    required this.valor,
    required this.vrpago,
  });

  factory Cuota.fromJson(Map<String, dynamic> json) => Cuota(
        ao: json["año"],
        fechapago: json["fechapago"],
        id: json["id"],
        idpropietario: json["idpropietario"],
        periodo: json["periodo"],
        saldo: json["saldo"],
        valor: json["valor"],
        vrpago: json["vrpago"],
      );

  Map<String, dynamic> toJson() => {
        "año": ao,
        "fechapago": fechapago,
        "id": id,
        "idpropietario": idpropietario,
        "periodo": periodo,
        "saldo": saldo,
        "valor": valor,
        "vrpago": vrpago,
      };
}
