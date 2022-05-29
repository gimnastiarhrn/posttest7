import 'package:get/get.dart';
import 'package:posttest7/pages/account/account_controller.dart';
import 'package:posttest7/pages/add_widget/add_widget_controller.dart';
import 'package:posttest7/pages/home/home_controller.dart';
import 'package:posttest7/pages/kritik/kritik_controller.dart';
import 'package:posttest7/pages/mainpage/mainpage_controller.dart';

import 'dashboard_controller.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashboardController>(() => DashboardController());
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<AccountController>(() => AccountController());
    Get.lazyPut<KritikController>(() => KritikController());
    Get.lazyPut<MainpageController>(() => MainpageController());
    Get.lazyPut<AddWidgetController>(() => AddWidgetController());
  }
}
