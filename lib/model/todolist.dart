import 'package:dosify_app/model/task.dart';

class Todolist {
  String username;
  String category;
  List<Task> tasks = [];

  Todolist({this.username = "", this.category = ""});
}

List<String> listd = [];
