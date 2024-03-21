import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project_order_food/core/model/field_name.dart';
import 'package:project_order_food/core/model/order_model.dart';
import 'package:project_order_food/locator.dart';
import 'package:project_order_food/ui/base_app/base_controller.dart';
import 'package:project_order_food/ui/base_app/base_table.dart';
import 'package:project_order_food/ui/view/common_view/loading_view/data_app.dart';

// Quản lý dữ liệu đơn hàng của người dùng
class UOderViewController extends BaseController {
  List<OrderModel> get listOrder => data.map((e) => OrderModel(e)).toList()
    ..sort((a, b) => b.createDate.compareTo(a.createDate));

  @override
  Future<QuerySnapshot<Object?>?>? loadData() {
    //Load dữ liệu đơn hàng của người dùng
    return FirebaseFirestore.instance
        .collection(BaseTable.order)
        .where(FieldName.userID, isEqualTo: locator<DataApp>().user.id)
        .get();
  }
}
