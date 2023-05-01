import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flame/flame.dart';
import 'package:flutter/material.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    log(
      'onError(${bloc.runtimeType})',
      error: error,
      stackTrace: stackTrace,
    );
  }
}

Future<void> bootsrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  WidgetsFlutterBinding.ensureInitialized();

  // Makes the game full screen and landscape only.
  Flame.device.fullScreen();
  Flame.device.setLandscape();

  Bloc.observer = AppBlocObserver();

  runZonedGuarded<Future<void>>(() async {
    runApp(await builder());
  }, (error, stackTrace) => log(error.toString(), stackTrace: stackTrace));
}
