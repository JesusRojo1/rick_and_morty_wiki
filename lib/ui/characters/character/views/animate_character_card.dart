import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty_show/ui/characters/character/views/character_data_card.dart';
import 'package:rick_and_morty_show/ui/home/views/menu_button.dart';

class AnimateCharacterCard extends StatefulWidget {
  final Color? color;
  final MainAxisAlignment? mainAxisAlignment;
  final Radius? topRight;
  final Radius? topLeft;
  final Radius? bottomRight;
  final Radius? bottomLeft;
  final Offset? beginAnimation;
  final Offset? endAnimation;
  final String? name;
  final String? origin;
  final String? gender;
  final String? status;
  final String? specie;
  final String? type;

  const AnimateCharacterCard({
    Key? key,
    this.color,
    this.mainAxisAlignment,
    this.topRight,
    this.topLeft,
    this.bottomRight,
    this.bottomLeft,
    this.beginAnimation,
    this.endAnimation,
    this.name,
    this.origin,
    this.gender,
    this.status,
    this.specie,
    this.type,
  }) : super(key: key);

  @override
  createState() => AnimateCharacterCardState();
}

class AnimateCharacterCardState extends State<AnimateCharacterCard>
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
      child: CharacterDataCard(
        name: widget.name,
        status: widget.status,
        specie: widget.specie,
        type: widget.type,
        gender: widget.gender,
        origin: widget.origin,
      ),
    );
  }
}
