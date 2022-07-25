import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/client/home/client_home_controller.dart';
import 'package:flutter_ventas/src/models/producto.dart';
import 'package:flutter_ventas/src/pages/list/client_products_list_controller.dart';
import 'package:get/get.dart';

import '../../models/categoria.dart';

class ClientHomePage extends StatelessWidget{

  ClientHomeController con = Get.put(ClientHomeController());

  @override
  Widget build(BuildContext context) {

    return DefaultTabController(
      length: con.categorias.length,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBar(
              bottom: TabBar(
                  isScrollable: true,
                  indicatorColor: Colors.amber,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey[600],
                  tabs: List<Widget>.generate(con.categorias.length, (index) {
                    return Tab(
                      child: Text(con.categorias[index].nomCat ?? ''),
                    );
                  })
              ),
            ),
          ),

          body: TabBarView(
            children: con.categorias.map( (Categoria categoria) {

              return FutureBuilder(
                  future: con.getProductos(),
                  builder: (context, AsyncSnapshot<List<Producto>> snapshot){

                    if(snapshot.hasData){

                      return ListView.builder(
                          itemCount: snapshot.data?.length ?? 0,
                          itemBuilder: (_, index){
                            return _cardProducto(snapshot.data![index]);
                          }
                      );
                    }else {
                      return Container();
                    }
                  }
              );
            }).toList(),

          )
      ),
    );
  }

  Widget _cardProducto(Producto producto){
    return ListTile(
      title: Text(producto.nomPro ?? ''),
      subtitle: Text(producto.marPro ?? ''),
      leading: FadeInImage(
        image: producto.imgPro != null
            ? NetworkImage(producto.imgPro!)
            : AssetImage('assets/img/no-image.png') as ImageProvider,
        fit: BoxFit.contain,
        fadeInDuration: Duration(milliseconds: 50),
        placeholder: AssetImage('assets/img/no-image.png'),
      ),
    );
  }
}