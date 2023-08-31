import 'package:flutter/material.dart';
import '../models/todo.dart';

class todo_provider extends ChangeNotifier {
  List<todo> _todos = [
    todo(title: 'Do the home work'),
    todo(title: 'Study'),
    todo(title: 'Clean up the room'),
    todo(title: 'I go to the school'),
  ];
  void addNote(todo t) {
    _todos.add(t);
    notifyListeners();
  }

  List<todo> get todos => _todos;
  void deleteNotes(int index) {
    _todos.removeAt(index);
    notifyListeners();
  }

  void updateNote(int index, todo t) {
    _todos[index] = t;
    notifyListeners();
  }

  List<todo> searchNotes(String query) {
    return _todos
        .where((element) =>
            element.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  void togglechk(int index) {
    _todos[index].chk = !_todos[index].chk;
    notifyListeners();
  }
}
