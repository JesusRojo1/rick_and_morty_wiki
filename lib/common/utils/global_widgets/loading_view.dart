import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingView {
  final BuildContext context;

  LoadingView(this.context);

  show() {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white.withOpacity(0.2),
            child: Center(
              child: Lottie.asset('assets/lottie/portal_loading.json'),
            ),
          ),
        );
      },
    );
  }

  dismiss() {
    Navigator.pop(context);
  }
}