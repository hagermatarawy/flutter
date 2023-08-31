import 'package:flutter/material.dart';
import 'package:hello_world/models/todo.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/providers/todo_provider.dart';

class SearchNotesDelegate extends SearchDelegate {
  @override
  Widget buildSearchBar(BuildContext context) {
    return TextField(
      onChanged: (value) {
        query = value;
      },
      decoration: InputDecoration(
        labelText: "Search",
        border: OutlineInputBorder(),
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return buildSuggestions(context);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<todo> todos = Provider.of<todo_provider>(context).searchNotes(query);
    return ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Text(todos[index].title);
        });
  }
}
