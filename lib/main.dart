import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
        textTheme: const TextTheme(
            bodyMedium: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            bodySmall: TextStyle(
              color: Colors.amber,
              fontSize: 16,
            )),
        dividerColor: Colors.white,
        listTileTheme: ListTileThemeData(iconColor: Colors.amber[300]),
        appBarTheme: AppBarTheme(
            backgroundColor: Colors.amber[300],
            titleTextStyle: const TextStyle(color: Colors.black)),
      ),
      initialRoute: "/",
      routes: <String, WidgetBuilder>{
        "/": (BuildContext context) =>
            const HomeScreen(title: "Flutter Demo Home Page"),
        "/user": (BuildContext context) => const UserScreen(),
      },
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.title});
  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: ListView.separated(
        itemCount: 10,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) {
          final userName = "$index Some lorem text";

          return ListTile(
            leading: SvgPicture.asset(
              "assets/random_logo.svg",
              height: 40,
              width: 40,
            ),
            title: Text(userName, style: textTheme.bodyMedium),
            subtitle: Text(
              "it subtitle",
              style: textTheme.bodySmall,
            ),
            trailing: const Icon(Icons.abc_sharp),
            onTap: () => Navigator.of(context).pushNamed(
              "/user",
              arguments: userName,
            ),
          );
        },
      ),
    );
  }
}

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
