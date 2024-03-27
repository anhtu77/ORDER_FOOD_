import 'package:project_order_food/core/extension/methods.dart';
import 'package:project_order_food/core/model/field_name.dart';
import 'package:project_order_food/core/model/model.dart';

class UserApp extends Model {
  UserApp(super.data);
  // Lấy địa chỉ email từ dữ liệu
  String get email => Methods.getString(data, FieldName.email);
  // Lấy tên người dùng từ dữ liệu
  String get userName => Methods.getString(data, FieldName.userName);
  // Lấy số điện thoại từ dữ liệu
  String get phoneNumber => Methods.getString(data, FieldName.phoneNumber);

  @override
  String toString() {
    // Trả về chuỗi mô tả người dùng gồm UID và Email
    return 'UID: $id - Email: $email';
  }
}
