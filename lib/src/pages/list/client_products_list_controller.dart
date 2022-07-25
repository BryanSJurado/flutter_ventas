import 'package:flutter/foundation.dart';
import 'package:flutter_ventas/src/models/producto.dart';
import 'package:flutter_ventas/src/providers/products_provider.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'dart:typed_data';
import '../../models/categoria.dart';

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
}