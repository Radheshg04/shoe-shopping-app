import 'package:flutter/material.dart';

class CoolButton extends StatefulWidget {
  const CoolButton({super.key});

  @override
  State<CoolButton> createState() => _CoolButtonState();
}

class _CoolButtonState extends State<CoolButton> {
  bool _isElevated = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _isElevated = !_isElevated;
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            height: 200,
            width: 200,
            decoration: BoxDecoration(
                // border: Border.all(width: 0, color: Colors.grey.shade400),
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(50),
                boxShadow: _isElevated
                    ? [
                        BoxShadow(
                          color: Colors.grey[600]!,
                          offset: const Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        BoxShadow(
                            color: Colors.grey.shade200,
                            offset: const Offset(-4, -4),
                            blurRadius: 15,
                            spreadRadius: 1)
                      ]
                    : null),
            child: const Icon(
              Icons.favorite,
              color: Colors.red,
              size: 40,
            ),
          ),
        ),
      ),
    );
  }
}
