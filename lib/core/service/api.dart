import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

import 'package:path/path.dart';
import 'package:project_order_food/core/extension/log.dart';
import 'package:project_order_food/core/model/field_name.dart';

class Api {
  Api(this.pathCollection) {
    ref = FirebaseFirestore.instance.collection(pathCollection);
  }
  // Đường dẫn tới collection trong Firestore
  final String pathCollection;
  // Tham chiếu tới collection trong Firestore
  late CollectionReference ref;
  // Đối tượng lưu trữ Firebase
  FirebaseStorage storage = FirebaseStorage.instance;

  // Lấy dữ liệu từ bảng
  Future<QuerySnapshot> getDataCollection() {
    return ref.get();
  }

  // Lấy stream dữ liệu từ collection
  Stream<QuerySnapshot> streamDataCollection() {
    return ref.snapshots();
  }

  // Lấy document từ collection dựa trên ID
  Future<DocumentSnapshot> getDocumentById(String id) {
    return ref.doc(id).get();
  }

  // Xóa document từ collection dựa trên ID
  Future<String?> removeDocument(String id) async {
    try {
      await ref.doc(id).delete();
      logSuccess('Xóa data thành công: $pathCollection');
      return null;
    } catch (e) {
      logSuccess('Xóa dữ liệu thất bại: $pathCollection');
      return 'Xóa dữ liệu thất bại';
    }
  }

  // Thêm document vào collection
  Future<String?> addDocument(Map data, {File? file, String? customID}) async {
    if (file != null) {
      String pathFile =
          '$pathCollection/${DateTime.now()}_${basename(file.path)}';

      try {
        String url = await _uploadFile(file, pathFile: pathFile);
        data['img'] = url;
        logSuccess('Upload file thành công: $url');
      } catch (e) {
        logError('Upload file không thành công: $e');
      }
    }
    // Thêm dữ liệu vào Firestore
    try {
      Map<String, Object> newData = Map.from({
        ...data,
        ...{FieldName.createDate: DateTime.now()}
      });
      if (customID == null) {
        ref.add(newData);
      } else {
        ref.doc(customID).set(newData);
      }

      logSuccess('Thêm data thành công vào bảng $pathCollection');
      return null;
    } catch (e) {
      logError('Thêm data thất bại: $e');
      return 'Đã có lỗi xãy ra';
    }
  }

  // Cập nhật document trong collection dựa trên ID
  Future<String?> updateDocument(Map data, String id, {File? file}) async {
    try {
      // Nếu có file được đính kèm, xóa file cũ và upload file mới
      if (file != null) {
        try {
          String currentDirectory =
              '$pathCollection/${FirebaseStorage.instance.refFromURL(data['img'] as String).name}';
          await storage.ref().child(currentDirectory).delete();

          String pathFile =
              '$pathCollection/${DateTime.now()}_${basename(file.path)}';
          String url = await _uploadFile(file, pathFile: pathFile);
          data['img'] = url;
          data[FieldName.updateDate] = DateTime.now();
          logSuccess('Cập nhật ảnh mới thành công');
        } catch (e) {
          logError(
              'Cập nhât ảnh mới thất bại: Có thể do đường dẫn ảnh (img) không có trong data $e');
        }
      }
      await ref.doc(id).update(Map.from(data));
      return null;
    } catch (e) {
      logError('Có lỗi xãy ra khi cập nhật thông tin: $e');
      return 'Có lỗi xãy ra khi cập nhật thông tin';
    }
  }

  // Tải lên một tệp vào Firebase Storage và trả về URL tải xuống của tệp đã tải lên
  Future<String> _uploadFile(File file, {required String pathFile}) async {
    UploadTask uploadTask = storage.ref(pathFile).putFile(file);
    String url = await (await uploadTask).ref.getDownloadURL();
    return url;
  }
}
