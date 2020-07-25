import 'rest_service.dart';
import '../models/todos_model.dart';

class TodosDataService {
  static final TodosDataService _instance = TodosDataService._constructor();
  factory TodosDataService() {
    return _instance;
  }

  TodosDataService._constructor();
  final rest = RestService();

  Future<List<Todos>> getAllTodos() async {
    final listJson = await rest.get('todos');

    return (listJson as List)
        .map((itemJson) => Todos.fromJson(itemJson))
        .toList();
  }

  Future deleteTodos({String id}) async {
    await rest.delete('todos/$id');
  }

  Future<Todos> createTodos({Todos todo}) async {
    final json = await rest.post('todos', data: todo);
    return Todos.fromJson(json);
  }

  Future<Todos> updateTodos({String id, Todos todo}) async {
    final json = await rest.patch('todos/$id', data: todo);
    return Todos.fromJson(json);
  }
}
