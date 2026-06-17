import 'package:flutter/material.dart';

class SocialButton extends StatelessWidget {
  final IconData? icon;
  final Color? iconColor;
  final Widget? child;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    this.icon,
    this.iconColor,
    this.child,
    required this.onTap,
  }) : assert(child != null || icon != null);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 58,
        height: 58,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 10,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Center(child: child ?? Icon(icon, color: iconColor, size: 40)),
      ),
    );
  }
}

class GoogleLogo extends StatelessWidget {
  const GoogleLogo({super.key, this.size = 30});

  final double size;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: const _GoogleLogoPainter(),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  const _GoogleLogoPainter();

  static const Color _blue = Color(0xFF4285F4);
  static const Color _red = Color(0xFFEA4335);
  static const Color _yellow = Color(0xFFFBBC05);
  static const Color _green = Color(0xFF34A853);

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / 18;

    canvas.save();
    canvas.scale(scale, scale);

    void drawPath(Path path, Color color) {
      canvas.drawPath(path, Paint()..color = color);
    }

    drawPath(
      Path()
        ..moveTo(9, 3.58)
        ..cubicTo(10.321, 3.58, 11.508, 4.034, 12.44, 4.925)
        ..lineTo(15.022, 2.345)
        ..cubicTo(13.463, 0.891, 11.426, 0, 9, 0)
        ..cubicTo(5.482, 0, 2.438, 2.017, 0.957, 4.961)
        ..lineTo(3.964, 7.293)
        ..cubicTo(4.672, 5.165, 6.656, 3.58, 9, 3.58)
        ..close(),
      _red,
    );

    drawPath(
      Path()
        ..moveTo(3.964, 10.707)
        ..cubicTo(3.784, 10.167, 3.682, 9.59, 3.682, 9)
        ..cubicTo(3.682, 8.41, 3.784, 7.833, 3.964, 7.293)
        ..lineTo(3.964, 4.961)
        ..lineTo(0.957, 4.961)
        ..cubicTo(0.347, 6.176, 0, 7.55, 0, 9)
        ..cubicTo(0, 10.45, 0.348, 11.824, 0.957, 13.039)
        ..lineTo(3.964, 10.707)
        ..close(),
      _yellow,
    );

    drawPath(
      Path()
        ..moveTo(9, 18)
        ..cubicTo(11.43, 18, 13.467, 17.194, 14.956, 15.816)
        ..lineTo(12.048, 13.558)
        ..cubicTo(11.242, 14.098, 10.211, 14.417, 9, 14.417)
        ..cubicTo(6.656, 14.417, 4.672, 12.835, 3.964, 10.707)
        ..lineTo(0.957, 10.707)
        ..lineTo(0.957, 13.039)
        ..cubicTo(2.438, 15.983, 5.482, 18, 9, 18)
        ..close(),
      _green,
    );

    drawPath(
      Path()
        ..moveTo(17.64, 9.2)
        ..cubicTo(17.64, 8.563, 17.583, 7.949, 17.476, 7.36)
        ..lineTo(9, 7.36)
        ..lineTo(9, 10.841)
        ..lineTo(13.844, 10.841)
        ..cubicTo(13.635, 11.966, 13.001, 12.919, 12.048, 13.558)
        ..lineTo(12.048, 15.816)
        ..lineTo(14.956, 15.816)
        ..cubicTo(16.658, 14.249, 17.64, 11.942, 17.64, 9.2)
        ..close(),
      _blue,
    );

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
