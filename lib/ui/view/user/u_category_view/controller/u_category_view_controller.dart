import 'package:project_order_food/core/model/category.dart';
import 'package:project_order_food/core/model/product.dart';
import 'package:project_order_food/locator.dart';
import 'package:project_order_food/ui/base_app/base_controller.dart';
import 'package:project_order_food/ui/view/common_view/loading_view/data_app.dart';

//Quản lý danh mục sản phẩm và sản phẩm tương ứng
class UCategoryViewController extends BaseController {
  List<Product> get allProduct => locator<DataApp>().listProduct;

  List<Category> get listCategory => locator<DataApp>().listCategoy;

  String? categoryID;
  final List<Product> _listProduct = locator<DataApp>().listProduct.toList();

  List<Product> get listProduct => _listProduct;
  // Cập nhật sản phẩm theo danh mục
  void updateByCategory(String newValue) {
    _listProduct.clear();
    if (categoryID == newValue) {
      categoryID = null;
      _listProduct.addAll(allProduct);
    } else {
      categoryID = newValue;
      for (var e in allProduct) {
        if (e.refID.trim() == categoryID) {
          _listProduct.add(e);
        }
      }
    }
    notifyListeners();
  }

  // Tải lại dữ liệu
  void reloadNewData() {
    categoryID = null;
    _listProduct.addAll(allProduct);
    notifyListeners();
  }
}
