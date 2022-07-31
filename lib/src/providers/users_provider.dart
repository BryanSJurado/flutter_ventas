import 'package:flutter_ventas/src/Enviroment/environment.dart';
import 'package:get/get.dart';
import 'package:flutter_ventas/src/models/user.dart';
import '../models/response_api.dart';

class UsersProvider extends GetConnect{

  String url = Environment.API_URL + 'api/User';

  Future<Response> create(User user) async {
    Response response = await post(
        '$url/AddUser',
        user.toJson(),
        headers: {
          'Content-Type': 'application/json'
        }
    );
    return response;
  }

  Future<ResponseApi> login(String email_Usu, String pass_Usu) async{
    Response response = await post(
        '$url/login',
        {
          'email_Usu':email_Usu,
          'pass_Usu':pass_Usu
        },
        headers:{
          'Content-Type': 'application/json'
        }
    );
    if(response.body == null){
      Get.snackbar('Error', 'No se pudo ejecutar la petición');
      ResponseApi responseApi =  ResponseApi.fromJson(response.body);
      return responseApi;
    }
    ResponseApi responseApi = ResponseApi.fromJson(response.body);
    return responseApi;
  }
}