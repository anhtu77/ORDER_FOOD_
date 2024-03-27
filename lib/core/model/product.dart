import 'package:project_order_food/core/extension/methods.dart';
import 'package:project_order_food/core/model/field_name.dart';
import 'package:project_order_food/core/model/model.dart';

class Product extends Model {
  Product(super.data);
  // Lấy tiêu đề sản phẩm từ dữ liệu
  String get title => Methods.getString(data, FieldName.title);
  // Lấy mô tả sản phẩm từ dữ liệu
  String get description => Methods.getString(data, FieldName.description);
  // Lấy giá sản phẩm dưới dạng chuỗi tiền tệ Việt Nam từ dữ liệu
  String get strPrice => Methods.getPriceVND(data, FieldName.price);
  // Lấy giá sản phẩm dưới dạng số nguyên từ dữ liệu
  int get price => Methods.getInt(data, FieldName.price);
  // Lấy giá giảm giá sản phẩm dưới dạng chuỗi tiền tệ Việt Nam từ dữ liệu
  String get discountPrice =>
      Methods.getPriceVND(data, FieldName.discountPrice);
}
