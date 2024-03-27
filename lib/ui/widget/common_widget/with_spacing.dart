import 'package:flutter/cupertino.dart';

// Lớp ColumnWithSpacing là một lớp con của Column được mở rộng để thêm khoảng cách giữa các widget con
class ColumnWithSpacing extends Column {
  ColumnWithSpacing({
    super.crossAxisAlignment,
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    double spacing = 16, // Khoảng cách mặc định giữa các widget con
    List<Widget> children = const <Widget>[],
  }) : super(
          // Sử dụng phương thức insertBetweenAll để chèn SizedBox(height: spacing) giữa các widget con
          children: children.insertBetweenAll(
            SizedBox(height: spacing),
          ),
        );
}

// Lớp RowWithSpacing là một lớp con của Row được mở rộng để thêm khoảng cách giữa các widget con
class RowWithSpacing extends Row {
  RowWithSpacing({
    super.crossAxisAlignment,
    super.key,
    super.mainAxisAlignment,
    super.mainAxisSize,
    super.textBaseline,
    super.textDirection,
    super.verticalDirection,
    double spacing = 16, // Khoảng cách mặc định giữa các widget con
    List<Widget> children = const <Widget>[],
  }) : super(
          // Sử dụng phương thức insertBetweenAll để chèn SizedBox(width: spacing) giữa các widget con
          children: children.insertBetweenAll(
            SizedBox(width: spacing),
          ),
        );
}

// Phương thức mở rộng để chèn một widget vào giữa mỗi cặp widget trong danh sách
extension on List<Widget> {
  List<Widget> insertBetweenAll(Widget widget) {
    var result = List<Widget>.empty(growable: true);
    for (int i = 0; i < length; i++) {
      result.add(this[i]);
      if (i != length - 1) {
        result.add(widget);
      }
    }
    return result;
  }
}
