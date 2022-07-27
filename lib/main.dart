import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/client/home/client_home_page.dart';
import 'package:flutter_ventas/src/client/profile/info/client_profile_info_page.dart';
import 'package:flutter_ventas/src/models/user.dart';
import 'package:flutter_ventas/src/pages/home/home_page.dart';
import 'package:flutter_ventas/src/pages/list/client_products_list_page.dart';
import 'package:flutter_ventas/src/pages/login/login_page.dart';
import 'package:flutter_ventas/src/pages/register/register_page.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

User user = User.fromJson(GetStorage().read('user') ?? {});

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Ventas',
      debugShowCheckedModeBanner: false,
      initialRoute: user.emailUsu != null ? '/home' : '/',
      getPages: [
        GetPage(name: '/', page: () => LoginPage()),
        GetPage(name: '/register', page: () => RegisterPage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/pages/list/', page: () => ClientProductsListPage()),
        GetPage(name: '/client/profile/info', page: () => ClientProfileInfoPage()),
        GetPage(name: '/client/home', page: () => ClientHomePage())
      ],
      theme: ThemeData(
        primaryColor: Colors.amber,
        colorScheme: ColorScheme(
          primary: Colors.amber,
          secondary: Colors.amberAccent,
          brightness: Brightness.light,
          onBackground: Colors.grey,
          onPrimary: Colors.grey,
          surface: Colors.grey,
          onSurface: Colors.grey,
          error: Colors.grey,
          onError: Colors.grey,
          onSecondary: Colors.grey,
          background: Colors.grey
        )
      ),
      navigatorKey: Get.key,
    );
  }
}

