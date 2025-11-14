import 'package:get/get.dart';

class BottomNavController extends GetxController {
  // Observable variable for current selected index
  final RxInt currentIndex = 0.obs;
  
  // Method to change the current index
  void changeIndex(int index) {
    currentIndex.value = index;
  }
  
  // Get current index value
  int get getCurrentIndex => currentIndex.value;
}