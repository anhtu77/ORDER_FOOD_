import 'package:flutter/material.dart';
import 'package:project_order_food/ui/shared/app_color.dart';

// Lớp ATextFormField là một StatelessWidget để hiển thị một trường nhập liệu văn bản
class ATextFormField extends StatelessWidget {
  final String? Function(String?)?
      validator; // Hàm validator để kiểm tra giá trị nhập liệu, mặc định là null
  final String label; // Nhãn của trường nhập liệu
  final bool
      obscureText; // Xác định liệu văn bản nhập liệu có bị ẩn hay không, mặc định là false
  final TextInputType?
      keyboardType; // Kiểu bàn phím cho trường nhập liệu, mặc định là null
  final String?
      initValue; // Giá trị khởi tạo của trường nhập liệu, mặc định là null
  final int? maxLines; // Số dòng tối đa của trường nhập liệu, mặc định là 1
  final String hintText; // Văn bản gợi ý cho trường nhập liệu
  final String? Function(String?)?
      onSaved; // Hàm để lưu giá trị của trường nhập liệu, mặc định là null
  final void Function(String)?
      onChanged; // Hàm được gọi khi giá trị của trường nhập liệu thay đổi, mặc định là null

  // Hàm khởi tạo của lớp ATextFormField
  const ATextFormField({
    super.key,
    this.validator, // Hàm validator để kiểm tra giá trị nhập liệu
    required this.label, // Nhãn của trường nhập liệu, bắt buộc
    this.keyboardType, // Kiểu bàn phím cho trường nhập liệu
    this.maxLines = 1, // Số dòng tối đa của trường nhập liệu
    this.onChanged, // Hàm được gọi khi giá trị của trường nhập liệu thay đổi
    this.initValue, // Giá trị khởi tạo của trường nhập liệu
    this.obscureText =
        false, // Xác định liệu văn bản nhập liệu có bị ẩn hay không
    this.hintText = 'Enter new value', // Văn bản gợi ý cho trường nhập liệu
    this.onSaved, // Hàm để lưu giá trị của trường nhập liệu
  });

  @override
  Widget build(BuildContext context) {
    // Widget TextFormField để hiển thị trường nhập liệu văn bản
    return TextFormField(
      obscureText:
          obscureText, // Xác định liệu văn bản nhập liệu có bị ẩn hay không
      onSaved: onSaved, // Hàm để lưu giá trị của trường nhập liệu
      keyboardType: keyboardType, // Kiểu bàn phím cho trường nhập liệu
      maxLines: maxLines, // Số dòng tối đa của trường nhập liệu
      onChanged:
          onChanged, // Hàm được gọi khi giá trị của trường nhập liệu thay đổi
      initialValue: initValue, // Giá trị khởi tạo của trường nhập liệu
      autovalidateMode: AutovalidateMode
          .onUserInteraction, // Chế độ tự động kiểm tra lỗi khi tương tác người dùng
      validator: validator ??
          (v) => v!.isEmpty
              ? 'Không được để trống'
              : null, // Hàm validator để kiểm tra giá trị nhập liệu
      decoration: InputDecoration(
        hintText: hintText, // Văn bản gợi ý cho trường nhập liệu
        filled:
            true, // Xác định liệu trường nhập liệu có nền được tô màu hay không
        labelText: label, // Nhãn của trường nhập liệu
        border: OutlineInputBorder(
          borderRadius:
              BorderRadius.circular(16), // Độ bo của góc của khung viền
          borderSide: BorderSide(
              width: 1, color: AColor.black), // Đường viền của khung viền
        ),
        fillColor: AColor.white, // Màu nền của trường nhập liệu
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
              16), // Độ bo của góc của khung viền khi được kích hoạt
          borderSide: BorderSide(
              width: 1,
              color:
                  AColor.black), // Đường viền của khung viền khi được kích hoạt
        ),
      ),
    );
  }
}
