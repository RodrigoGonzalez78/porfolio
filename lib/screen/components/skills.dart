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
          const SkillCategory(
            skills: [
              Skill(name: 'Android', icon: FontAwesomeIcons.android),
              Skill(name: 'Flutter', icon: FontAwesomeIcons.flutter),
              Skill(name: 'Kotlin Multiplatform', icon: FontAwesomeIcons.k),
              Skill(name: 'Kotlin', icon: FontAwesomeIcons.k),
              Skill(name: 'Dart', icon: FontAwesomeIcons.dartLang),
              Skill(name: 'Golang', icon: FontAwesomeIcons.golang),
              Skill(name: 'Python', icon: FontAwesomeIcons.python),
              Skill(name: 'SQL', icon: FontAwesomeIcons.database),
              Skill(name: 'Docker', icon: FontAwesomeIcons.docker),
              Skill(name: 'Git', icon: FontAwesomeIcons.git),
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
          AnimatedSkillsWrap(skills: skills),
        ],
      ),
    );
  }
}

class AnimatedSkillsWrap extends StatefulWidget {
  final List<Skill> skills;

  const AnimatedSkillsWrap({super.key, required this.skills});

  @override
  _AnimatedSkillsWrapState createState() => _AnimatedSkillsWrapState();
}

class _AnimatedSkillsWrapState extends State<AnimatedSkillsWrap> {
  late List<bool> _isVisible = [];

  @override
  void initState() {
    super.initState();
    _isVisible = List.generate(widget.skills.length, (_) => false);
    _animateSkills();
  }

  void _animateSkills() async {
    for (int i = 0; i < widget.skills.length; i++) {
      await Future.delayed(Duration(milliseconds: 50 * i));
      if (mounted) {
        setState(() {
          _isVisible[i] = true;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(widget.skills.length, (index) {
        return AnimatedOpacity(
          duration: const Duration(milliseconds: 200),
          opacity: _isVisible[index] ? 1.0 : 0.0,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 200),
            offset: _isVisible[index] ? Offset.zero : const Offset(0, 0.5),
            child: widget.skills[index],
          ),
        );
      }),
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

class _SkillState extends State<Skill> with SingleTickerProviderStateMixin {
  bool isHovered = false;
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1, end: 1.1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() => isHovered = true);
        _controller.forward();
      },
      onExit: (_) {
        setState(() => isHovered = false);
        _controller.reverse();
      },
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: isHovered
                ? Theme.of(context).primaryColor.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color:
                  isHovered ? Theme.of(context).primaryColor : Colors.white24,
            ),
            boxShadow: isHovered
                ? [
                    BoxShadow(
                      color: Theme.of(context).primaryColor.withOpacity(0.3),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    )
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              AnimatedRotation(
                turns: isHovered ? 0.125 : 0,
                duration: const Duration(milliseconds: 200),
                child: FaIcon(
                  widget.icon,
                  size: 16,
                  color:
                      isHovered ? Theme.of(context).primaryColor : Colors.white,
                ),
              ),
              const SizedBox(width: 8),
              AnimatedDefaultTextStyle(
                duration: const Duration(milliseconds: 200),
                style: GoogleFonts.inter(
                  fontSize: isHovered ? 15 : 14,
                  fontWeight: isHovered ? FontWeight.bold : FontWeight.normal,
                  color:
                      isHovered ? Theme.of(context).primaryColor : Colors.white,
                ),
                child: Text(widget.name),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
