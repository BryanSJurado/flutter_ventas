import 'package:flutter_ventas/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:path/path.dart';

import '../Enviroment/environment.dart';
import '../models/producto.dart';

class ProductsProvider extends GetConnect{
  String url = Environment.API_URL + 'api/Producto';
  User userSession = User.fromJson(GetStorage().read('user') ?? {});

  Future <List<Producto>> findProductos(String idCategory) async {
    Response response = await get(
      '$url/ ',
      headers: {
        'Content-Type': 'application/json',
        'Authorization': userSession.token ?? ''
      }
    ); //Espera hasta que el servidor retorne la respuesta

    if(response.statusCode == 401){
      Get.snackbar('Petición Denegada', 'El usuario no tiene autorización');
      return [];
    }

    List<Producto> productos = Producto.fromJsonList(response.body);
    return productos;
  }

}