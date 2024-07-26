import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:notes_local_storage_hive/util/customListTile.dart';
import 'package:notes_local_storage_hive/util/showActionDialog.dart';
import '../data/database.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final newBox = Hive.box('newBox');
  database db = database();
  dynamic _deleteFxn(int index) {
    setState(() {
      db.myNotes.removeAt(index);
    });
    db.updateList();
  }

  TextEditingController textControl = TextEditingController();
  @override
  void initState() {
    if (newBox.get("TODOLIST") == null) {
      db.createFirstTime();
    }
    db.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('H O M E P A G E',
            style: TextStyle(color: Colors.black)),
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: db.myNotes.length,
                itemBuilder: (context, index) {
                  return customListTile(
                    onChanged: (p0) {
                      setState(() {
                        db.myNotes[index][1] = !db.myNotes[index][1];
                      });
                      db.updateList();
                    },
                    isChecked: db.myNotes[index][1],
                    noteText: db.myNotes[index][0],
                    deleteFun: (context) => _deleteFxn(index),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: (context),
              builder: (context) {
                return showActionDialog(
                  control: textControl,
                  onCancel: () {
                    Navigator.of(context).pop();
                    textControl.clear();
                  },
                  onSave: () {
                    setState(() {
                      db.myNotes.add([textControl.text, false]);
                      textControl.clear();
                    });
                    db.updateList();
                    Navigator.of(context).pop();
                  },
                );
              });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
