import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

extension ScrollControllerX on ScrollController {
  void addPagination(
    VoidCallback callback,
  ) {
    addListener(() {
      if (_isBottom()) callback();
    });
  }

  bool _isBottom() {
    if (!hasClients) return false;
    final maxScroll = position.maxScrollExtent;
    final currentScroll = position.pixels;
    return currentScroll >= (maxScroll * 0.8) &&
        position.userScrollDirection == ScrollDirection.reverse;
  }

  void scrollToBottom() {
    jumpTo(position.maxScrollExtent);
  }

  void scrollToTop() {
    jumpTo(0);
  }
}
