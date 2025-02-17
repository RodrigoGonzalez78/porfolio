import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

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
            'Hola, soy Gonzalez Rodrigo',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 16),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: GoogleFonts.inter(fontSize: 16, color: Colors.white70),
              children: [
                const TextSpan(text: '+15 años de experiencia. '),
                TextSpan(
                  text:
                      'Ingeniero de Software y Creador de Contenido sobre Programación',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
                const TextSpan(text: ' de Barcelona, España 🇪🇸'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          const Text(
            'Especializado en el desarrollo de aplicaciones web únicas.',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              HoverButton(
                text: 'Contáctame',
                icon: Icons.mail_outline,
                isPrimary: true,
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              HoverButton(
                text: 'LinkedIn',
                icon: FontAwesomeIcons.linkedin,
                isPrimary: false,
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              HoverButton(
                text: 'Github',
                icon: FontAwesomeIcons.github,
                isPrimary: false,
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              HoverButton(
                text: 'PlayStore',
                icon: FontAwesomeIcons.googlePlay,
                isPrimary: false,
                onPressed: () {},
              ),
              const SizedBox(width: 16),
              HoverButton(
                text: 'HackerRank',
                icon: FontAwesomeIcons.hackerrank,
                isPrimary: false,
                onPressed: () {},
              ),
            ],
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
