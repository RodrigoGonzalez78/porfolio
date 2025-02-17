import 'package:flutter/material.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.code, size: 24),
              const SizedBox(width: 12),
              Text(
                'Proyectos',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(height: 32),
          LayoutBuilder(
            builder: (context, constraints) {
              return constraints.maxWidth > 800
                  ? const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ProjectCard(
                            title: 'SVGL - A beautiful library with SVG logos',
                            description:
                                'Biblioteca de logos SVG de las marcas más populares. +10K visitas al mes. +2K svgs descargados.',
                            imageUrl:
                                'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Captura%20desde%202025-02-16%2016-14-50-fMQ0icMjygMVZRH8bxpGrkbktig6lb.png',
                            technologies: ['Next.js', 'Tailwind CSS'],
                            hasCode: true,
                          ),
                        ),
                        SizedBox(width: 32),
                        Expanded(
                          child: ProjectCard(
                            title: 'AdventJS - Retos de programación',
                            description:
                                'Plataforma gratuita con retos de programación. Más de 1 millón de visitas en un mes. +50K retos completados.',
                            imageUrl:
                                'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Captura%20desde%202025-02-16%2016-14-50-fMQ0icMjygMVZRH8bxpGrkbktig6lb.png',
                            technologies: ['Next.js', 'Tailwind CSS'],
                            hasCode: false,
                          ),
                        ),
                      ],
                    )
                  : const Column(
                      children: [
                        ProjectCard(
                          title: 'SVGL - A beautiful library with SVG logos',
                          description:
                              'Biblioteca de logos SVG de las marcas más populares. +10K visitas al mes. +2K svgs descargados.',
                          imageUrl:
                              'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Captura%20desde%202025-02-16%2016-14-50-fMQ0icMjygMVZRH8bxpGrkbktig6lb.png',
                          technologies: ['Next.js', 'Tailwind CSS'],
                          hasCode: true,
                        ),
                        SizedBox(height: 32),
                        ProjectCard(
                          title: 'AdventJS - Retos de programación',
                          description:
                              'Plataforma gratuita con retos de programación. Más de 1 millón de visitas en un mes. +50K retos completados.',
                          imageUrl:
                              'https://hebbkx1anhila5yf.public.blob.vercel-storage.com/Captura%20desde%202025-02-16%2016-14-50-fMQ0icMjygMVZRH8bxpGrkbktig6lb.png',
                          technologies: ['Next.js', 'Tailwind CSS'],
                          hasCode: false,
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

class ProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final String imageUrl;
  final List<String> technologies;
  final bool hasCode;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.technologies,
    required this.hasCode,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        //transform: isHovered ? Matrix4.identity()translate(0, -8, 0) : Matrix4.identity(),
        child: Card(
          color: const Color(0xFF1A1F2E),
          elevation: isHovered ? 16 : 8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(12)),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.network(
                    widget.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      widget.description,
                      style: const TextStyle(
                        color: Colors.white70,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: [
                        ...widget.technologies.map((tech) => Chip(
                              label: Text(tech),
                              backgroundColor: Colors.white.withOpacity(0.1),
                            )),
                      ],
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        if (widget.hasCode)
                          OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.code),
                            label: const Text('Code'),
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 16,
                              ),
                            ),
                          ),
                        const SizedBox(width: 16),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.preview),
                          label: const Text('Preview'),
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
