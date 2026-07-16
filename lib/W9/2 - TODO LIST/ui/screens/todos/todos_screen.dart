import 'package:flutter/material.dart';

import '../../../data/repository/repository_exception.dart';
import '../../../data/repository/todo_repository.dart';
import '../../../models/todo.dart';
import '../../theme/app_screen.dart';
import '../../utils/async_data.dart';
import 'todo_card.dart';

class TodosScreen extends StatefulWidget {
  const TodosScreen({super.key});

  @override
  State<TodosScreen> createState() => _TodosScreenState();
}

class _TodosScreenState extends State<TodosScreen> {
  AsyncData<List<Todo>> asyncData = AsyncData.notstarted();
  TodoRepository repository = TodoRepository.global;
  

  @override
  void initState() {
    super.initState();

    // Fetch todos on init state
    _fetchTodos();
  }

  void _fetchTodos() async {

    //  TODO
    // Fetch the list of todos from the repo
    // Handle the success, loading and error cases (catch exception)
    // Update the widget state (asyncData)

    setState(() {
      asyncData = AsyncData.loading();
    });
    
    try {

      List<Todo> toDoList = await repository.getTodos();
      setState(() {
        asyncData = AsyncData.success(toDoList);
      });

    } on RepositoryException catch (e) {

      setState(() {
        asyncData = AsyncData.error(e.message);
      });

    }
  }

  void onUpdateCompleted(Todo todo) async {

    //  TODO
    // Update the todo from the repo
    // Handle the success, loading and error cases (catch exception)
    // Update the widget state (asyncData)

    // ! we dont reload the full list, we update directly the modified Todo in the cache (asyncData)
    bool newStatus = !todo.completed;

    try{

      await repository.updateCompleted(todo.id, newStatus);
      setState(() {

        final List<Todo>? currentList = asyncData.value;
        final List<Todo> newList = [];

        if (currentList == null){
          return;
        }

        for (Todo currentTodo in currentList){

          if (todo.id == currentTodo.id){

            newList.add(
              Todo(id: todo.id, title: todo.title, completed: newStatus)
            );

          } else {

            newList.add(currentTodo);

          }
        }

        asyncData = AsyncData.success(newList);
      });

    } on RepositoryException catch (e){

      setState(() {
        asyncData = AsyncData.error(e.message);
      });

    }
  }

  void onCreateTodo(String title) async {

    try {

      final List<Todo> newList = [...asyncData.value!];

      final Todo todo = await repository.createTodo(title);

      newList.add(todo);

      setState(() {
        asyncData = AsyncData.success(newList);
      });

    } on RepositoryException catch (e){

      setState(() {
        asyncData = AsyncData.error(e.message);
      });

    }
  }

  void onDeleteTodo(int index) async {

    try {

      final List<Todo> newList = [...asyncData.value!];

      final String todoId = newList[index].id;

      await repository.deleteTodo(todoId);

      newList.removeAt(index);

      setState(() {
        asyncData = AsyncData.success(newList);
      });

    } on RepositoryException catch (e){

      setState(() {
        asyncData = AsyncData.error(e.message);
      });

    }

  }

  Widget get content => switch (asyncData.status) {
    AsyncStatus.notstarted => Text(
      "Tap to refresh",
      style: AppTheme.paragraph.copyWith(color: AppTheme.redColor),
    ),

    AsyncStatus.loading => CircularProgressIndicator(),

    AsyncStatus.success => _buildTodos(),

    AsyncStatus.error => _buildError(),
  };

  Widget _buildTodos() {
    List<Todo> todos = asyncData.value!;
    return ListView.builder(
      itemCount: todos.length,
      itemBuilder: (context, index) =>
          Dismissible(
            key: ValueKey(todos[index]),
            background: Container(
              color: Colors.white,
            ),
            onDismissed: (direction){
              onDeleteTodo(index);
            },
            child: TodoCard(todo: todos[index], onTap: onUpdateCompleted)
          ),
    );
  }

  Widget _buildError() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.warning, color: AppTheme.redColor),
        SizedBox(width: 10),

        Text(
          asyncData.error!,
          style: AppTheme.paragraph.copyWith(color: AppTheme.redColor),
        ),
      ],
    );
  }

  void _showCreateTodoModal(){

    final TextEditingController titleController = TextEditingController();

    showModalBottomSheet(
      context: context, 
      builder: (context) {

        return Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: "Todo Title",
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                onPressed: (){

                  final String title = titleController.text.trim();

                  if (title.isEmpty) {
                    return;
                  }

                  Navigator.pop(context);
                  onCreateTodo(title);

                }, 
                child: Text(
                  "Add Todo"
                )
              )
            ],
          ),
        );
      }
    );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      appBar: AppBar(
        backgroundColor: AppTheme.backgroundColor,
        title: Text("Welcome !", style: AppTheme.heading),
        actions: [
          IconButton(
            onPressed: (){
              _showCreateTodoModal();
            }, 
            icon: Icon(Icons.add)
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(child: content),
      ),
    );
  }
}
