import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:utils/utils.dart';

class IncDec extends HookWidget {
  final ValueChanged<int> onChanged;

  const IncDec({
    super.key,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    var number = useState<int>(0);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          borderRadius: BorderRadius.circular(10),
          enableFeedback: true,
          splashColor: kClrBlue,
          onTap: () {
            if (number.value > 1) number.value--;
            onChanged(number.value);
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
            number.value.toString(),
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
            number.value++;
            onChanged(number.value);
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
