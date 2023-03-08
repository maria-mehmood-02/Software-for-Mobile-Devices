import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primarySwatch: Colors.green,
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
        title: const Text(
          "16:11",
          style: TextStyle(fontSize: 10),
          textAlign: TextAlign.left,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Icon(Icons.wifi, size: 10),
          const Icon(Icons.battery_full_sharp, size: 10),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(children: _buildList()),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> list = [];
    list.add(Header());
    list.add(Features());

    for (int i = 0; i < 10; i++) {
      list.add(ListItem(
          name: "Contact ${i}", message: "Hi there!", time: "2:53 am"));
    }

    return list;
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 5, 99, 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Text("WhatsApp",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                    textAlign: TextAlign.left),
                const Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Icon(Icons.search, color: Colors.white))),
                const Icon(Icons.more_vert, color: Colors.white),
              ],
            ),
          ),
        ));
  }
}

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(255, 5, 99, 8),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 20,
            width: MediaQuery.of(context).size.width,
            child: Row(
              // ignore: prefer_const_literals_to_create_immutables
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.camera_alt, color: Colors.white),
                SizedBox(
                  width: 80,
                ),
                Text("Chat", style: TextStyle(color: Colors.white)),
                Expanded(
                    child: Align(
                        alignment: Alignment.center,
                        child: Text("Status",
                            style: TextStyle(color: Colors.white)))),
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: Text("Call", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ),
        ));
  }
}

class ListItem extends StatefulWidget {
  ListItem(
      {super.key,
      required this.name,
      required this.message,
      required this.time});
  String name;
  String message;
  String time;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Color.fromARGB(255, 5, 99, 8),
        child: Icon(Icons.person),
      ),
      title: Text(widget.name),
      subtitle: Text(
        widget.message,
        style: TextStyle(color: Colors.grey),
      ),
      isThreeLine: false,
      trailing: Text(
        widget.time,
        style: TextStyle(color: Colors.green),
      ),
    );
  }
}
