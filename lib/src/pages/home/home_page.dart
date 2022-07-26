import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_ventas/src/client/profile/info/client_profile_info_page.dart';
import 'package:flutter_ventas/src/pages/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:flutter_ventas/src/pages/home/home_controller.dart';
import 'package:flutter_ventas/src/pages/list/client_products_list_page.dart';
import 'package:flutter_ventas/src/pages/register/register_page.dart';
import 'package:flutter_ventas/src/utils/custom_animated_bottom_bar.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {

  HomeControlller con = Get.put(HomeControlller());



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomBar(),
      body: Obx(() => IndexedStack(
        index: con.indexTab.value,
        children: [
          ClientProductsListPage(),
          DeliveryOrdersListPage(),
          ClientProfileInfoPage()
        ],
      ))
    );
  }

  Widget _bottomBar(){
    return Obx(() => CustomAnimatedBottomBar(
        containerHeight: 70,
      backgroundColor: Colors.amber,
      showElevation: true,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      selectedIndex: con.indexTab.value,
      onItemSelected: (index) => con.changeTab(index),
      items: [
        BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Productos'),
            activeColor: Colors.white,
            inactiveColor: Colors.black
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.list),
            title: Text('Mis pedidos'),
            activeColor: Colors.white,
            inactiveColor: Colors.black
        ),
        BottomNavyBarItem(
            icon: Icon(Icons.person),
            title: Text('Perfil'),
            activeColor: Colors.white,
            inactiveColor: Colors.black
        ),
      ],
    ));
  }
}
