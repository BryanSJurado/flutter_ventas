import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/models/producto.dart';
import 'package:flutter_ventas/src/pages/list/client_products_list_controller.dart';
import 'package:get/get.dart';
import '../../models/categoria.dart';

class ClientProductsListPage extends StatelessWidget{

  ClientProductsListController con = Get.put(ClientProductsListController());
  @override
  Widget build(BuildContext context){
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
                tabs: List<Widget>.generate(con.categorias.length, (index){
                  return Tab(
                    child: Text(con.categorias[index].nomCat ?? '1')
                  );
                }),
              ),
            ),
          ),
          body: TabBarView(
            children: con.categorias.map((Categoria categoria) {
              return FutureBuilder(
                future: con.getProductos(),
                  builder: (context, AsyncSnapshot<List<Producto>> snapshot){
                   if (snapshot.hasData){

                     return ListView.builder(
                       itemCount: snapshot.data?.length ?? 0,
                         itemBuilder: (_, index){
                         return _cardProducto(snapshot.data![index]);
                       }
                     );
                   }
                   else
                     {

                       return Container(child:const Text("NO HAY PRODUCTOS..!!",
                           style: TextStyle(fontSize: 20)));
                     }
                  }
              );
            }).toList(),
          )
        ),
    );
  }

  Widget _cardProducto(Producto producto){
    return Container(
      margin: EdgeInsets.only(top: 15, left: 20, right: 20),
        child: ListTile(
          title: Text(producto.nomPro ?? ''),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5),
              Text('Marca: ' + producto.marPro.toString()),
              SizedBox(height: 10),
              Text(
                'Precio: '+producto.preUniPro.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          trailing: Container(
            height: 70,
            width: 70,
            child: FadeInImage(
              image: producto.imgPro != null || producto.imgPro == null
                    ? AssetImage('assets/img/no-image.png') as ImageProvider
                    : NetworkImage(producto.imgPro!),  //AssetImage('assets/img/no-image.png') as ImageProvider,
              fit: BoxFit.cover,
              fadeInDuration: Duration(milliseconds: 50),
              placeholder: AssetImage('assets/img/no-image.png'),
            ),
          ),
        ),
      );
    }

  /*
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
            children:

            con.categorias.map( (Categoria categoria) {

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

   */



}