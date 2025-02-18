import 'package:flutter/material.dart';
import 'package:porfolio/screen/components/about_me.dart';
import 'package:porfolio/screen/components/certifications.dart';
import 'package:porfolio/screen/components/education.dart';
import 'package:porfolio/screen/components/experience.dart';
import 'package:porfolio/screen/components/header.dart';
import 'package:porfolio/screen/components/particles.dart';
import 'package:porfolio/screen/components/proyects.dart';
import 'package:porfolio/screen/components/skills.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        body: ParticleBackground(
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: const Column(
                  children: [
                    Header(),
                    AboutMe(),
                    Skills(),
                    Education(),
                    Certifications(),
                    Projects(),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}
