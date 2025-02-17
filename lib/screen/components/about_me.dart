import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      width: double.infinity,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person_outline, size: 24),
                      const SizedBox(width: 12),
                      Text(
                        'Mas sobre mí',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  RichText(
                    text: TextSpan(
                      style: GoogleFonts.inter(
                        fontSize: 18,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                      children: [
                        const TextSpan(
                          text:
                              'Me llamo Miguel Ángel pero mis amigos me llaman midu. Empecé en la programación con un Amstrad, tenía 10 años. Actualmente estoy ',
                        ),
                        TextSpan(
                          text:
                              'liderando equipos de desarrollo en multinacionales',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        const TextSpan(
                            text: '.\n\nAlgunos de mis éxitos incluyen '),
                        TextSpan(
                          text:
                              'colaborar con Mozilla para el desarrollo de las primeras apps en su sistema FirefoxOS',
                          style: TextStyle(
                            fontFamily: GoogleFonts.firaCode().fontFamily,
                            backgroundColor: Colors.white.withOpacity(0.1),
                          ),
                        ),
                        const TextSpan(
                          text:
                              '. Aunque hoy está desaparecido fue un gran avance en el mundo del desarrollo web.\n\nComo creador de contenido, cuento con ',
                        ),
                        TextSpan(
                          text:
                              'el canal de habla hispana más visto del mundo en la categoría de Software & Game Development en Twitch',
                          style:
                              TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        const TextSpan(
                          text:
                              '. Mi objetivo es mejorar la empleabilidad de la comunidad hispana y el acceso a contenido de calidad.',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
