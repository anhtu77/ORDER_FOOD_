import 'dart:convert';

import 'package:project_order_food/core/extension/methods.dart';
import 'package:project_order_food/core/model/field_name.dart';

// Định nghĩa lớp Cart để đại diện cho một sản phẩm trong giỏ hàng
class Cart {
  /// ID của sản phẩm (món ăn)
  final String refID;

  /// Số lượng của sản phẩm trong giỏ hàng
  final int quantity;

  Cart({
    required this.refID,
    required this.quantity,
  });

  // Chuyển đổi đối tượng Cart thành một Map
  static Map<String, dynamic> toMap(Cart cart) {
    return {FieldName.refID: cart.refID, FieldName.quantity: cart.quantity};
  }

  // Tạo một đối tượng Cart từ một Map
  factory Cart.fromJson(Map<String, dynamic> json) {
    return Cart(
      refID: Methods.getString(json, FieldName.refID),
      quantity: Methods.getInt(json, FieldName.quantity),
    );
  }

  // Mã hóa danh sách Cart thành một chuỗi
  static String encode(List<Cart> lCart) => json.encode(
        lCart.map((e) => toMap(e)).toList(),
      );

  // Giải mã chuỗi SharedPreferences thành một danh sách Cart
  static List<Cart> decode(String carts) =>
      (json.decode(carts) as List<dynamic>)
          .map((item) => Cart.fromJson(item))
          .toList();

  // Tạo chuỗi mô tả của đối tượng Cart
  @override
  String toString() {
    return 'refID: $refID - quantity: $quantity';
  }
}
