import 'package:flutter/foundation.dart';

mixin HandleExceptionMixin {
  // Xử lý ngoại lệ và ghi log
  handelException(dynamic e, {String? subTitle}) {
    log(e, subTitle: subTitle);
  }

  // Ghi log
  void log(dynamic e, {String? subTitle}) {
    String titleLog = runtimeType.toString();
    if (subTitle != null) titleLog += '.[$subTitle]';
    debugPrint(subTitle);
    // In log chỉ khi trong chế độ debug
    if (kDebugMode) {
      print('\x1b[101m\x1b[30m$titleLog: $e}\x1b[0m');
    }
  }
}
