import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_show/ui/home/views/menu_button.dart';

import '../../../common/utils/constants.dart';

class AnimateMenuButton extends StatefulWidget {
  final Color? color;
  final MainAxisAlignment? mainAxisAlignment;
  final Radius? topRight;
  final Radius? topLeft;
  final Radius? bottomRight;
  final Radius? bottomLeft;
  final Offset? beginAnimation;
  final Offset? endAnimation;
  final String? image;
  final String? title;
  final double? scaleImage;
  final Function() onTap;

  const AnimateMenuButton({
    Key? key,
    this.color,
    this.mainAxisAlignment,
    this.topRight,
    this.topLeft,
    this.bottomRight,
    this.bottomLeft,
    this.beginAnimation,
    this.endAnimation,
    this.image,
    this.title,
    this.scaleImage,
    required this.onTap,
  }) : super(key: key);

  @override
  createState() => AnimateMenuButtonState();
}

class AnimateMenuButtonState extends State<AnimateMenuButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<Offset>(
      begin: widget.beginAnimation ?? const Offset(0, 0),
      end: widget.endAnimation ?? const Offset(0, 0),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.stop();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _animation,
      child: MenuButton(
        color: widget.color,
        topLeft: widget.topLeft,
        bottomLeft: widget.bottomLeft,
        topRight: widget.topRight,
        bottomRight: widget.bottomRight,
        mainAxisAlignment: widget.mainAxisAlignment,
        image: widget.image,
        title: widget.title,
        scaleImage: widget.scaleImage,
        onTap: widget.onTap,
      ),
    );
  }
}
