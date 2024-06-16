import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class customListTile extends StatelessWidget {
  bool isChecked;
  String noteText;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFun;
  customListTile({
    super.key,
    required this.isChecked,
    required this.noteText,
    required this.onChanged,
    required this.deleteFun,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              backgroundColor: Theme.of(context).secondaryHeaderColor,
              onPressed: deleteFun,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: ListTile(
          //tileColor: Colors.cyanAccent,
          title: Text(
            noteText,
            style: isChecked
                ? const TextStyle(decoration: TextDecoration.lineThrough)
                : const TextStyle(decoration: TextDecoration.none),
          ),
          leading: Checkbox(
            onChanged: onChanged,
            value: isChecked,
          ),
        ),
      ),
    );
  }
}
