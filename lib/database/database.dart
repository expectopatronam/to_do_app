import 'package:hive/hive.dart';

class ToDoDatabase {
  List toDoList = [];

  final _myBox = Hive.box('mybox');

  void firstTimeUser() {
    toDoList = [
      ['Make omlette', false],
      ['Take out waste', false]
    ];
print('HI');
  }

  void loadData ()async{
    toDoList = await _myBox.get('TODOLIST');
  }

  void upDateData ()async {
    try {
  await _myBox.put('TODOLIST', toDoList);
} catch (e) {
 print('update data error $e');
}
  }


}
