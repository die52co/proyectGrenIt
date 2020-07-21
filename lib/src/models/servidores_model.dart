import 'dart:convert';

ServidoresModel servidoresModelFromJson(String str) => ServidoresModel.fromJson(json.decode(str));

String servidoresModelToJson(ServidoresModel data) => json.encode(data.toJson());

class ServidoresModel {
    ServidoresModel({
        this.id,
        this.procesadores = 1.0,
        this.memoriaRam = 1.0,
        this.nroServi = 1.0,
        this.almacenamiento = 500.0,
        this.baseDatos = "",
    });

    String id;
    double procesadores;
    double memoriaRam;
    double nroServi;
    double almacenamiento;
    String baseDatos;

    factory ServidoresModel.fromJson(Map<String, dynamic> json) => ServidoresModel(
        id            : json["id"],
        procesadores  : json["procesadores"],
        memoriaRam    : json["memoriaRam"],
        nroServi      : json["nroServi"],
        almacenamiento: json["almacenamiento"],
        baseDatos     : json["baseDatos"],
    );

    Map<String, dynamic> toJson() => {
        "id"            : id,
        "procesadores"  : procesadores,
        "memoriaRam"    : memoriaRam,
        "nroServi"      : nroServi,
        "almacenamiento": almacenamiento,
        "baseDatos"     : baseDatos,
    };
}
