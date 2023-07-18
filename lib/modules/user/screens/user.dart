import 'package:flutter/material.dart';

class UserScreen extends StatefulWidget {
  const UserScreen({super.key});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  String? userName;

  @override
  void didChangeDependencies() {
    final name = ModalRoute.of(context)?.settings.arguments;
    assert(name != null && name is String);

    userName = name as String;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(userName ?? "...")),
    );
  }
}