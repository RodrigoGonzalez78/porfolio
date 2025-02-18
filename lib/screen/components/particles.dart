import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class ParticleBackground extends StatefulWidget {
  final Widget child;

  const ParticleBackground({Key? key, required this.child}) : super(key: key);

  @override
  _ParticleBackgroundState createState() => _ParticleBackgroundState();
}

class _ParticleBackgroundState extends State<ParticleBackground>
    with SingleTickerProviderStateMixin {
  ui.Image? particleImage;
  late AnimationController _controller;
  List<Particle>? particles;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    _loadParticleImage();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _loadParticleImage() async {
    final image = await createParticleImage();
    setState(() {
      particleImage = image;
    });
  }

  void _initializeParticles(Size size) {
    if (particles == null) {
      particles = List.generate(30, (_) => Particle(particleImage!, size));
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = Size(constraints.maxWidth, constraints.maxHeight);
        _initializeParticles(size);
        return Stack(
          children: [
            if (particleImage != null && particles != null)
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: ParticlePainter(
                      particles: particles!,
                      particleColor: Color(0xFFFFD700).withOpacity(0.2),
                    ),
                    size: size,
                  );
                },
              ),
            widget.child,
          ],
        );
      },
    );
  }
}

class ParticlePainter extends CustomPainter {
  final List<Particle> particles;
  final Color particleColor;

  ParticlePainter({
    required this.particles,
    required this.particleColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = particleColor;

    for (var particle in particles) {
      particle.update(size);
      canvas.drawImage(particle.image, particle.position, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class Particle {
  late Offset position;
  late double speed;
  late double radius;
  final ui.Image image;

  Particle(this.image, Size size) {
    reset(size);
  }

  void reset(Size size) {
    position = Offset(
      Random().nextDouble() * size.width,
      Random().nextDouble() * size.height,
    );
    speed = 1 + Random().nextDouble() * 2;
    radius = 1 + Random().nextDouble() * 2;
  }

  void update(Size size) {
    position = Offset(position.dx, position.dy - speed);
    if (position.dy < 0) {
      reset(size);
    }
  }
}

Future<ui.Image> createParticleImage() async {
  final recorder = ui.PictureRecorder();
  final canvas = Canvas(recorder);
  final size = Size(8, 8);
  final paint = Paint()..color = Colors.white;

  canvas.drawCircle(size.center(Offset.zero), 3, paint);

  final picture = recorder.endRecording();
  return await picture.toImage(size.width.toInt(), size.height.toInt());
}
