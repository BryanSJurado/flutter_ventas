import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:flutter_ventas/src/models/producto.dart';
import 'package:flutter_ventas/src/pages/detail/client_product_detail_controller.dart';
import 'package:get/get.dart';

class ClientProductDetailPage extends StatelessWidget {

  Producto? producto;

  late ClientProductDetailController con;
  var counter = 0.obs;
  var price = 0.0.obs;

  ClientProductDetailPage({@required this.producto}){
    con = Get.put(ClientProductDetailController());
  }

  @override
  Widget build(BuildContext context) {
    con.checkIfProductsWasAdded(producto!, price, counter);
    return Obx(() => Scaffold(
      bottomNavigationBar: Container(
        height: 100,
          child: _buttonsAddToBag()
      ),
      body: Container(
        margin: EdgeInsets.only(top: 5),
        child: Column(
          children: [
            _imageSlideShow(context),
            _textNameProduct(),
            _textMarcaProduct(),
            _textPrecioProduct(),
            _textStockProduct()
          ],
        ),
      ),
    ));
  }

  Widget _textNameProduct(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Text(
          producto!.nomPro ?? '',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: Colors.black
         ),
      ),
    );
  }

  Widget _textMarcaProduct(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 30, left: 30, right: 30),
      child: Text(
        producto!.marPro ?? '',
        style: TextStyle(
            fontSize: 16,
        ),
      ),
    );
  }

  Widget _buttonsAddToBag(){
    return Column(
      children: [
        Divider(height: 1, color: Colors.grey),
        Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 25),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: () => con.removeItem(producto!, price, counter),
                child: Text(
                  '-',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size(40, 37),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          bottomLeft: Radius.circular(25),
                        )
                    )
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  '${counter.value}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  minimumSize: Size(40, 37)
                ),
              ),
              ElevatedButton(
                onPressed: () => con.addItem(producto!, price, counter),
                child: Text(
                  '+',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 22
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    minimumSize: Size(45, 37),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        )
                    )
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () => con.addToBag(producto!, price, counter),
                child: Text(
                  'Agregar   ${price.value}',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 17
                  ),
                ),
                style: ElevatedButton.styleFrom(
                    primary: Colors.amber ,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    )
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _textPrecioProduct(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 15, left: 30, right: 30),
      child: Text(
        '\$${producto!.preUniPro.toString() ?? ''}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
          color: Colors.black
        ),
      ),
    );
  }

  Widget _textStockProduct(){
    return Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: 15, left: 30, right: 30),
      child: Text(
        'Stock: ' + producto!.stockPro.toString() ?? '',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black
        ),
      ),
    );
  }

  Widget _imageSlideShow(BuildContext context){
    return SafeArea(
        child: Stack(
          children: [
            ImageSlideshow(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.4,
                initialPage: 0,
                indicatorColor: Colors.amber,
                indicatorBackgroundColor: Colors.grey,
                children: [
                  FadeInImage(
                      fit: BoxFit.cover,
                      fadeInDuration: Duration(milliseconds: 50),
                      placeholder: AssetImage('assets/img/no-image.png'),
                      image: producto!.imgPro == null || producto!.imgPro != null
                      ? AssetImage('assets/img/no-image.png') as ImageProvider
                      : AssetImage('assets/img/no-image.png') as ImageProvider
                  ),
                ]
            )
          ],
        )
    );
  }
}
