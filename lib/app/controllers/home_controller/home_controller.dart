import 'package:get/get.dart';

class HomeController extends GetxController {

  final activePositionCard = 0.obs;

  setPositionCard(index){
    activePositionCard.value = index;
  }
  
}