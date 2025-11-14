import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:vouch/controllers/bottom_nav_controller.dart';

class IntialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BottomNavController(), permanent: true);  
  }
}