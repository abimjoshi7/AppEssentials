import 'package:flutter/material.dart';

class CircularProgressWithLabel extends StatelessWidget {
  const CircularProgressWithLabel({
    super.key,
    required this.progress,
    this.size = 40.0,
    this.strokeWidth = 3.0,
    this.backgroundColor = Colors.grey,
    this.progressColor = Colors.blue,
  });

  final double progress;
  final double size;
  final double strokeWidth;
  final Color backgroundColor;
  final Color progressColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator.adaptive(
            value: progress / 100,
            backgroundColor: backgroundColor.withValues(alpha: 0.2),
            valueColor: AlwaysStoppedAnimation<Color>(progressColor),
            strokeWidth: strokeWidth,
          ),
          Center(
            child: Text(
              '${progress.toInt()}%',
              style: TextStyle(
                fontSize: size * 0.3,
                fontWeight: FontWeight.bold,
                color: progressColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
