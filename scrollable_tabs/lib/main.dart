import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const String appName = "Scrollable Tabs";

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MyHomePage(),
    );
  }
}

class _Page {
  const _Page({this.icon, this.text});

  final IconData icon;
  final String text;
}

const List<_Page> _allPages = const <_Page>[
  const _Page(icon: Icons.grade, text: 'TRIUMPH'),
  const _Page(icon: Icons.playlist_add, text: 'NOTE'),
  const _Page(icon: Icons.check_circle, text: 'SUCCESS'),
  const _Page(icon: Icons.question_answer, text: 'OVERSTATE'),
  const _Page(icon: Icons.sentiment_very_satisfied, text: 'SATISFACTION'),
  const _Page(icon: Icons.camera, text: 'APERTURE'),
  const _Page(icon: Icons.assignment_late, text: 'WE MUST'),
  const _Page(icon: Icons.assignment_turned_in, text: 'WE CAN'),
  const _Page(icon: Icons.group, text: 'ALL'),
  const _Page(icon: Icons.block, text: 'EXCEPT'),
  const _Page(icon: Icons.sentiment_very_dissatisfied, text: 'CRYING'),
  const _Page(icon: Icons.error, text: 'MISTAKE'),
  const _Page(icon: Icons.loop, text: 'TRYING'),
  const _Page(icon: Icons.cake, text: 'CAKE'),
];

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(vsync: this, length: _allPages.length);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appName),
        bottom: TabBar(
          controller: _controller,
          isScrollable: true,
          tabs: _allPages.map((_Page page) {
            return Tab(text: page.text, icon: Icon(page.icon));
          }).toList(),
        ),
      ),
      body: TabBarView(
          controller: _controller,
          children: _allPages.map((_Page page) {
            return SafeArea(
              top: false,
              bottom: false,
              child: Container(
                key: ObjectKey(page.icon),
                padding: const EdgeInsets.all(12.0),
                child: Card(
                  child: Center(
                    child: Icon(
                      page.icon,
                      size: 128.0,
                      semanticLabel: 'Placeholder for ${page.text} tab',
                    ),
                  ),
                ),
              ),
            );
          }).toList()),
    );
  }
}
