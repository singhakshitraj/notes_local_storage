import 'package:flutter/material.dart';

class showActionDialog extends StatelessWidget {
  TextEditingController control = TextEditingController();
  Function()? onSave;
  Function()? onCancel;
  showActionDialog(
      {super.key,
      required this.control,
      required this.onCancel,
      required this.onSave});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: TextField(
          controller: control,
          decoration: InputDecoration(
              hintText: 'Enter The Text Here!!',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ))),
      actions: [
        ElevatedButton(
          onPressed: onCancel,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
          ),
          child: const Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: onSave,
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).secondaryHeaderColor,
          ),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
