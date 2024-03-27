import 'package:project_order_food/core/extension/methods.dart';
import 'package:project_order_food/core/model/cart.dart';
import 'package:project_order_food/core/model/field_name.dart';
import 'package:project_order_food/core/model/model.dart';
import 'package:project_order_food/core/model/product.dart';

class CartProduct extends Model {
  CartProduct(super.data);
  // Lấy thông tin sản phẩm từ dữ liệu
  Product get product => Methods.getMap(data, FieldName.product);
  // Lấy thông tin giỏ hàng từ dữ liệu
  Cart get cart => Methods.getMap(data, FieldName.cart);

  @override
  String toString() {
    // Trả về chuỗi mô tả sản phẩm và giỏ hàng
    return 'Product: {id: ${product.id}, title: ${product.title}} - Cart: {quantity: ${cart.quantity}}';
  }
}
