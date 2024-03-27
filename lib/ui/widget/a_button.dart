import 'package:flutter/material.dart';
import 'package:project_order_food/ui/shared/app_color.dart';

// Lớp AButton là một MaterialButton được tùy biến để tạo ra các nút với văn bản hoặc child widget tùy chỉnh
class AButton extends MaterialButton {
  // Hàm khởi tạo cho nút với văn bản
  AButton.text(
    String text, {
    bool isExpanded =
        false, // Tham số cho biết liệu nút có mở rộng theo chiều ngang không, mặc định là false
    super.onPressed, // Callback khi nút được nhấn
    super.key, // Key để xác định widget
    super.color, // Màu sắc của nút
    super.padding, // Khoảng cách nội bộ của nút
  }) : super(
          minWidth:
              isExpanded ? double.maxFinite : null, // Độ rộng tối thiểu của nút
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Bo góc của nút
            side: BorderSide(color: AColor.black), // Đường viền của nút
          ),
          child: Text(text), // Văn bản hiển thị trên nút
        );

  // Hàm khởi tạo cho nút với child widget tùy chỉnh
  AButton({
    bool isExpanded =
        false, // Tham số cho biết liệu nút có mở rộng theo chiều ngang không, mặc định là false
    super.onPressed, // Callback khi nút được nhấn
    super.key, // Key để xác định widget
    super.color, // Màu sắc của nút
    super.padding, // Khoảng cách nội bộ của nút
    required Widget child, // Widget con của nút
  }) : super(
          minWidth:
              isExpanded ? double.maxFinite : null, // Độ rộng tối thiểu của nút
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8), // Bo góc của nút
            side: BorderSide(color: AColor.black), // Đường viền của nút
          ),
          child: child, // Widget con của nút
        );
}
