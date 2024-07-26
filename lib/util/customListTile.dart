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
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: deleteFun,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(10),
            )
          ],
        ),
        child: ListTile(
          tileColor: isChecked ? Colors.red[300] : Colors.green[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: EdgeInsets.all(8),
          title: Text(
            noteText,
            style: isChecked
                ? const TextStyle(
                    decoration: TextDecoration.lineThrough, fontSize: 18)
                : const TextStyle(
                    decoration: TextDecoration.none, fontSize: 18),
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
