import 'package:get_it/get_it.dart';
import 'package:project_order_food/ui/view/common_view/loading_view/data_app.dart';
import 'package:project_order_food/core/service/get_navigation.dart';

// GetIt instance để quản lý các dependency trong ứng dụng.
GetIt locator = GetIt.instance;
// Hàm setupLocator để đăng ký các service và dependency cần thiết cho ứng dụng.
void setupLocator() {
  locator.registerLazySingleton(() => GetNavigation());
  locator.registerLazySingleton(() => DataApp());
}
