import 'package:hive_flutter/adapters.dart';

abstract class CacheClientInterface<T, A extends TypeAdapter<T>> {
  String get boxName;
  int get typeId;
  A get adapter;
  Box<T>? _box;

  Future<void> init() async {
    _registerCacheAdapter();
    await _openBox();
  }

  Future<void> _openBox() async {
    if (!(_box?.isOpen ?? false)) {
      _box = await Hive.openBox(boxName);
    }
  }

  void _registerCacheAdapter() {
    if (!Hive.isAdapterRegistered(typeId)) {
      Hive.registerAdapter(adapter);
    }
  }

  Future<T?> get(String key) async {
    return _box?.get(key);
  }

  List<T>? getAll() {
    return _box?.values.toList();
  }

  Future<void> add(T item) async {
    await _box?.add(item);
  }

  Future<void> addList(List<T> items) async {
    await _box?.addAll(items);
  }

  Future<void> put(String key, T item) async {
    await _box?.put(key, item);
  }

  Future<void> putMultiple(Map<String, T> mapObject) async {
    await _box?.putAll(mapObject);
  }

  Future<void> delete(String key) async {
    await _box?.delete(key);
  }

  Future<void> deleteAt(int index) async {
    await _box?.deleteAt(index);
  }

  Future<void> deleteMultiple(List<T> keys) async {
    await _box?.deleteAll(keys);
  }

  Future<void> deleteAll() async {
    await _box?.clear();
  }
}