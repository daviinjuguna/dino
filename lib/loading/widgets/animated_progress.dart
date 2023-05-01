import 'package:flutter/material.dart';

class AnimatedProgress extends StatelessWidget {
  const AnimatedProgress({
    super.key,
    required this.progress,
    required this.background,
    required this.foreground,
  });
  final double progress;
  final Color background;
  final Color foreground;

  static const Duration animDuration = Duration(milliseconds: 100);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        height: 16,
        width: 200,
        child: ColoredBox(
          color: background,
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: TweenAnimationBuilder(
              tween: Tween(begin: 0.0, end: progress),
              duration: animDuration,
              builder: (_, progress, __) {
                return FractionallySizedBox(
                  widthFactor: progress,
                  alignment: Alignment.centerLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(1),
                    child: ColoredBox(color: foreground),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
