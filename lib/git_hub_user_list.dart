import "package:flutter/material.dart";
import "package:flutter_application/router/router.dart";
import "package:flutter_application/theme/theme.dart";

class GitHubUserList extends StatelessWidget {
  const GitHubUserList({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: theme,
      initialRoute: "/",
      routes: routes,
    );
  }
}
