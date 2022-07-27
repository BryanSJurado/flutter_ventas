import 'package:flutter/material.dart';
import 'package:flutter_ventas/src/models/producto.dart';
import 'package:get/get.dart';

import 'client_orders_create_controller.dart';

class ClientOrdersCreatePage extends StatelessWidget {


  ClientOrdersCreateController con = Get.put(ClientOrdersCreateController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Text(producto.nomPro ?? '',
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
        onPressed: () {},
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
        '${producto.preUniPro! * producto.quantity!}',
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
          onTap: () {},
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
          onTap: () {},
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
