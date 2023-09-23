
// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:woo_api/woo_api.dart';

/// This is a reimplementation of the default Flutter application using provider + [ChangeNotifier].

void main()async{
  final wooApi = WooApi(
      scheme: 'YOUR_SCHEMA',
      host: 'www.yourwordpressdomain.com',
      consumerKey: 'YOUR_CONSUMER_KEY',
      consumerSecret: 'YOUR_SECRET_KEY');

  final response = await wooApi.getProductById(140);

  print(response.id); //eg 140
  print(response.name); //eg "Product name"
  print(response.description); //eg "Product description"
}

