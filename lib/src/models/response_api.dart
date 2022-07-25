import 'dart:convert';

ResponseApi responseApiFromJson(String str) => ResponseApi.fromJson(json.decode(str));

String responseApiToJson(ResponseApi data) => json.encode(data.toJson());

class ResponseApi {

  int? exito;
  String? mensaje;
  Object? data;

  ResponseApi({
    this.exito,
    this.mensaje,
    this.data
  });



  factory ResponseApi.fromJson(Map<String, dynamic> json) => ResponseApi(
    exito: json["exito"],
    mensaje: json["message"],
    data: json["data"]
  );

  Map<String, dynamic> toJson() => {
    "exito": exito,
    "message": mensaje,
    "data": data
  };
}