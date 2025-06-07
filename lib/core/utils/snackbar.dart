import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

void showSnackbar({required BuildContext context, required String text}) {
  showToast(
    text,
    context: context,
    alignment: Alignment.topCenter,
    backgroundColor: Colors.white,
    animation: StyledToastAnimation.slideFromTop,
    reverseAnimation: StyledToastAnimation.fade,
    animDuration: const Duration(milliseconds: 500),
    curve: Curves.fastOutSlowIn,
    reverseCurve: Curves.fastOutSlowIn,
    fullWidth: true,
    position: StyledToastPosition.top,
    toastHorizontalMargin: 0,
  );
}
