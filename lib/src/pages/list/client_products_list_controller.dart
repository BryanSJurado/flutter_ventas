import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/models/producto.dart';
import 'package:flutter_ventas/src/pages/detail/client_product_detail_page.dart';
import 'package:flutter_ventas/src/providers/products_provider.dart';
import 'package:get/get.dart';
import '../../models/categoria.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class ClientProductsListController extends GetxController {

  ProductsProvider productsProvider = ProductsProvider();

  List<Categoria> categorias = <Categoria>[].obs;

  ClientProductsListController(){
    getCategorias();
  }

  void getCategorias() async {
    categorias = [ new Categoria(
                                  idCat: '1',
                                  nomCat: 'Categoría1')];
    //categorias.addAll(categorias);
  }

  Future<List<Producto>> getProductos() async{
    return await productsProvider.findProductos();
  }

  void openBottomSheet(BuildContext context, Producto producto){
    showMaterialModalBottomSheet(
        context: context,
        builder: (context) => ClientProductDetailPage(producto: producto)
    );
  }
}