import 'dart:math';

import 'package:bloc_demo/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatCaringCubit extends Cubit<CatState> {
  /// {@macro brightness_cubit}
  CatCaringCubit() : super(CatState.energetic);
  onCatCaringFeedingEvent() {
    if (Random().nextBool()) {
      emit(CatState.sleepy);
    } else {
      emit(CatState.energetic);
    }
  }

  onCatCaringPlayingEvent() {
    if (Random().nextBool()) {
      emit(CatState.sleepy);
    } else {
      emit(CatState.energetic);
    }
  }

  onCatCaringSleepEvent() {
    final ran = Random().nextInt(5);
    if (ran == 1) {
      emit(CatState.boring);
    } else if (ran < 3) {
      emit(CatState.hungry);
    } else {
      emit(CatState.energetic);
    }
  }
}
