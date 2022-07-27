import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/producto.dart';

class ClientOrdersCreateController extends GetxController{


  List<Producto> selectedProducts = <Producto>[].obs;
  var total = 0.0.obs;

  ClientOrdersCreateController(){
    if(GetStorage().read('shopping_bag') != null){

      if(GetStorage().read('shopping_bag') is List<Producto>){
        var result = GetStorage().read('shopping_bag');
        selectedProducts.clear() ;
        selectedProducts.addAll(result);
      }else{
        //Productos Almacenados en Sesión
        var result = Producto.fromJsonList(GetStorage().read('shopping_bag'));
        selectedProducts.clear() ;
        selectedProducts.addAll(result);
      }
      getTotal();
    }
  }

  void getTotal(){
    total.value = 0.0;
    selectedProducts.forEach((producto) {
      total.value = total.value + (producto.quantity ?? 0  * producto.preUniPro!);
    });
  }

  void deleteItem(Producto producto){
    selectedProducts.remove(producto);
    GetStorage().write('shopping_bag', selectedProducts);
    getTotal();
  }

  void addItme(Producto producto){
    int index= selectedProducts.indexWhere((p) => p.idPro == producto?.idPro);
    selectedProducts.remove(producto);
    producto.quantity = producto.quantity! + 1;
    selectedProducts.insert(index, producto);
    GetStorage().write('shopping_bag', selectedProducts);
    getTotal();
  }

  void removeItme(Producto producto){
    if(producto.quantity! > 1) {
      int index= selectedProducts.indexWhere((p) => p.idPro == producto?.idPro);
      selectedProducts.remove(producto);
      producto.quantity = producto.quantity! - 1;
      selectedProducts.insert(index, producto);
      GetStorage().write('shopping_bag', selectedProducts);
      getTotal();
    }
  }
}