import 'package:flutter/material.dart';

class KerentLoadingScreen extends StatefulWidget {
  const KerentLoadingScreen({Key? key}) : super(key: key);

  @override
  State<KerentLoadingScreen> createState() => _KerentLoadingScreenState();
}

class _KerentLoadingScreenState extends State<KerentLoadingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.95,
      end: 1.05,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _opacityAnimation = Tween<double>(
      begin: 0.8,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E1E1E),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Opacity(
                  opacity: _opacityAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: CustomPaint(
                        painter: ExactKerentLogoPainter(),
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 24),
            const Text(
              'Kerent',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 3,
            ),
          ],
        ),
      ),
    );
  }
}

class ExactKerentLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Phone - adjusted proportions and position
    final phonePath = Path();
    final phoneWidth = size.width * 0.25;  // Made phone smaller
    final phoneHeight = size.width * 0.4;   // Adjusted height ratio
    final phoneX = size.width * 0.2;        // Moved more to the left
    final phoneY = size.height * 0.2;       // Adjusted vertical position

    phonePath.addRRect(
      RRect.fromRectAndRadius(
        Rect.fromLTWH(phoneX, phoneY, phoneWidth, phoneHeight),
        Radius.circular(size.width * 0.03),  // Smaller corner radius
      ),
    );

    // Camera dots - adjusted position and size
    final dotPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Arranged dots in 2x2 grid
    final dotSize = size.width * 0.02;
    final dotSpacing = size.width * 0.03;
    final dotsX = phoneX + phoneWidth * 0.7;
    final dotsY = phoneY + phoneHeight * 0.1;

    // Draw 4 dots in a square pattern
    canvas.drawCircle(Offset(dotsX, dotsY), dotSize, dotPaint);
    canvas.drawCircle(Offset(dotsX + dotSpacing, dotsY), dotSize, dotPaint);
    canvas.drawCircle(Offset(dotsX, dotsY + dotSpacing), dotSize, dotPaint);
    canvas.drawCircle(Offset(dotsX + dotSpacing, dotsY + dotSpacing), dotSize, dotPaint);

    // Curved line - adjusted curve and thickness
    final curvePaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.15  // Made line thicker
      ..strokeCap = StrokeCap.round;

    final curvePath = Path();
    curvePath.moveTo(phoneX + phoneWidth * 0.5, phoneY + phoneHeight);
    curvePath.quadraticBezierTo(
      size.width * 0.4,    // Control point X
      size.height * 0.9,   // Control point Y
      size.width * 0.8,    // End point X
      size.height * 0.4,   // End point Y - Adjusted for steeper curve
    );

    // Circle - adjusted size and position
    final circlePath = Path()
      ..addOval(Rect.fromCircle(
        center: Offset(size.width * 0.85, size.height * 0.2),  // Moved circle
        radius: size.width * 0.08,  // Adjusted circle size
      ));

    // Draw all elements
    canvas.drawPath(phonePath, paint);
    canvas.drawPath(curvePath, curvePaint);
    canvas.drawPath(circlePath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}