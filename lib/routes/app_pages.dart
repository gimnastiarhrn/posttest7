import 'package:get/get.dart';
import 'package:posttest7/pages/dashboard/dashboard_binding.dart';
import 'package:posttest7/pages/home/home_page.dart';
import 'app_routes.dart';

class AppPages {
  static var list = [
    GetPage(
      name: AppRoutes.HOMEPAGE,
      page: () => HomePage(),
      binding: DashboardBinding(),
    ),
  ];
}
