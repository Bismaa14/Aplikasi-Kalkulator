import 'package:flutter/material.dart';

class ToDoListPage extends StatefulWidget {
  @override
  _ToDoListPageState createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<String> todos = [];
  String newTodo = ''; // Variabel untuk menyimpan To-Do baru

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(todos[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        todos.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(hintText: 'Tambahkan To-Do'),
                    onSubmitted: (newTodo) {
                      setState(() {
                        todos.add(newTodo);
                        newTodo = ''; // Mengosongkan newTodo setelah ditambahkan
                      });
                    },
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    setState(() {
                      todos.add(newTodo);
                      newTodo = ''; // Mengosongkan newTodo setelah ditambahkan
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
