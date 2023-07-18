import 'package:dio/dio.dart';
import 'package:flutter_application/repositories/user_list/models/user_list.dart';

class UserListRepository {
  String url = "https://jsonplaceholder.typicode.com/users";

  Future<List<UserList>> getUserList() async {
    final response = await Dio().get(url);

    final data = response.data as Map<String, dynamic>;
    final userList = data.entries.map((e) {
      final user = (e.value as Map<String, dynamic>);

      return UserList(
        id: user["id"],
        name: user["name"],
        email: user["email"],
        phone: user["phone"],
      );
    }).toList();

    return userList;
  }
}
