import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;
  late Animation<double> _rotateAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _scaleAnimation = Tween<double>(
      begin: 0.8,
      end: 1.2,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _fadeAnimation = Tween<double>(
      begin: 0.5,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _rotateAnimation = Tween<double>(
      begin: 0,
      end: 0.1,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
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
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Animation
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return Transform.rotate(
                  angle: _rotateAnimation.value,
                  child: Transform.scale(
                    scale: _scaleAnimation.value,
                    child: FadeTransition(
                      opacity: _fadeAnimation,
                      child: Container(
                        width: 120,
                        height: 120,
                        child: CustomPaint(
                          painter: KerentLogoPainter(
                            color: Colors.white.withOpacity(_fadeAnimation.value),
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class KerentLogoPainter extends CustomPainter {
  final Color color;
  
  KerentLogoPainter({this.color = Colors.white});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint whitePaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final Paint blackPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.fill;

    // Kerentlogo body path
    final Path kerentlogoPath = Path();
    kerentlogoPath.moveTo(size.width * 0.28, size.height * 0.592);
    kerentlogoPath.cubicTo(
      size.width * 0.422, size.height * 0.716,
      size.width * 0.472, size.height * 0.876,
      size.width * 0.614, size.height * 0.333
    );
    kerentlogoPath.cubicTo(
      size.width * 0.654, size.height * 0.202,
      size.width * 0.791, size.height * 0.355,
      size.width * 0.773, size.height * 0.346
    );
    kerentlogoPath.cubicTo(
      size.width * 0.654, size.height * 0.283,
      size.width * 0.615, size.height * 0.573,
      size.width * 0.497, size.height * 0.728
    );
    kerentlogoPath.lineTo(size.width * 0.479, size.height * 0.746);
    kerentlogoPath.lineTo(size.width * 0.466, size.height * 0.758);
    kerentlogoPath.lineTo(size.width * 0.447, size.height * 0.764);
    kerentlogoPath.lineTo(size.width * 0.423, size.height * 0.758);
    kerentlogoPath.lineTo(size.width * 0.407, size.height * 0.750);
    kerentlogoPath.lineTo(size.width * 0.395, size.height * 0.737);
    kerentlogoPath.lineTo(size.width * 0.376, size.height * 0.716);
    kerentlogoPath.cubicTo(
      size.width * 0.310, size.height * 0.642,
      size.width * 0.28, size.height * 0.592,
      size.width * 0.28, size.height * 0.592
    );
    canvas.drawPath(kerentlogoPath, whitePaint);

    // Kerentlogo head (ellipse)
    final Rect headRect = Rect.fromLTWH(
      size.width * 0.522, 
      size.height * 0.214,
      size.width * 0.071,
      size.height * 0.080
    );
    canvas.drawOval(headRect, whitePaint);

    // Kerentlogo body rectangle
    final RRect bodyRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(
        size.width * 0.227,
        size.height * 0.384,
        size.width * 0.106,
        size.height * 0.176
      ),
      Radius.circular(size.width * 0.020)
    );
    canvas.drawRRect(bodyRect, whitePaint);

    // Eyes
    final double eyeRadius = size.width * 0.0067;
    final double eyeBlackRadius = size.width * 0.0067;

    // Right eye outer
    canvas.drawCircle(
      Offset(size.width * 0.313, size.height * 0.401),
      eyeRadius,
      whitePaint
    );
    // Right eye inner
    canvas.drawCircle(
      Offset(size.width * 0.313, size.height * 0.401),
      eyeBlackRadius,
      blackPaint
    );

    // Left eye outer
    canvas.drawCircle(
      Offset(size.width * 0.297, size.height * 0.401),
      eyeRadius,
      whitePaint
    );
    // Left eye inner
    canvas.drawCircle(
      Offset(size.width * 0.297, size.height * 0.401),
      eyeBlackRadius,
      blackPaint
    );

    // Bottom eyes
    canvas.drawCircle(
      Offset(size.width * 0.313, size.height * 0.418),
      eyeRadius,
      whitePaint
    );
    canvas.drawCircle(
      Offset(size.width * 0.313, size.height * 0.418),
      eyeBlackRadius,
      blackPaint
    );
    canvas.drawCircle(
      Offset(size.width * 0.297, size.height * 0.418),
      eyeBlackRadius / 2,
      blackPaint
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}