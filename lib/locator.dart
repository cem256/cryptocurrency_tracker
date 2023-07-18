import 'dart:async';

import 'package:cryptocurrency_tracker/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

@InjectableInit()

/// [Locator] is responsible for locating and registering all the
/// services of the application.
abstract final class Locator {
  /// [GetIt] instance
  static final instance = GetIt.instance;

  /// Responsible for registering all the dependencies
  static FutureOr<void> locateServices() => instance.init();
}
