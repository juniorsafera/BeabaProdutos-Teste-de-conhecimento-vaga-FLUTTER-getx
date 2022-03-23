 
import 'package:gerencioador_funcionarios/app/Controller/controller.dart';
import 'package:get/get.dart';

class Binding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Controller>(
      () => Controller(),
    );
  }
}
