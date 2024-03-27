import 'package:project_order_food/core/extension/methods.dart';
import 'package:project_order_food/core/model/field_name.dart';

class Model {
  Model(this.data);
  // Dữ liệu của mô hình
  final Map<String, dynamic> data;
  // Lấy ID từ dữ liệu
  String get id => Methods.getString(data, 'id');
  // Lấy ngày tạo thành chuỗi dạng 'dd/MM/yyyy' từ dữ liệu ngày tạo
  String get createDate =>
      Methods.convertTime(Methods.getDateTime(data, FieldName.createDate),
          defaultFormat: 'dd/MM/yyyy');

  // Lấy ID tham chiếu từ dữ liệu
  String get refID => Methods.getString(data, FieldName.refID);
  // Lấy đường dẫn hình ảnh từ dữ liệu
  String get img => Methods.getString(data, FieldName.img);
}
