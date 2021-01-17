import 'dart:async';
import 'package:ferry_store/ferry_store.dart';

// This is a cache store to disable cache
class NilStore extends Store {
  @override
  void clear() {}

  @override
  void delete(String dataId) {}

  @override
  void deleteAll(Iterable<String> dataIds) {}

  @override
  Map<String, dynamic> get(String dataId) {
    return {};
  }

  @override
  Iterable<String> get keys => [];

  @override
  void put(String dataId, Map<String, dynamic> value) {}

  @override
  void putAll(Map<String, Map<String, dynamic>> data) {}

  @override
  Stream<Map<String, dynamic>> watch(String dataId) {
    return Stream.empty();
  }
}
