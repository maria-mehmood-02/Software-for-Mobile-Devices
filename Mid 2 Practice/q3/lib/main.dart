import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mid 2 Practice - Q3',
      theme: ThemeData.dark(
          // primarySwatch: Colors.purple,
          ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mid 2 Practice - Q3'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _buildList(),
        ),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> list = [];

    list.add(const Header());
    list.add(ListItem(
      title: 'Fresh baked breads',
      image: 'lake',
    ));
    list.add(const Divider(
      color: Colors.grey,
      height: 25,
      thickness: 1,
      indent: 5,
      endIndent: 5,
    ));

    list.add(Container(
      height: 16,
    ));
    return list;
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: const BoxDecoration(color: Colors.black12),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          Container(
            width: 10,
          ),
          const Icon(Icons.menu),
          Container(
            width: 20,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: Text('Recipes'),
            ),
          ),
          const Icon(Icons.search),
          Container(
            width: 20,
          ),
          const Icon(Icons.more_vert),
          Container(
            width: 20,
          ),
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class ListItem extends StatefulWidget {
  ListItem({super.key, required this.title, required this.image});
  String title;
  String image;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(
        'images/${widget.image}.jpg',
        width: 200,
        height: 200,
        // fit: BoxFit.cover,
      ),
      title: Text(widget.title),
      trailing: const Icon(Icons.more_horiz),
    );
  }
}
