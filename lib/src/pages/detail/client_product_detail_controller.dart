import 'package:flutter_ventas/src/models/producto.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ClientProductDetailController extends GetxController{

  List<Producto> selectedProducts =[];

  ClientProductDetailController(){

  }

  void checkIfProductsWasAdded(Producto producto, var price, var counter){
    price.value = producto.preUniPro ?? 0.0;
    if(GetStorage().read('shopping_bag') != null){

      if(GetStorage().read('shopping_bag') is List<Producto>){
        selectedProducts = GetStorage().read('shopping_bag');
      }else{
        //Productos Almacenados en Sesión
        selectedProducts = Producto.fromJsonList(GetStorage().read('shopping_bag'));
      }

      int index= selectedProducts.indexWhere((p) => p.idPro == producto?.idPro);

      if(index != -1){ //el producto ya fue agregado
        counter.value = selectedProducts[index].quantity ?? 0;
        price.value = producto.preUniPro! * counter.value;
        selectedProducts.forEach((p) {
          print('Producto: ${p.toJson()}');
        });
      }
    }
  }

  void addToBag(Producto producto, var price, var counter){
    if(counter.value > 0){
      //Validar si el producto ya fue agregado a la lista
      int index= selectedProducts.indexWhere((p) => p.idPro == producto?.idPro);

      if(index == -1){//No ha sido agregado
        if(producto?.quantity == null){
          if(counter.value > 0){
            producto.quantity = counter.value;
          }else{
            producto?.quantity = 1;
          }
        }
        selectedProducts.add(producto!);
      }else{ //Ya ha sido Agregado
        selectedProducts[index].quantity = counter.value;
      }

      GetStorage().write('shopping_bag', selectedProducts);
      Fluttertoast.showToast(msg: 'Producto Agregado');
    }else{
      Fluttertoast.showToast(msg: 'Debe seleccionar al menos un item');
    }

  }

  void addItem(Producto producto, var price, var counter){
    counter.value = counter.value + 1;
    price.value = producto!.preUniPro! * counter.value;
  }

  void removeItem(Producto producto, var price, var counter){
    if(counter > 0){
      counter.value = counter.value - 1;
      price.value = producto!.preUniPro! * counter.value;
    }
  }

}