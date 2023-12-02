import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/image_strings.dart';
import '../controllers/coupons_controller.dart';
import '../models/coupon_model.dart';



class CuponesView extends StatelessWidget {
  final int initialValue;
  CuponesView({Key? key , required this.initialValue}) : super(key: key);
  final controller = Get.put(CouponController());

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text('Galería de Cupones',
              style: TextStyle(
                  color: Color(0xFFF6A700),
                  fontFamily: 'Urbanist',
                  fontWeight: FontWeight.bold,
                  fontSize: 20)),
        ),
        body:Column(
            children: [
        Expanded(child:
        FutureBuilder<List<Coupon>>(
    future: controller.getAllCoupons(),
    builder: (context, snapshot) {
    if (snapshot.connectionState == ConnectionState.done) {
    if (snapshot.hasData) {
    return ListView.builder(
        itemCount: snapshot.data!.length,
          itemBuilder: (context, index) {
            final coupon = snapshot.data![index];
            return ListTile(
                contentPadding: const EdgeInsets.symmetric(vertical: 20.0),
              title: Text(coupon.title),
              subtitle: Text(coupon.description),
              trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Pasos: $initialValue / ${coupon.pasosNecesarios} "),
                Expanded(
                    child:

                    ElevatedButton(
                onPressed: () {
                  if (coupon.pasosNecesarios <= initialValue) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return const QRCodeScreen();
                        },
                      ),
                    );
                  }

                  final couponData = Coupon(
                    id: coupon.id,
                      title: coupon.title,
                      description: coupon.description,
                      imageQr: coupon.imageQr,
                      pasosNecesarios: coupon.pasosNecesarios,
                      reclamados: coupon.reclamados+1
                  );

                  controller.updateRecord(couponData);
                },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, minimumSize: const Size(40, 40)),
                child: const Text('Ver Código QR',style: TextStyle(
                    color: Color(0xFFF6A700),
                    fontFamily: 'Urbanist',
                    fontWeight: FontWeight.bold,
                    fontSize: 20)),
              ),
                )])
            );
          });
    } else if (snapshot.hasError) {
      return Center(child: Text(snapshot.error.toString()));
    } else {
      return const Center(child: Text('Something went wrong'));
    }
    } else {
      return const Center(child: CircularProgressIndicator());
    }
    },


    ),



        ),
    ],),
        ),
    );
  }
}

class QRCodeScreen extends StatelessWidget {
  const QRCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Código QR', style: TextStyle(
            color: Color(0xFFF6A700),
            fontFamily: 'Urbanist',
            fontWeight: FontWeight.bold,
            fontSize: 20)),
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