import 'dart:convert';

Producto productoFromJson(String str) => Producto.fromJson(json.decode(str));

String productoToJson(Producto data) => json.encode(data.toJson());

class Producto {

  int? idPro;
  String? nomPro;
  double? preUniPro;
  String? imgPro;
  String? marPro;
  int? stockPro;
  int? quantity;

  Producto({
    this.idPro,
    this.nomPro,
    this.preUniPro,
    this.imgPro,
    this.marPro,
    this.stockPro,
    this.quantity
  });

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
    idPro: json["idPro"],
    nomPro: json["nomPro"],
    preUniPro: json["preUniPro"],
    imgPro: json["imgPro"],
    marPro: json["marPro"],
    stockPro: json["stockPro"],
    quantity: json["quantity"]
  );

  static List<Producto> fromJsonList(List<dynamic> jsonList){
    List<Producto> toList = [];
    Producto producto = new Producto();
    for(int i = 0; i <= jsonList.length-1; i++){
      producto = Producto.fromJson(jsonList[i]);
      toList.add(producto);
    }
    /*
    jsonList.forEach((item) {
      Producto producto = Producto.fromJson(item);
      toList.add(producto);
      print(toList);
    });
     */
    return toList;
  }

  Map<String, dynamic> toJson() => {
    "idPro": idPro,
    "nomPro": nomPro,
    "preUniPro": preUniPro,
    "imgPro": imgPro,
    "marPro": marPro,
    "stockPro": stockPro,
    "quantity": quantity
  };
}
