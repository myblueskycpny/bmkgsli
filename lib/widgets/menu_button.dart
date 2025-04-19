import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final String imagePath;
  final VoidCallback onTap;

  const MenuButton({
    super.key,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: onTap,
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Image.asset(imagePath),
        ),
      ),
    );
  }
}
