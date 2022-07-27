import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/models/producto.dart';
import 'package:get/get.dart';

import 'client_orders_create_controller.dart';

class ClientOrdersCreatePage extends StatelessWidget {


  ClientOrdersCreateController con = Get.put(ClientOrdersCreateController());

  @override
  Widget build(BuildContext context) {
    return Obx(() =>  Scaffold(
      bottomNavigationBar: Container(
        color: Color.fromRGBO(245, 245, 245, 1),
        height: 100,
        child: _totalToPay(context),
      ),
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text(
          'Mi Orden',
          style: TextStyle(
            color: Colors.black
          ),
        ),
      ),
      body: con.selectedProducts.length > 0
      ? ListView(
        children:
          con.selectedProducts.map((Producto producto) {
            return _cardProduct(producto);
          }).toList(),
      )
      : Container(),
    ));
  }

  Widget _totalToPay(BuildContext context){
    return Column(
      children: [
        Divider(height: 1, color: Colors.grey,),
        Container(
          margin: EdgeInsets.only(left: 20, top: 25),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                  'TOTAL: \$${con.total.value}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                //width: MediaQuery.of(context).size.width*0.6,
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(15)
                    ),
                    child: Text(
                        'CONFIRMAR ORDEN',
                        style: TextStyle(
                            color: Colors.black
                        )
                    )),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget _cardProduct(Producto producto){
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        children: [
          _imageProduct(producto),
          SizedBox(width: 15,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('${producto.nomPro}' + '    ' + '${producto.preUniPro.toString()}',
              style: TextStyle(
                fontWeight: FontWeight.bold
              ),),
              SizedBox(height: 10),
              _buttonsAddOrRemove(producto)
            ],
          ),
          Spacer(),
          Column(
            children: [
              _textPrice(producto),
              _iconDelete(producto)
            ],
          )
        ],
      ),
    );
  }

  Widget _iconDelete(Producto producto){
    return IconButton(
        onPressed: () => con.deleteItem(producto),
        icon: Icon(
          Icons.delete,
          color: Colors.red,
        )
    );
  }

  Widget _textPrice(Producto producto){
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Text(
        '\$${producto.preUniPro ?? 0 * producto.quantity! }',
        style: TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold
        ),
      ),
    );
  }

  Widget _buttonsAddOrRemove(Producto producto){
    return Row(
      children: [
        GestureDetector(
          onTap: () => con.removeItme(producto),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8)
              )
            ),
            child: Text('-'),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
          color: Colors.grey[200],
          child: Text('${producto.quantity ?? 0}'),
        ),
        GestureDetector(
          onTap: () => con.addItme(producto),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
            decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8)
                )
            ),
            child: Text('+'),
          ),
        ),
      ],
    );
  }

  Widget _imageProduct(Producto producto){
    return Container(
      height: 70,
      width: 70,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: FadeInImage(
          image: producto.imgPro != null || producto.imgPro == null
              ? AssetImage('assets/img/no-image.png') as ImageProvider
              : NetworkImage(producto.imgPro!),  //AssetImage('assets/img/no-image.png') as ImageProvider,
          fit: BoxFit.cover,
          fadeInDuration: Duration(milliseconds: 50),
          placeholder: AssetImage('assets/img/no-image.png'),
        ),
      ),
    );
  }
}
