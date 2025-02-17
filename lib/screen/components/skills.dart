import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Skills extends StatelessWidget {
  const Skills({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.code, size: 24),
              const SizedBox(width: 12),
              Text(
                'Habilidades',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
          const SizedBox(height: 32),
          const Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              SkillCategory(
                skills: [
                  Skill(name: 'Android', icon: FontAwesomeIcons.android),
                  Skill(name: 'Flutter', icon: FontAwesomeIcons.flutter),
                  Skill(name: 'Dart', icon: FontAwesomeIcons.dartLang),
                  Skill(name: 'Golang', icon: FontAwesomeIcons.golang),
                  Skill(name: 'Python', icon: FontAwesomeIcons.python),
                  Skill(name: 'Java', icon: FontAwesomeIcons.java),
                  Skill(name: 'Docker', icon: FontAwesomeIcons.docker),
                  Skill(name: 'Python', icon: FontAwesomeIcons.python),
                  Skill(name: 'Java', icon: FontAwesomeIcons.java),
                  Skill(name: 'Docker', icon: FontAwesomeIcons.docker),
                  Skill(name: 'Python', icon: FontAwesomeIcons.python),
                  Skill(name: 'Java', icon: FontAwesomeIcons.java),
                  Skill(name: 'Docker', icon: FontAwesomeIcons.docker)
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SkillCategory extends StatelessWidget {
  final List<Skill> skills;

  const SkillCategory({
    super.key,
    required this.skills,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: skills,
          ),
        ],
      ),
    );
  }
}

class Skill extends StatefulWidget {
  final String name;
  final IconData icon;

  const Skill({
    super.key,
    required this.name,
    required this.icon,
  });

  @override
  State<Skill> createState() => _SkillState();
}

class _SkillState extends State<Skill> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isHovered
              ? Theme.of(context).primaryColor.withOpacity(0.1)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isHovered ? Theme.of(context).primaryColor : Colors.white24,
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              widget.icon,
              size: 16,
              color: isHovered ? Theme.of(context).primaryColor : Colors.white,
            ),
            const SizedBox(width: 8),
            Text(
              widget.name,
              style: GoogleFonts.inter(
                fontSize: 14,
                color:
                    isHovered ? Theme.of(context).primaryColor : Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
