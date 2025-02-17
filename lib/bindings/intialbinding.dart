import 'package:get/get.dart';
import 'package:elmahdy/core/class/crud.dart';

class IntialBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
    Get.put(Crudg());
    Get.put(Crudtoken());
    Get.put(Crudwithfiles());
    Get.put(Crudgtoken());
  }
}
