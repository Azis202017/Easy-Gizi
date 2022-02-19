import 'package:get/get.dart';

import '../controllers/bmi_calculator_controller.dart';

class BmiCalculatorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BmiCalculatorController>(
      () => BmiCalculatorController(),
    );
  }
}
