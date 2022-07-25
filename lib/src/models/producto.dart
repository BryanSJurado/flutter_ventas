import 'dart:convert';

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));

String productoToJson(Producto data) => json.encode(data.toJson());

class Producto {

  String? idPro;
  String? nomPro;
  String? preUniPro;
  String? imgPro;
  String? marPro;
  String? stockPro;

  Producto({
    this.idPro,
    this.nomPro,
    this.preUniPro,
    this.imgPro,
    this.marPro,
    this.stockPro,
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
    idPro: json["idPro"],
    nomPro: json["nomPro"],
    preUniPro: json["preUniPro"],
    imgPro: json["imgPro"],
    marPro: json["marPro"],
    stockPro: json["stockPro"],
  );

  static List<Producto> fromJsonList(List<dynamic> jsonList){
    List<Producto> toList = [];

    jsonList.forEach((item) {
      Producto producto = Producto.fromJson(item);
      toList.add(producto);
    });
    return toList;
  }

  Map<String, dynamic> toJson() => {
    "idPro": idPro,
    "nomPro": nomPro,
    "preUniPro": preUniPro,
    "imgPro": imgPro,
    "marPro": marPro,
    "stockPro": stockPro,
  };
}
