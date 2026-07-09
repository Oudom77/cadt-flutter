import '../../models/todo.dart';
import '../dto/todo_dto.dart';
import '../repository/repository_exception.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class TodoRepository {
  static final global = TodoRepository();   // unique instance

  // final List<Todo> fakeTodos = [
  //   Todo(id: '1', title: 'Buy groceries', completed: false),
  //   Todo(id: '2', title: 'Finish Flutter homework', completed: true),
  //   Todo(id: '3', title: 'Call the dentist', completed: false),
  //   Todo(id: '4', title: 'Read 20 pages of a book', completed: true),
  //   Todo(id: '5', title: 'Go for a 30-minute walk', completed: false),
  // ];

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

    List<dynamic> toDoList = [];

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
}
