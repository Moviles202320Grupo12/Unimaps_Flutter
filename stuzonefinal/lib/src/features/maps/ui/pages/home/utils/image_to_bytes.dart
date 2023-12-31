

import 'package:flutter/services.dart';

import 'dart:ui' as ui;

import 'package:flutter_cache_manager/flutter_cache_manager.dart';

Future<Uint8List> assetToBytes(String path, {int width = 200, int height = 100}) async{
    final byteData = await rootBundle.load(path);
    final bytes = byteData.buffer.asUint8List();
    final codec =await  ui.instantiateImageCodec(bytes, targetWidth: width, targetHeight: height);
    final frame = await codec.getNextFrame();
    final newByteData = await frame.image.toByteData(format: ui.ImageByteFormat.png);
    return newByteData!.buffer.asUint8List();
}

Future<Uint8List> imageToBytes(String path, {int width = 200, int height = 100, bool fromNetwork=false}) async{
    late Uint8List bytes;
    if(fromNetwork){
        final file = await DefaultCacheManager().getSingleFile(path);
        bytes = await file.readAsBytes();
    }
    else{
        final byteData = await rootBundle.load(path);
        bytes = byteData.buffer.asUint8List();
    }
    final codec =await  ui.instantiateImageCodec(bytes, targetWidth: width, targetHeight: height);
    final frame = await codec.getNextFrame();
    final newByteData = await frame.image.toByteData(format: ui.ImageByteFormat.png);
    return newByteData!.buffer.asUint8List();

}