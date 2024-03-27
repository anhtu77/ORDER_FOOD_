import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'extension.dart';

//Lấy giá trị từ map
extension Find<K, V, R> on Map<K, V> {
  // Trả về giá trị chuỗi được liên kết với [key] chỉ định, áp dụng hàm [cast] đã cung cấp cho nó.
  // Nếu khóa không tồn tại trong map, [defaultValue] sẽ được trả về.
  R find(K key, R Function(String value) cast, {Object? defaultValue}) {
    try {
      final value = this[key];
      if (value != null) {
        return cast(value.toString());
      } else {
        if (defaultValue != null) {
          return cast(defaultValue.toString());
        }
      }
    } catch (_) {
      return cast(defaultValue.toString());
    }
    return cast(defaultValue.toString());
  }

  // Trả về giá trị được liên kết với [key] chỉ định, áp dụng hàm [cast] đã cung cấp cho nó, xem xét loại dữ liệu của nó.
  // Nếu khóa không tồn tại trong map hoặc không phải là kiểu dữ liệu mong muốn, [defaultValue] sẽ được trả về.
  R findData<T>(K key, R Function(T value) cast, {Object? defaultValue}) {
    R defaultTemp = cast(defaultValue as T);
    try {
      final value = this[key];
      if (value != null && value is T) {
        return cast(value as T);
      } else {
        if (defaultValue != null) {
          return defaultTemp;
        }
      }
    } catch (_) {
      return defaultTemp;
    }
    return defaultTemp;
  }
}

class Methods {
  Methods._();
  // Lấy giá trị kiểu double từ map [data] sử dụng [fieldName].
  // Nếu trường không tồn tại, hoặc không thể chuyển đổi thành double, [defaultValue] sẽ được trả về.
  static double getDouble(Map data, String fieldName,
      {double defaultValue = 0.0}) {
    return data.find(fieldName, (value) => double.parse(value),
        defaultValue: defaultValue);
  }

  // Lấy giá trị kiểu dynamic từ map [data] sử dụng [fieldName].
  // Nếu trường không tồn tại, hoặc không thể chuyển đổi thành int, [defaultValue] sẽ được trả về.
  static dynamic getMap(Map data, String fieldName, {dynamic defaultValue}) {
    return data.findData(fieldName, (value) => value,
        defaultValue: defaultValue);
  }

  // Lấy giá trị kiểu int từ map [data] sử dụng [fieldName], làm tròn giá trị nếu cần.
  // Nếu trường không tồn tại, hoặc không thể chuyển đổi thành int, [defaultValue] sẽ được trả về.
  static int getInt(Map data, String fieldName, {int defaultValue = 0}) {
    return data.find(fieldName, (value) => double.parse(value).toInt(),
        defaultValue: defaultValue);
  }

  // Lấy giá trị kiểu int từ map [data] sử dụng [fieldName], làm tròn giá trị nếu cần.
  // Nếu trường không tồn tại, hoặc không thể chuyển đổi thành int, [defaultValue] sẽ được trả về.
  static int getIntRound(Map data, String fieldName, {int defaultValue = 0}) {
    return data.find(fieldName, (value) => double.parse(value).round(),
        defaultValue: defaultValue);
  }

  // Lấy giá trị chuỗi từ map [data] sử dụng [fieldName].
  // Nếu trường không tồn tại, [defaultValue] sẽ được trả về.
  static String getString(Map data, String fieldName,
      {String defaultValue = ''}) {
    return data.find(fieldName, (value) => value, defaultValue: defaultValue);
  }

  // Lấy giá trị boolean từ map [data] sử dụng [fieldName].
  // Nếu trường không tồn tại, [defaultValue] sẽ được trả về.
  static bool getBool(Map data, String fieldName, {bool defaultValue = false}) {
    return data.find(fieldName, (value) {
      if (value == 'true' || value == '1') {
        return true;
      }
      return false;
    });
  }

  // Lấy chuỗi định dạng giá của món hàng trong đồng Việt Nam (VND) từ map [data] sử dụng [fieldName].
  // Nếu trường không tồn tại, [defaultValue] sẽ được trả về.
  static String getPriceVND(Map data, String fieldName,
      {bool defaultValue = false}) {
    return data.find(fieldName, (value) {
      return value.toVND();
    });
  }

  // Lấy giá trị kiểu DateTime từ map [data] sử dụng [fieldName].
  // Nếu trường không tồn tại, hoặc không phải kiểu DateTime, [defaultValue] sẽ được trả về.
  static DateTime getDateTime(Map data, String fieldName,
      {DateTime? defaultValue}) {
    return data.findData(fieldName, (value) {
      if (value is Timestamp) {
        return value.toDate();
      }
    }, defaultValue: defaultValue ?? DateTime(1, 1, 1, 1, 1));
  }

  // Chuyển đổi đối tượng DateTime đã cho thành chuỗi định dạng bằng [defaultFormat].
  static String convertTime(DateTime dateTime,
      {String defaultFormat = 'yyyy-MM-dd HH:mm:ss'}) {
    return DateFormat(defaultFormat).format(dateTime);
  }

  // Lấy giá trị list từ map [data] sử dụng [fieldName].
  // Nếu trường không tồn tại, danh sách trống sẽ được trả về.
  static List getList(Map data, String fieldName) {
    return data.findData(fieldName, (value) => value, defaultValue: []);
  }

  // Chuyển đổi giá trị chuỗi từ map [data] sử dụng [fieldName] thành kiểu int.
  static int convertToInt(Map data, String fieldName) {
    return data.find(
        fieldName, (value) => value.replaceAll(RegExp(r'[^0-9]'), ''));
  }
}
