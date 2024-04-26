import 'package:flutter/cupertino.dart';

class FullscreenState with ChangeNotifier {
  bool _isFullscreen = false;

  bool get isFullscreen => _isFullscreen;

  void enterFullscreen() {
    _isFullscreen = true;
    notifyListeners();
  }

  void exitFullscreen() {
    _isFullscreen = false;
    notifyListeners();
  }
}
