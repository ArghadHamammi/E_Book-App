import 'package:get/get.dart';

abstract class SuccessSignUpController extends GetxController {
  goToPageLoging();
}

class SuccessSignUpControllerimp extends SuccessSignUpController {
  @override
  goToPageLoging() {
    Get.offNamed("/login");
  }
 
}
