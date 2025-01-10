import 'package:flutter/material.dart';
import 'package:localization/l10n/l10n.dart';
import 'package:utils/utils.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SizedBox.expand(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  context.l10n.kSomethingWentWrong,
                  style: context.titleLarge,
                ),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Go Back",
                ),
              ),
            ],
          ),
        ),
      );
}
