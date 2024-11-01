import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'screen_state.dart';
abstract class ViewModel<State extends ScreenState,ScreenEvent> extends Cubit<State> with ChangeNotifier{
  ViewModel(super.initialState);
  onEvent(ScreenEvent event);
}
