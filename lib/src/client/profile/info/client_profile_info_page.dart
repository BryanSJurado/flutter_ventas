import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/client/profile/info/client_profile_info_controller.dart';
import 'package:get/get.dart';



class ClientProfileInfoPage extends StatelessWidget {

  ClientProfileInfoController con = Get.put(ClientProfileInfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack( //Posicionar elementos uno encuma del otro
        children: [
          _backgroundCover(context),
          _boxForm(context),
          _imageUser(context),
          _buttonSignOut()
        ],
      ),
    );
  }


  Widget _backgroundCover(BuildContext context){
    return Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height * 0.35,
        color: Colors.amber
    );
  }

  Widget _boxForm(BuildContext context){
    return Container(
      height: MediaQuery.of(context).size.height * 0.60,
      margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.3, left: 50, right: 50 ),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 15,
                offset: Offset(0, 0.75)
            )
          ]
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            _textYourInfo(),
            _textName(),
            _textCedula(),
            _textEmail(),
            _textPhone(),
            _textDir()



            //_buttonUpdate()
          ],
        ),
      ),
    );
  }

  Widget _imageUser(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.only(top: 25),
        alignment: Alignment.topCenter,
        child:  CircleAvatar(
          backgroundImage:  con.user.image != null
              ? NetworkImage(con.user.image!)
              : AssetImage('assets/img/user_profile.png') as ImageProvider,
          radius: 60,
          backgroundColor: Colors.white,
        ),
      ),
    );
  }

  Widget _buttonUpdate(){
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(vertical: 15)
          ),
          child: Text(
            'ACTUALIZAR DATOS',
            style: TextStyle(
                color: Colors.black
            ),
          )
      ),
    );
  }

  Widget _textYourInfo(){
    return Container(
      margin: EdgeInsets.only(top: 40, bottom: 30),
      child: Text(
        'INFORMACIÓN DEL USUARIO',
        style: TextStyle(
            color: Colors.black
        ),
      ),
    );
  }

  Widget _textName() {
    return ListTile(
      leading: Icon(Icons.person),
      title: Text('${con.user.nomUsu ?? ''}'),
      subtitle: Text('Nombre del usuario'),
    );
  }

  Widget _textCedula() {
    return ListTile(
      leading: Icon(Icons.info_outline),
      title: Text('${con.user.cedUsu ?? ''}'),
      subtitle: Text('Cédula del Usuario'),
    );
  }

  Widget _textDir() {
    return ListTile(
      leading: Icon(Icons.home),
      title: Text('${con.user.dirUsu ?? ''}'),
      subtitle: Text('Direccion del usuario'),
    );
  }

  Widget _textEmail() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: ListTile(
        leading: Icon(Icons.mail),
        title: Text(con.user.emailUsu ?? ''),
        subtitle: Text('Correo'),
      ),
    );
  }

  Widget _textPhone() {
    return ListTile(
      leading: Icon(Icons.phone),
      title: Text(con.user.telUsu ?? ''),
      subtitle: Text('Telefono'),
    );
  }

  Widget _buttonSignOut(){
    return SafeArea(
        child: Container(
          margin:  EdgeInsets.only(right: 20),
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => con.signOut(),
            icon: Icon(
              Icons.power_settings_new,
              color: Colors.white,
              size: 30,
            ),
          ),
        )
    );
  }


}


