import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';

enum CatState { sleepy, hungry, energetic, boring }

sealed class CatCaringEvent {}

class CatCaringFeedingEvent extends CatCaringEvent {}

class CatCaringPlayingEvent extends CatCaringEvent {}


class CatCaringSleepEvent extends CatCaringEvent {}

class CatCaringBloc extends Bloc<CatCaringEvent, CatState> {
  CatCaringBloc() : super(CatState.energetic) {
    on<CatCaringFeedingEvent>((event, emit) {
      if (Random().nextBool()) {
        emit(CatState.sleepy);
      } else {
        emit(CatState.energetic);
      }
    });
    on<CatCaringPlayingEvent>((event, emit) {
      if (Random().nextBool()) {
        emit(CatState.sleepy);
      } else {
        emit(CatState.energetic);
      }
    });
    on<CatCaringSleepEvent>((event, emit) {
      final ran = Random().nextInt(5);
      if (ran == 1) {
        emit(CatState.boring);
      } else if (ran < 3) {
        emit(CatState.hungry);
      } else {
        emit(CatState.energetic);
      }
    });
  }
}
