import 'package:flutter/material.dart';
import 'package:project_order_food/core/service/authenication_service.dart';
import 'package:project_order_food/ui/router.dart';
import 'package:project_order_food/ui/widget/dialog/a_dialog.dart';

class GetNavigation {
  // Khai báo một khóa toàn cục để quản lý điều hướng
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // Điều hướng đến một màn hình cụ thể
  Future<dynamic> to(String routeName, {Object? arguments}) async {
    return navigatorKey.currentState
        ?.pushNamed(routeName, arguments: arguments);
  }

  // Thay thế màn hình hiện tại bằng một màn hình mới
  Future<dynamic> replaceTo(String routeName, {Object? arguments}) async {
    return await navigatorKey.currentState
        ?.pushReplacementNamed(routeName, arguments: arguments);
  }

  // Quay lại màn hình trước đó
  Future<dynamic> back() async {
    return navigatorKey.currentState?.pop();
  }

  // Đăng xuất và chuyển đến màn hình đăng nhập
  Future<dynamic> toLogout() async {
    AuthenticationService service = AuthenticationService();
    await service.signOut();
    return navigatorKey.currentState
        ?.pushReplacementNamed(RoutePaths.loginView);
  }

  // Mở một hộp thoại thông báo
  Future<void> openDialog({
    String? title,
    TypeDialog typeDialog = TypeDialog.error,
    String? content,
    Function()? onClose,
    Function()? onSubmit,
  }) async {
    await showDialog(
      context: navigatorKey.currentContext!,
      builder: (context) {
        return BaseADialog(
          content: content,
          onClose: onClose,
          onSubmit: onSubmit,
          title: title,
          typeDialog: typeDialog,
        );
      },
    );
  }
}
