import 'package:flutter/material.dart';

showDialogueBox(BuildContext context, String msg, String title) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            title,
          ),
          content: Text(
            msg,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Okay")),
            // TextButton(onPressed: func, child: const Text("Confirm"))
          ],
        );
      });
}
