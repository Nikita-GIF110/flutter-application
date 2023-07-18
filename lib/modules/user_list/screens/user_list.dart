import 'package:flutter/material.dart';
import 'package:flutter_application/modules/user_list/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Flutter Demo Home Page")),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final userName = "$index Some lorem text";
          return UserTile(name: userName);
        },
      ),
    );
  }
}

