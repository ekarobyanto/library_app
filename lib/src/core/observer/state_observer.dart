import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class StateObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log('onCreate(${bloc.runtimeType})');
    super.onCreate(bloc);
  }

  @override
  void onTransition(
    Bloc<dynamic, dynamic> bloc,
    Transition<dynamic, dynamic> transition,
  ) {
    super.onTransition(bloc, transition);
    log('onTransition(${bloc.runtimeType}, $transition)');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}
