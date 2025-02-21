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
                      children: const [
                        TextSpan(
                          text:
                              'Me llamo Rodrigo Alejandro González. Comencé mi camino en la programación con Java en la secundaria, y más tarde me adentré en el desarrollo de videojuegos como hobby, utilizando Unity y C#.\n',
                        ),
                        TextSpan(
                          text:
                              'Hoy en día, me especializo en el desarrollo de aplicaciones móviles, desde el diseño hasta su publicación, aplicando buenas prácticas como Clean Architecture e inyección de dependencias. Me esfuerzo por mantenerme en constante aprendizaje, mejorando mis habilidades y desarrollando mis propios backends, adquiriendo conocimientos en APIs REST, bases de datos, arquitectura y redes, usando para esto Golang y Python.',
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
