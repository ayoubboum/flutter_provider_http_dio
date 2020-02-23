import 'package:flutter/material.dart';

enum ViewState { LOADING, LOADED, NOT_LOADED }

class BaseState extends ChangeNotifier {
  ViewState _viewState = ViewState.NOT_LOADED;

  ViewState get viewState => _viewState;

  void setState(ViewState viewState) {
    _viewState = viewState;
    notifyListeners();
  }
}
