import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/models/response_api.dart';
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
  TextEditingController direccionController = TextEditingController();
  TextEditingController cedulaController = TextEditingController();

  UsersProvider usersProvider = UsersProvider();

  void register() async{
    String email_Usu = emailController.text.trim();
    String name = nameController.text.trim();
    //String lastname = lastnameController.text.trim();
    String phone = phoneController.text.trim();
    String dirUsu =  direccionController.text.trim();
    String cedula = cedulaController.text.trim();
    String passUsu = passwordController.text.trim();
    String confirmpassUsu = confirmpasswordController.text.trim();

    //print('Email ${email_Usu}');
    //print('Password ${passUsu}');

    if(isValidForm(email_Usu, name, phone, dirUsu, cedula, passUsu, confirmpassUsu)){

      User user = User(
        emailUsu: email_Usu,
        passUsu: passUsu,
        nomUsu: name,
        telUsu: phone,
        dirUsu: dirUsu,
        cedUsu: cedula
      );

      Response response = await usersProvider.create(user);
      ResponseApi responseApi = ResponseApi.fromJson(response.body);
      if(responseApi.exito == 1){
        Get.snackbar('Formulario Válido', 'El usuario ha sido registrado');
        goToLoginPage();
      }else{
        Get.snackbar('Error', responseApi.mensaje ?? '' );
      }


    }
  }

  void goToLoginPage() {
    Get.toNamed('/');
  }

  bool isValidForm(
      String correo,
      String name,
      String phone,
      String direccion,
      String cedula,
      String pass_usu,
      String confirm_pass_usu){

    if(!GetUtils.isEmail(correo)){
      Get.snackbar('Formulario no válido', 'El email no es válido');
      return false;
    }

    if(correo.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el email');
      return false;
    }

    if(name.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el nombre');
      return false;
    }

    if(phone.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar el teléfono');
      return false;
    }

    if(phone.length < 10){
      Get.snackbar('Formulario no válido', 'El teléfono no es válido');
      return false;
    }

    if(phone.length > 10){
      Get.snackbar('Formulario no válido', 'El teléfono no es válido');
      return false;
    }

    if(direccion.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar una dirección');
      return false;
    }

    if(cedula.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar una cédula');
      return false;
    }

    if(cedula.length < 10 ){
      Get.snackbar('Formulario no válido', 'La cédula no es válida');
      return false;
    }

    if(cedula.length > 10 ){
      Get.snackbar('Formulario no válido', 'La cédula no es válida');
      return false;
    }

    if(pass_usu.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes ingresar una contraseña');
      return false;
    }

    if(confirm_pass_usu.isEmpty){
      Get.snackbar('Formulario no válido', 'Debes confirmar la contraseña');
      return false;
    }

    if(confirm_pass_usu != pass_usu){
      Get.snackbar('Formulario no válido', 'Las contraseñas no coinciden');
      return false;
    }

    return true;
  }

}