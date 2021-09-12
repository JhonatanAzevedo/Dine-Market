import 'package:get/get.dart';

import 'package:dine_market/app/ui/android/home/home_page.dart';

part './app_routes.dart';

class AppPages {
  static final routes = [
    GetPage(name: Routes.HOME, page: () => HomePage())
  ];
}