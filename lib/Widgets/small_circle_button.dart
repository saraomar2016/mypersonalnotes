import 'package:flutter/material.dart';

class SmallCircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SmallCircleButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Icon(icon, color: const Color(0xFF7E759B)),
      ),
    );
  }
}
