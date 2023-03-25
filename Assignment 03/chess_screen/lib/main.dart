import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        toolbarHeight: 20.00,
        title: const Text(
          "10:00",
          style: TextStyle(fontSize: 10, color: Colors.white70),
          textAlign: TextAlign.left,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const Icon(Icons.wifi, size: 10),
          const Icon(Icons.signal_cellular_alt, size: 10),
          const Icon(Icons.battery_full_sharp, size: 10),
        ],
      ),
      // body: const Header(),
      body: SingleChildScrollView(
        child: Column(children: _buildList()),
      ),
    );
  }

  List<Widget> _buildList() {
    List<Widget> list = [];
    list.add(const Header());
    list.add(const Navbar());
    list.add(const HeroSection());
    list.add(const Post());
    return list;
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  static const textColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        // ignore: sized_box_for_whitespace
        child: Container(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(Icons.menu, color: textColor),
              const Text("EXPLORE",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: textColor)),
              const Icon(Icons.search, color: textColor)
            ],
          ),
        ),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  static const iconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey[900],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 20,
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Icon(Icons.public, color: iconColor),
              const Icon(Icons.explore_outlined, color: iconColor),
              const Icon(Icons.filter_hdr_outlined, color: iconColor),
              const Icon(Icons.favorite_border, color: iconColor)
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // ignore: avoid_unnecessary_containers
        Container(
          child: Image.asset(
            'images/wall-of-the-day.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          color: Colors.black38,
          height: 20,
          alignment: Alignment.center,
          child: const Text("WALL OF THE DAY",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              )),
        )
      ],
    );
  }
}

class Post extends StatelessWidget {
  const Post({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Image.asset(
            'images/image1.jpg',
            height: 200,
            width: 200,
          ),
          const Text("Properity"),
          const Text("Kxnt"),
          const Icon(
            Icons.favorite_border,
          ),

          // const ListTile(
          //   // leading: Image.asset('images/image1.jpg'),
          //   title: Text("Properity"),
          //   subtitle: Text("Kxnt"),
          //   trailing: Icon(Icons.favorite_border),
          // )
        ],
      ),
    );
  }
}
