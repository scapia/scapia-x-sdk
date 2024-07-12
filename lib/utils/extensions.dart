import 'package:dio/dio.dart';

extension StringExt on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;

  bool get isNotNullOrEmpty => !isNullOrEmpty;
}

extension ListExt<T> on List<T> {
  T? firstWhereOrNull(bool Function(T element) test) {
    for (var element in this) {
      if (test(element)) return element;
    }
    return null;
  }
}


extension RequestOptionsExt on RequestOptions{
  String get url => baseUrl + path;
}
