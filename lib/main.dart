import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(useMaterial3: true),
      darkTheme: ThemeData.dark(useMaterial3: true),
      home: const MyHomePage(title: 'Salad'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> entries = <String>['A', 'B', 'C', 'D'];
  final List<int> colorCodes = <int>[600, 500, 100, 50];

  void handleBack() {}

  void handleSearch() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading:
            IconButton(icon: const Icon(Icons.west), onPressed: handleBack),
        actions: <Widget>[
          IconButton(icon: const Icon(Icons.search), onPressed: handleSearch)
        ],
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListView.builder(
                shrinkWrap: true,
                itemCount: entries.length,
                // scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      height: 50,
                      width: 100,
                      color: Colors.amber[colorCodes[index]],
                      child: Center(child: Text('Entry ${entries[index]}')));
                })
          ],
        ),
      ),
    );
  }
}
