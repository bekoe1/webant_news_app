import 'package:flutter/cupertino.dart';

class NavigationBarState {
  NavigationBarState._privateConstructor();

  static final NavigationBarState _instance =
      NavigationBarState._privateConstructor();

  factory NavigationBarState() {
    return _instance;
  }

  // ValueNotifier для отслеживания состояния
  final ValueNotifier<bool> _showNavigationBarNotifier =
      ValueNotifier<bool>(true);

  // Получение ValueNotifier
  ValueNotifier<bool> get showNavigationBarNotifier =>
      _showNavigationBarNotifier;

  // Метод для изменения состояния
  void setShowNavigationBar(bool value) {
    _showNavigationBarNotifier.value = value;
  }
}
