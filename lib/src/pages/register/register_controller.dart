import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/providers/users_provider.dart';
import 'package:flutter_ventas/src/models/user.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async{
    String email_Usu = emailController.text.trim();
    //String name = nameController.text.trim();
    //String lastname = lastnameController.text.trim();
    //String phone = phoneController.text.trim();
    String pass_Usu0 = passwordController.text.trim();
    String pass_Usu = confirmpasswordController.text.trim();

    print('Email ${email_Usu}');
    print('Password ${pass_Usu}');

    if(isValidForm(email_Usu, email_Usu, pass_Usu)){

      User user = User(
        email_Usu: email_Usu,
        //name: name,
        //lastname: lastname,
        //phone: phone,

      );

      Response response = await usersProvider.create(user);

      print(response.body);

      Get.snackbar('Formulario Válido', 'Está listo para enciar la petición HTTP');
    }
  }

  bool isValidForm(
      String correo,
      //String name,
      //String lastname,
      // phone,
      String pass_usu0,
      String pass_usu){

    if(!GetUtils.isEmail(correo)){
      Get.snackbar('Formulario no válido', 'El email no es válido');
      return false;
    }

    if(correo.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el email');
      return false;
    }
/*
    if(name.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el nombre');
      return false;
    }

    if(lastname.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el apellido');
      return false;
    }

    if(phone.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el teléfono');
      return false;
    }
*/
    if(pass_usu.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar una contraseña');
      return false;
    }

    if(pass_usu.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes confirmar la contraseña');
      return false;
    }

    if(pass_usu0 != pass_usu){
      Get.snackbar('Formulario no válido', 'Las contraseñas no coinciden');
      return false;
    }

    return true;
  }

}