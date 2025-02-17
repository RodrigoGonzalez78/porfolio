import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Certifications extends StatelessWidget {
  const Certifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.verified_outlined, size: 24),
              const SizedBox(width: 12),
              Text(
                'Certificaciones',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Wrap(
            spacing: 24,
            runSpacing: 24,
            children: [
              CertificationCard(
                title: 'AWS Certified Solutions Architect',
                institution: 'Amazon Web Services',
                date: 'Diciembre 2023',
                description:
                    'Diseño de arquitecturas distribuidas escalables y de alta disponibilidad en AWS.',
                icon: FontAwesomeIcons.aws,
              ),
              CertificationCard(
                title: 'Google Cloud Professional Developer',
                institution: 'Google Cloud',
                date: 'Octubre 2023',
                description:
                    'Desarrollo y despliegue de aplicaciones nativas en la nube utilizando Google Cloud Platform.',
                icon: FontAwesomeIcons.google,
              ),
              CertificationCard(
                title: 'Microsoft Certified: Azure Developer Associate',
                institution: 'Microsoft',
                date: 'Agosto 2023',
                description:
                    'Diseño, construcción y mantenimiento de soluciones en la nube de Microsoft Azure.',
                icon: FontAwesomeIcons.microsoft,
              ),
              CertificationCard(
                title: 'Certified Kubernetes Administrator (CKA)',
                institution: 'Cloud Native Computing Foundation',
                date: 'Mayo 2023',
                description:
                    'Administración y operación de clusters de Kubernetes en producción.',
                icon: FontAwesomeIcons.docker,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CertificationCard extends StatefulWidget {
  final String title;
  final String institution;
  final String date;
  final String description;
  final IconData icon;

  const CertificationCard({
    super.key,
    required this.title,
    required this.institution,
    required this.date,
    required this.description,
    required this.icon,
  });

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 300,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isHovered
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isHovered ? Theme.of(context).primaryColor : Colors.white24,
            width: 2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: FaIcon(
                    widget.icon,
                    color: Theme.of(context).primaryColor,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.institution,
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      Text(
                        widget.date,
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.white54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              widget.title,
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              widget.description,
              style: GoogleFonts.inter(
                fontSize: 14,
                color: Colors.white70,
                height: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
