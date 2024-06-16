import 'package:hive/hive.dart';

class database {
  List myNotes = [];
  var newBox = Hive.box('newBox');
  void createFirstTime() {
    List myNotes = [
      ["Swipe Left To Delete The Item", false],
    ];
    newBox.put("TODOLIST", myNotes);
  }

  void updateList() {
    newBox.put("TODOLIST", myNotes);
  }

  void loadData() {
    myNotes = newBox.get("TODOLIST");
  }
}
