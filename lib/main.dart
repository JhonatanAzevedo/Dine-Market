import 'package:dine_market/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Dine Market",
    initialRoute: '/',
    getPages: AppPages.routes,
  ));
}