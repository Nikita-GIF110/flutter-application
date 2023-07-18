import 'package:flutter/material.dart';
import 'package:flutter_application/modules/user_list/widgets/widgets.dart';
import 'package:flutter_application/repositories/user_list/models/user_list.dart';
import 'package:flutter_application/repositories/user_list/user_list_repository.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserList>? _userList;
  bool _isLoading = true;

  @override
  void initState() {
    _loadUserList();
    super.initState();
  }

  Future<void> _loadUserList() async {
    List<UserList> list = await UserListRepository().getUserList();
    setState(() {
      _userList = list;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Demo Home Page")),
      body: (_isLoading == true)
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              itemCount: _userList!.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final user = _userList![index];
                return UserTile(
                  name: user.name,
                  email: user.email,
                );
              },
            ),
    );
  }
}
