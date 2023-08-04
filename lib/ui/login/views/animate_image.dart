import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnimatedImage extends StatefulWidget {
  final String imagePath;

  const AnimatedImage({super.key, required this.imagePath});

  @override
  State<StatefulWidget> createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  double _currentSize = 50.0;
  late double _originalSize;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller)
      ..addListener(() {
        setState(() {
          _currentSize = _originalSize * _animation.value;
        });
      });
    _controller.forward();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    var width = MediaQuery.sizeOf(context).width;
    _originalSize = width * 0.95;
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      widget.imagePath,
      width: _currentSize,
      height: _currentSize,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}