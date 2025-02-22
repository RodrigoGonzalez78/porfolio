import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:porfolio/utils/utils.dart';

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
                title: 'Go (Basic) Certificate',
                institution: 'HackerRank',
                date: 'Diciembre 2024',
                description:
                    'Cubre temas como características básicas del lenguaje Golang, estructuras de datos simples, matrices, mapas, tipos de datos e interfaces.',
                icon: FontAwesomeIcons.hackerrank,
                link: 'https://www.hackerrank.com/certificates/4ab62ad29073',
              ),
              CertificationCard(
                title: 'SQL (Basic) Certificate',
                institution: 'HackerRank',
                date: 'Diciembre 2024',
                description:
                    'Incluye consultas simples, relaciones y agregadores.',
                icon: FontAwesomeIcons.hackerrank,
                link: 'https://www.hackerrank.com/certificates/b93140f296c6',
              ),
              CertificationCard(
                title: 'Python (Basic) Certificate',
                institution: 'HackerRank',
                date: 'Diciembre 2024',
                description:
                    'Cubre temas como tipos escalares, operadores y flujo de control, cadenas, colecciones e iteración, modularidad, objetos y tipos y clases.',
                icon: FontAwesomeIcons.hackerrank,
                link: 'https://www.hackerrank.com/certificates/76b51c0f9dd9',
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
  final String link;

  const CertificationCard(
      {super.key,
      required this.title,
      required this.institution,
      required this.date,
      required this.description,
      required this.icon,
      required this.link});

  @override
  State<CertificationCard> createState() => _CertificationCardState();
}

class _CertificationCardState extends State<CertificationCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: GestureDetector(
        onTap: () {
          launchLink(widget.link);
        },
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
              color:
                  isHovered ? Theme.of(context).primaryColor : Colors.white24,
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
      ),
    );
  }
}
