import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rick_and_morty_show/common/utils/global_widgets/global_input.dart';

class AnimateInputs extends StatefulWidget {

  final GlobalInput textFormField;

  const AnimateInputs({super.key, required this.textFormField});

  @override
  State<StatefulWidget> createState() => _AnimateInputsState();
}

class _AnimateInputsState extends State<AnimateInputs> {
  int _fieldCount = 0;
  bool _showButton = true;

  void _addFormField() {
    setState(() {
      _fieldCount++;
    });
    if (_fieldCount >= 3) {
      setState(() {
        _showButton = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 700), () => _addFormField());
    Future.delayed(const Duration(milliseconds: 1200), () => _addFormField());
    Future.delayed(const Duration(milliseconds: 1700), () => _addFormField());
  }

  @override
  Widget build(BuildContext context) {
    return
      AnimatedOpacity(
        opacity: _showButton ? 0.0 : 1.0,
        duration: const Duration(milliseconds: 1000),
        child: widget.textFormField,
      );
  }
}
