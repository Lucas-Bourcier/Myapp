import 'package:firstapp/models/Todo.dart';
import 'package:flutter/widgets.dart';

class TodoListModel extends ChangeNotifier {
  List<Todo> _todos = List.empty(growable: true);
  Map<String, List<Todo>> myLists = {
    'mes courses': [Todo(name: 'Eau'), Todo(name: 'Pain')]
  };

  get listNames {
    return myLists.keys.toList();
  }

  bool addNewList(String name) {
    if (!myLists.containsKey(name)) {
      myLists[name] = List.empty(growable: true);
      notifyListeners();
      return true;
    }
    return false;
  }

  get countList {
    return myLists.length;
  }

  setActiveList(String name) {
    if (myLists.containsKey(name)) {
      _todos = myLists[name] as List<Todo>;
      notifyListeners();
    }
  }

  int? getListCount(String name){
    return myLists[name]?.length;
  }

  get todo {
    return _todos;
  }

  addItem(String item) {
    _todos.add(Todo(name: item, checked: false));
    notifyListeners();
  }

  Todo getItem(int index) {
    if (index == -1) {
      return Todo(name: '');
    }
    return _todos.elementAt(index);
  }

  toggleCheck(int index) {
    if (index != -1) {
      _todos[index].checked = !_todos[index].checked;
      notifyListeners();
    }
  }

  update(int index, String newValue) {
    _todos[index].name = newValue;
    notifyListeners();
  }

  insertOrUpdate(int index, String newValue) {
    if (index == -1) {
      addItem(newValue);
    } else {
      update(index, newValue);
    }
  }

  remove(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  clear() {
    _todos.clear();
    notifyListeners();
  }
}
