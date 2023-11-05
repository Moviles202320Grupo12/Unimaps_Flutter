import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:stuzonefinal/src/features/authentication/models/user_model.dart';
import 'package:stuzonefinal/src/features/walkingpoints/controllers/walking_controller.dart';

import '../../../constants/colors.dart';
import '../../../constants/image_strings.dart';
import '../../../constants/sizes.dart';

class Coupon {
  final String title;
  final String description;
  final int value;

  Coupon({required this.title, required this.description, required this.value});
}

class CuponesView extends StatelessWidget {
  CuponesView({Key? key}) : super(key: key);
  final List<Coupon> coupons = [
    Coupon(
      title: 'Cupón 1',
      description: 'Este es el cupón 1',
      value: 1,
    ),
    Coupon(
      title: 'Cupón 2',
      description: 'Este es el cupón 2',
      value: 2,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Galería de Cupones'),
        ),
        body: ListView.builder(
          itemCount: coupons.length,
          itemBuilder: (context, index) {
            final coupon = coupons[index];
            return ListTile(
              title: Text(coupon.title),
              subtitle: Text(coupon.description),
              trailing: ElevatedButton(
                onPressed: () {
                  if (coupon.value == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return QRCodeScreen();
                        },
                      ),
                    );
                  }
                },
                child: Text('Ver Código QR'),
              ),
            );
          },
        ),
      ),
    );
  }
}

class QRCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Código QR'),
      ),
      body: Center(
        child: CachedNetworkImage(
          imageUrl: "https://upload.wikimedia.org/wikipedia/commons/d/d7/Commons_QR_code.png",
          placeholder: (context, url) {
            // Si no hay conexión o la imagen no se puede cargar, muestra la imagen predeterminada desde el almacenamiento local
            return Image.asset(defaultLostProperty);
          },
          errorWidget: (context, url, error) {
            // Si ocurre un error al cargar la imagen, muestra la imagen predeterminada desde el almacenamiento local
            return Image.asset(defaultLostProperty);
          },
        ),
      ),
    );
  }
}