import 'package:flutter/material.dart';

class Education extends StatelessWidget {
  const Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      width: double.infinity,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 800),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.school_outlined, size: 24),
                const SizedBox(width: 12),
                Text(
                  'Educación',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
            const SizedBox(height: 32),
            const EducationItem(
              title: 'Licenciatura en Sistemas de Información',
              institution: 'Universidad Nacional del Nordeste',
              period: 'En curso',
              description:
                  'Formación integral en ciencias de la computación, algoritmos, estructuras de datos y desarrollo de software.',
              showMoreLink: false,
            ),
            const EducationItem(
              title: 'Analista Programador Universitario',
              institution: 'Universidad Nacional del Nordeste',
              period: '2021-2025',
              description:
                  'Formación integral en ciencias de la computación, algoritmos, estructuras de datos y desarrollo de software.',
              showMoreLink: false,
            ),
            const EducationItem(
              title: 'Técnico en Informática Personal y Profecional',
              institution: 'Escuela Técnica Ita Ibate',
              period: '2012 - 2020',
              description:
                  'Me introdujo al mundo de la computación, aprendiendo los conceptos básicos de hardware y software.',
              showMoreLink: false,
            ),
          ],
        ),
      ),
    );
  }
}

class EducationItem extends StatefulWidget {
  final String title;
  final String institution;
  final String period;
  final String description;
  final bool showMoreLink;

  const EducationItem({
    super.key,
    required this.title,
    required this.institution,
    required this.period,
    required this.description,
    required this.showMoreLink,
  });

  @override
  State<EducationItem> createState() => _EducationItemState();
}

class _EducationItemState extends State<EducationItem> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 32),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: 2,
                    color: Colors.white24,
                  ),
                ),
              ],
            ),
            const SizedBox(width: 24),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.institution,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.period,
                    style: const TextStyle(color: Colors.white54),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      color: Colors.white70,
                      height: 1.6,
                    ),
                  ),
                  if (widget.showMoreLink) ...[
                    const SizedBox(height: 16),
                    MouseRegion(
                      onEnter: (_) => setState(() => isHovered = true),
                      onExit: (_) => setState(() => isHovered = false),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Saber más',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Theme.of(context).primaryColor,
                              size: 16,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
