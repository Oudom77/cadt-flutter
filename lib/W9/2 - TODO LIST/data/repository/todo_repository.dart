import '../../models/todo.dart';
import '../dto/todo_dto.dart';
import '../repository/repository_exception.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoRepository {
  static final global = TodoRepository();   // unique instance

  Future<List<Todo>> getTodos() async {

    //  TODO
    //  Adapt the code to handle firebase data fetch
 
    Uri url = Uri.parse("https://cadt-flutter-default-rtdb.asia-southeast1.firebasedatabase.app/w9/todos.json");

    http.Response response = await http.get(url);

    //  TODO
    //  Ensure the message is displayed on the UI if error occured
    //  throw RepositoryException("No wifi !");

    if (response.statusCode != 200){

      throw RepositoryException("No wifi!\nError | Status code: ${response.statusCode}");

    }

    Map<String, dynamic> json = jsonDecode(response.body); 

    List<Todo> toDoList = [];

    for (final jsonKey in json.keys){

      Todo todo = TodoDto.fromJson(jsonKey, json[jsonKey]);
      toDoList.add(todo);

    }

    return [...toDoList];
    

  }

  Future<void> updateCompleted(String todoId, bool completed) async {
    
    //  TODO
    //  Adapt the code to handle firebase data fetch
    Uri url = Uri.parse("https://cadt-flutter-default-rtdb.asia-southeast1.firebasedatabase.app/w9/todos/$todoId.json");

    http.Response response = await http.patch(
      url,
      body: jsonEncode({
        "completed": completed,
      })
    );

    if (response.statusCode != 200){

      throw RepositoryException("No wifi!\nError | Status code: ${response.statusCode}");

    }
  }

  Future<Todo> createTodo(String title) async {

    Uri url = Uri.parse("https://cadt-flutter-default-rtdb.asia-southeast1.firebasedatabase.app/w9/todos.json");

    Map<String, dynamic> todoJson = {

      "title": title,
      "completed": false,

    };

    http.Response response = await http.post(
      url,
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(todoJson),
    );

    if (response.statusCode != 200){

      throw RepositoryException("No wifi!\nError | Status code: ${response.statusCode}");

    }

    Map<String, dynamic> json = jsonDecode(response.body);

    Todo todo = Todo(
      id: json["name"],
      title: title,
      completed: false,
    );

    return todo;
    
  }

  Future<void> deleteTodo(String id) async {
    
    Uri url = Uri.parse("https://cadt-flutter-default-rtdb.asia-southeast1.firebasedatabase.app/w9/todos/$id.json");

    http.Response response = await http.delete(
      url,
       headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode != 200){

      throw RepositoryException("No wifi!\nError | Status code: ${response.statusCode}");

    }
  }


}
