import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:porfolio/utils/utils.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 120, 32, 64),
      child: Column(
        children: [
          const SizedBox(height: 24),
          Text(
            'Hola, soy Rodrigo',
            style: Theme.of(context).textTheme.headlineLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.inter(fontSize: 16, color: Colors.white70),
              children: [
                const TextSpan(text: 'Ingeniero de Software enfocado en el '),
                TextSpan(
                  text: 'Desarrollo Mobil y Backend',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                const TextSpan(text: ' de Corrientes, Argentina 🇦🇷'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Especializado en el desarrollo de aplicaciones Apps únicas.',
            style: TextStyle(fontSize: 16, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 16,
                children: [
                  HoverButton(
                    text: 'Contáctame',
                    icon: Icons.mail_outline,
                    isPrimary: true,
                    onPressed: () {
                      launchEmail(
                        'gonzlrodrigo@gmail.com',
                        subject: 'Consulta',
                        body: 'Hola, quiero más información sobre...',
                      );
                    },
                  ),
                  HoverButton(
                    text: 'LinkedIn',
                    icon: FontAwesomeIcons.linkedin,
                    isPrimary: false,
                    onPressed: () {
                      launchLink(
                          'https://www.linkedin.com/in/rodrigo-gonzalez-developer/');
                    },
                  ),
                  HoverButton(
                    text: 'Github',
                    icon: FontAwesomeIcons.github,
                    isPrimary: false,
                    onPressed: () {
                      launchLink('https://github.com/RodrigoGonzalez78');
                    },
                  ),
                  HoverButton(
                    text: 'PlayStore',
                    icon: FontAwesomeIcons.googlePlay,
                    isPrimary: false,
                    onPressed: () {
                      launchLink(
                          'https://play.google.com/store/apps/dev?id=5093230411941529525&hl=es_AR');
                    },
                  ),
                  HoverButton(
                    text: 'HackerRank',
                    icon: FontAwesomeIcons.hackerrank,
                    isPrimary: false,
                    onPressed: () {
                      launchLink(
                          'https://www.hackerrank.com/profile/gonzlrodrigo');
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}

class HoverButton extends StatefulWidget {
  final String text;
  final IconData icon;
  final bool isPrimary;
  final VoidCallback onPressed;

  const HoverButton({
    super.key,
    required this.text,
    required this.icon,
    required this.isPrimary,
    required this.onPressed,
  });

  @override
  State<HoverButton> createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: ElevatedButton.icon(
        onPressed: widget.onPressed,
        icon: Icon(widget.icon),
        label: Text(widget.text),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.isPrimary ? Colors.white : Colors.transparent,
          foregroundColor: widget.isPrimary ? Colors.black : Colors.white,
          side: widget.isPrimary ? null : const BorderSide(color: Colors.white),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          elevation: isHovered ? 8 : 0,
          shadowColor: widget.isPrimary
              ? Colors.white.withOpacity(0.5)
              : Colors.transparent,
        ),
      ),
    );
  }
}
