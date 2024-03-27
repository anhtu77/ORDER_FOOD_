import 'package:flutter/material.dart';
import 'package:project_order_food/ui/config/app_style.dart';
import 'package:project_order_food/ui/shared/app_color.dart';
import 'package:project_order_food/ui/widget/a_button.dart';

// Enum để định nghĩa các loại dialog: cảnh báo, hỏi, thành công, lỗi
enum TypeDialog { waring, ask, sucesss, error }

// Lớp ADialog chứa phương thức để hiển thị dialog
class ADialog {
  static void show(BuildContext context,
      {String? title,
      TypeDialog typeDialog =
          TypeDialog.error, // Loại dialog, mặc định là error
      String? content,
      Function()? onClose,
      Function()? onSubmit}) {
    showDialog(
        context: context,
        builder: ((context) => BaseADialog(
              content: content,
              onClose: onClose,
              onSubmit: onSubmit,
              title: title,
              typeDialog: typeDialog,
            )));
  }
}

// Lớp BaseADialog là một StatelessWidget để tạo và hiển thị dialog cơ bản
class BaseADialog extends StatelessWidget {
  final String? title; // Tiêu đề của dialog
  final TypeDialog typeDialog; // Loại dialog
  final String? content; // Nội dung của dialog
  final Function()? onClose; // Callback khi đóng dialog
  final Function()? onSubmit; // Callback khi nhấn nút xác nhận

  const BaseADialog({
    super.key,
    this.title,
    this.typeDialog = TypeDialog.error,
    this.content,
    this.onClose,
    this.onSubmit,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          iconDefault, // Icon tùy thuộc vào loại dialog
          const SizedBox(width: 8),
          AText.title(title ?? textDefalt.keys.first), // Tiêu đề của dialog
        ],
      ),
      content: AText.body(content ?? textDefalt.values.first,
          maxLines: null), // Nội dung của dialog
      actions: [
        AButton.text(
          'Đóng', // Text cho nút đóng dialog
          color: AColor.red, // Màu sắc của nút đóng dialog
          onPressed: onClose ??
              () => Navigator.pop(
                  context), // Callback khi nhấn nút đóng dialog, mặc định là đóng dialog
        ),
        if (onSubmit != null) // Nếu có callback khi nhấn nút xác nhận
          AButton.text(
            'Xác nhận', // Text cho nút xác nhận dialog
            color: AColor.greenBold, // Màu sắc của nút xác nhận dialog
            onPressed: onSubmit, // Callback khi nhấn nút xác nhận dialog
          ),
      ],
    );
  }
}

// Extension để cung cấp giá trị mặc định cho icon và text của dialog
extension DefaultValueDialog on BaseADialog {
  // Phương thức để lấy icon tùy thuộc vào loại dialog
  Icon get iconDefault {
    switch (typeDialog) {
      case TypeDialog.waring:
        return Icon(
          Icons.warning, // Icon cảnh báo
          color: AColor.yellow, // Màu sắc của icon cảnh báo
        );
      case TypeDialog.ask:
        return Icon(
          Icons.question_mark, // Icon hỏi
          color: AColor.primary, // Màu sắc của icon hỏi
        );
      case TypeDialog.sucesss:
        return Icon(
          Icons.check, // Icon thành công
          color: AColor.greenBold, // Màu sắc của icon thành công
        );
      case TypeDialog.error:
        return Icon(
          Icons.close, // Icon lỗi
          color: AColor.red, // Màu sắc của icon lỗi
        );
    }
  }

  // Phương thức để lấy giá trị mặc định cho tiêu đề và nội dung của dialog
  Map<String, String> get textDefalt {
    switch (typeDialog) {
      case TypeDialog.waring:
        return {
          'Cảnh báo': 'Chức năng không phù hợp'
        }; // Tiêu đề và nội dung của dialog cảnh báo
      case TypeDialog.ask:
        return {
          'Xác nhận': 'Bạn xác nhận thay đổi không'
        }; // Tiêu đề và nội dung của dialog hỏi
      case TypeDialog.sucesss:
        return {
          'Thành công': 'Chức năng đã được thực hiện'
        }; // Tiêu đề và nội dung của dialog thành công
      case TypeDialog.error:
        return {
          'Lỗi': 'Đã có vấn đề xãy ra'
        }; // Tiêu đề và nội dung của dialog lỗi
    }
  }
}
