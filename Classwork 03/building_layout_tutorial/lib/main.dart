import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(bottom: 8),
                child: const Text("Oeschinen Lake Campground",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Text(
                "Kandersteg, Switzerland",
                style: TextStyle(color: Colors.grey[500]),
              )
            ],
          )),
          Icon(
            Icons.star,
            color: Colors.red[500],
          ),
          const Text("41"),
        ],
      ),
    );

    Color textColor = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonSection(textColor, Icons.call, 'CALL'),
        _buildButtonSection(textColor, Icons.near_me, 'ROUTE'),
        _buildButtonSection(textColor, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    Widget imageSection = Image.asset(
      'images/lake.jpg',
      width: 600,
      height: 240,
      fit: BoxFit.cover,
    );

    return MaterialApp(
        title: 'Building Layout Tutorial',
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Building Layout Tutorial"),
          ),
          body: Column(
            children: [
              imageSection, 
              titleSection, 
              buttonSection, 
              textSection],
          ),
        ));
  }

  Column _buildButtonSection(Color textColor, IconData icon, String text) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: textColor,
        ),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.w400, color: textColor),
          ),
        )
      ],
    );
  }
}
