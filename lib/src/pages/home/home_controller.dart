import 'package:flutter_ventas/src/models/user.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeControlller extends GetxController{
  User user = User.fromJson(GetStorage().read('user') ?? {});

  var indexTab = 0.obs;

  void changeTab(int index) {
    indexTab.value = index;
  }

  HomeControlller(){
    print('Usuario: ${user.toJson()}');
  }

  void signOut(){
    GetStorage().remove('user');
    Get.offNamedUntil('/', (route) => false);
  }

  void goToProductos(){
    //Get.offNamedUntil('/productos', (route) => false);
    Get.toNamed('/productos');
  }
}
