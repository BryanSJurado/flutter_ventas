import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/producto.dart';

class ClientOrdersCreateController extends GetxController{


  List<Producto> selectedProducts =[];
  var counter = 0.obs;

  ClientOrdersCreateController(){
    if(GetStorage().read('shopping_bag') != null){

      if(GetStorage().read('shopping_bag') is List<Producto>){
        selectedProducts = GetStorage().read('shopping_bag');
      }else{
        //Productos Almacenados en Sesión
        selectedProducts = Producto.fromJsonList(GetStorage().read('shopping_bag'));
      }
    }
  }
}