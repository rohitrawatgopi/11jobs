import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

bool _isDark(BuildContext context) =>
    Theme.of(context).brightness == Brightness.dark;

class HeroBadge extends StatelessWidget {
  final String text;
  const HeroBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    final dark = _isDark(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: dark
            ? Colors.white.withValues(alpha: 0.06)
            : Colors.white.withValues(alpha: 0.75),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: dark
              ? Colors.white.withValues(alpha: 0.12)
              : const Color(0xFF2563EB).withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.auto_awesome_rounded,
            size: 15,
            color: dark ? const Color(0xFF3B82F6) : const Color(0xFF2563EB),
          ),
          const SizedBox(width: 8),
          Text(
            text,
            style: GoogleFonts.inter(
              color: dark
                  ? Colors.white.withValues(alpha: 0.85)
                  : const Color(0xFF334155),
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  final String text;
  final double fontSize;
  final List<Color>? colors;
  final List<double> stops;
  final TextAlign textAlign;

  const GradientText(
    this.text, {
    super.key,
    this.fontSize = 36,
    this.textAlign = TextAlign.center,
    this.stops = const [0.0, 0.35, 0.7, 1.0],
    this.colors,
  });

  static const _darkColors = [
    Color(0xFF6B7280),
    Color(0xFF60A5FA),
    Color(0xFF3B82F6),
    Color(0xFF6B7280),
  ];

  static const _lightColors = [
    Color(0xFF475569),
    Color(0xFF2563EB),
    Color(0xFF1D4ED8),
    Color(0xFF475569),
  ];

  @override
  Widget build(BuildContext context) {
    final dark = _isDark(context);
    final gradColors = colors ?? (dark ? _darkColors : _lightColors);

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (rect) =>
          LinearGradient(colors: gradColors, stops: stops).createShader(rect),
      child: Text(
        text,
        textAlign: textAlign,
        style: GoogleFonts.inter(
          fontSize: fontSize,
          fontWeight: FontWeight.w700,
          height: 1.1,
          letterSpacing: -1.5,
          color: Colors.white,
        ),
      ),
    );
  }
}

class HeroHeading extends StatelessWidget {
  final String badge;
  final String title;
  final String highlight;
  final double fontSize;

  const HeroHeading({
    super.key,
    required this.badge,
    required this.title,
    required this.highlight,
    this.fontSize = 38,
  });

  @override
  Widget build(BuildContext context) {
    final dark = _isDark(context);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeroBadge(text: badge),
        const SizedBox(height: 22),
        Text(
          title,
          textAlign: TextAlign.center,
          style: GoogleFonts.inter(
            color: dark ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A),
            fontSize: fontSize,
            fontWeight: FontWeight.w700,
            height: 1.1,
            letterSpacing: -1.5,
          ),
        ),
        const SizedBox(height: 4),
        GradientText(highlight, fontSize: fontSize),
      ],
    );
  }
}
