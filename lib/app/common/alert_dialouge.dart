import 'package:flutter/cupertino.dart';

class AleartDialogueWidget extends StatelessWidget {
  final String title;
  final String content;
  final Function()? onOkPressed;
  const AleartDialogueWidget(
      {super.key,
      required this.title,
      required this.content,
      this.onOkPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: <Widget>[
        CupertinoDialogAction(
          onPressed: onOkPressed,
          child: const Text('OK'),
        ),
      ],
    );
  }
}
