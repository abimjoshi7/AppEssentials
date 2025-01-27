part of 'src.dart';

permissionDialog(context, VoidCallback onPressed) => showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => Platform.isAndroid
          ? AlertDialog(
              title: const Text('Permission Denied'),
              content: const Text('Allow access to gallery and photos'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: onPressed,
                  child: const Text('Settings'),
                ),
              ],
            )
          : CupertinoAlertDialog(
              title: const Text('Permission Denied'),
              content: const Text('Allow access to gallery and photos'),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancel'),
                ),
                CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: onPressed,
                  child: const Text('Settings'),
                ),
              ],
            ),
    );
