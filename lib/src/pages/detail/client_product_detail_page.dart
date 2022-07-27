import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/models/producto.dart';
import 'package:flutter_ventas/src/pages/detail/client_product_detail_controller.dart';
import 'package:get/get.dart';

class ClientProductDetailPage extends StatelessWidget {

  Producto? producto;

  ClientProductDetailController con = Get.put(ClientProductDetailController());

  ClientProductDetailPage({@required this.producto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('ClientProductDetailPage'),
      ),
    );
  }
}
