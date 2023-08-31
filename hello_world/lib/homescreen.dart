import 'package:flutter/material.dart';
import 'package:hello_world/models/todo.dart';
import 'package:provider/provider.dart';
import 'package:hello_world/providers/todo_provider.dart';
import 'package:hello_world/widgets/customsnackbar.dart';

class homescreen extends StatelessWidget {
  homescreen({super.key});
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<todo_provider>(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          String title = "";
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    title: Text("Warning"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          onChanged: (value) {
                            title = value;
                          },
                          decoration: InputDecoration(
                            labelText: "Enter title",
                            border: OutlineInputBorder(),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      ElevatedButton(
                        child: Text("Add"),
                        onPressed: () {
                          provider.addNote(todo(title: title));
                          Navigator.pop(context);
                        },
                      ),
                      ElevatedButton(
                        child: Text("Cancel"),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Notes'),
        actions: [
          IconButton(
            onPressed: () {
              showSearch(context: context, delegate: SearchNotesDelegate());
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      body: Consumer<todo_provider>(
        builder: (context, provider, child) {
          return ListView.builder(
            itemCount: provider.todos.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: ValueKey(provider.todos[index]),
                onDismissed: (direction) {
                  provider.deleteNotes(index);
                },
                child: GestureDetector(
                  child: Container(
                    color: Color.fromARGB(255, 49, 176, 240),
                    width: 100,
                    height: 40,
                    margin: EdgeInsetsDirectional.all(10),
                    child: CheckboxListTile(
                      value: provider.todos[index].chk,
                      onChanged: (value) {
                        provider.togglechk(index);
                      },
                      title: Text(provider.todos[index].title),
                    ),
                  ),
                  onDoubleTap: () {
                    String updatedTitle = provider.todos[index].title;
                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                              title: Text("Update"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextField(
                                    controller: TextEditingController(
                                        text: provider.todos[index].title),
                                    onChanged: (value) {
                                      updatedTitle = value;
                                    },
                                    decoration: InputDecoration(
                                      labelText: "Enter title",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                ElevatedButton(
                                  child: Text("Save"),
                                  onPressed: () {
                                    provider.updateNote(
                                        index,
                                        todo(
                                          title: updatedTitle,
                                        ));
                                    Navigator.pop(context);
                                  },
                                ),
                                ElevatedButton(
                                  child: Text("Cancel"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            ));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
