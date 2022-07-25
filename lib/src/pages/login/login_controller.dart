import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/models/response_api.dart';
import 'package:flutter_ventas/src/providers/users_provider.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void goToRegisterPage() {
    Get.toNamed('/register');
  }

  void login() async{
    String email_Usu = emailController.text.trim();
    String pass_Usu = passwordController.text.trim();

    print('Email ${email_Usu}');
    print('Password ${pass_Usu}');

    if(isValidForm(email_Usu, pass_Usu)){

      ResponseApi responseApi = await usersProvider.login(email_Usu, pass_Usu);
      if(responseApi.exito == 1){
        GetStorage().write('user', responseApi.data); //DATOS DEL USUARIO EN SESION
        goToHomePage();
        Get.snackbar('Login Exitoso', responseApi.mensaje ?? '');
      }else{
        Get.snackbar('Login Fallido', responseApi.mensaje ?? '');
      }
    }
  }

  void goToHomePage(){
    Get.offNamedUntil('/home', (route) => false);
  }

  bool isValidForm(String email_Usu, String pass_Usu){
    
    if(!GetUtils.isEmail(email_Usu)){
      Get.snackbar('Formularo no válido', 'El email no es válido');
      return false;
    }
    
    if(email_Usu.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el email');
      return false;
    }
    if(pass_Usu.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar una contraseña');
      return false;
    }

    return true;
  }
}