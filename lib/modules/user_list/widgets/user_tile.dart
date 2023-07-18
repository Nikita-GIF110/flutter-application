import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UserTile extends StatelessWidget {
  const UserTile({super.key, required this.name});
  final String name;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final titleStyle = textTheme.bodyMedium;
    final subtitleStyle = textTheme.bodySmall;

    return ListTile(
      leading: SvgPicture.asset(
        "assets/random_logo.svg",
        height: 40,
        width: 40,
      ),
      title: Text(name, style: titleStyle),
      subtitle: Text("it subtitle", style: subtitleStyle),
      trailing: const Icon(Icons.abc_sharp),
      onTap: () => Navigator.of(context).pushNamed(
        "/user",
        arguments: name,
      ),
    );
  }
}
