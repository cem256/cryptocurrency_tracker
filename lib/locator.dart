import 'dart:async';

import 'package:cryptocurrency_tracker/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()
abstract final class Locator {
  static final instance = GetIt.instance;

  static FutureOr<void> locateServices() => instance.init();
}
