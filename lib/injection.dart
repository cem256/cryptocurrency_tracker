import 'dart:async';

import 'package:crypto_app/injection.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;

@InjectableInit()
FutureOr<void> initDependencies() => getIt.init();
