import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {

  final Color buttonColor;
  final VoidCallback handleClick;
  final String buttonTitle;

  const RoundedButton({super.key, required this.buttonColor, required this.handleClick, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        elevation: 5.0,
        color: buttonColor,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: handleClick,
          minWidth: 200.0,
          height: 42.0,
          child: Text(buttonTitle),
        ),
      ),
    );
  }
}
