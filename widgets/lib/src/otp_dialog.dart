part of 'src.dart';

class OTPDialog extends StatefulWidget {
  final ValueChanged<String> onCompleted;
  final VoidCallback onResend;
  final int count;

  const OTPDialog({
    super.key,
    required this.onCompleted,
    required this.onResend,
    this.count = 6,
  });

  @override
  State<OTPDialog> createState() => _OTPDialogState();
}

class _OTPDialogState extends State<OTPDialog> {
  late List<FocusNode> _focusNodes;
  late List<TextEditingController> _controllers;

  String getOtpValue() {
    return _controllers.map((controller) => controller.text).join();
  }

  @override
  void initState() {
    super.initState();

    _focusNodes = List.generate(widget.count, (index) => FocusNode());
    _controllers = List.generate(
      widget.count,
      (index) => TextEditingController(),
    );

    for (int i = 0; i < widget.count; i++) {
      _controllers[i].addListener(() {
        if (_controllers[i].text.length == 1 && i < widget.count - 1) {
          _focusNodes[i + 1].requestFocus();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'Enter OTP provided in email',
        style: TextTheme.of(context).titleMedium,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: List.generate(
              widget.count,
              (index) => Container(
                margin: const EdgeInsets.all(3),
                width: context.width * 0.09,
                child: TextField(
                  autofocus: index == 0,
                  controller: _controllers[index],
                  focusNode: _focusNodes[index],
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  onSubmitted: (value) {
                    String otp = getOtpValue();
                    // Get the complete OTP
                    widget.onCompleted(otp);
                  },
                  decoration: const InputDecoration(
                    focusedBorder: UnderlineInputBorder(),
                    enabledBorder: UnderlineInputBorder(),
                    contentPadding: EdgeInsets.only(left: 10),
                  ),
                ),
              ),
            ),
          ),
          // RoundedButton(
          //   onPressed: widget.onSubmit,
          //   child: Text(
          //     "Submit",
          //   ),
          // ),
          TextButton(
            onPressed: widget.onResend,
            child: const Text(
              'Resend OTP',
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    for (int i = 0; i < widget.count; i++) {
      _controllers[i].dispose();
      _focusNodes[i].dispose();
    }
    super.dispose();
  }
}
