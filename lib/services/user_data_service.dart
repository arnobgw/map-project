import 'rest_service.dart';
import '../Models/user_model.dart';

class UserDataService {
  static final UserDataService _instance = UserDataService._constructor();
  factory UserDataService() {
    return _instance;
  }

  UserDataService._constructor();
  final rest = RestService();

  Future<List<User>> getAllUsers() async {
    final listJson = await rest.get('users');

    return (listJson as List)
        .map((itemJson) => User.fromJson(itemJson))
        .toList();
  }

  Future deleteUser({String id}) async {
    await rest.delete('users/$id');
  }

  Future<User> createUser({User user}) async {
    final json = await rest.post('users', data: user);
    return User.fromJson(json);
  }

  Future<User> updateUser({String id, User user}) async {
    final json = await rest.patch('users/$id', data: user);
    return User.fromJson(json);
  }
}
