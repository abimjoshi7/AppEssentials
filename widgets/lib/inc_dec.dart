import 'package:flutter/material.dart';
import 'package:utils/utils.dart';

class IncDec extends StatefulWidget {
  final ValueChanged<int> onChanged;

  const IncDec({
    super.key,
    required this.onChanged,
  });

  @override
  State<IncDec> createState() => _IncDecState();
}

class _IncDecState extends State<IncDec> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          enableFeedback: true,
          splashColor: kClrBlue,
          onTap: () {
            setState(() {
              if (count > 1) count--;
            });
            widget.onChanged(count);
          },
          child: const CircleAvatar(
            maxRadius: 12,
            child: Icon(
              Icons.remove,
              size: 16,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Text(
            count.toString(),
            style: context.titleMedium?.copyWith(
              fontWeight: FontWeight.w900,
            ),
          ),
        ),
        InkWell(
          borderRadius: BorderRadius.circular(10),
          enableFeedback: true,
          splashColor: kClrBlue,
          onTap: () {
            setState(() {
              count++;
            });
            widget.onChanged(count);
          },
          child: const CircleAvatar(
            maxRadius: 12,
            child: Icon(
              Icons.add,
              size: 16,
            ),
          ),
        ),
      ],
    );
  }
}
