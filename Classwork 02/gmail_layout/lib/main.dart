import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gmail Layout',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
          title: Text('Gmail Layout'),
        ),
        body: SingleChildScrollView(
          child: (Column(
            children: _buildList(),
          )),
        ));
  }

  List<Widget> _buildList() {
    List<Widget> list = [];

    list.add(SearchBarCustom());

    list.add(Container(
      height: 16,
    ));

    for (var i = 0; i < 10; i++) {
      list.add(ListItem(
        title: 'Title ${i + 1}',
        subtitle: 'Subtitle ${i + 1}',
        date: '25-Feb-2023',
        avatarText: 'T${i+1}',
      ));
    }

    return list;
  }
}

class SearchBarCustom extends StatelessWidget {
  const SearchBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 56,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Container(
              width: 10,
            ),
            Icon(Icons.menu),
            Container(
              width: 20,
            ),
            Expanded(
                child: Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: TextField(
                controller: TextEditingController(),
                expands: false,
                // maxLength: 50,
                maxLines: 1,
                autofocus: true,
                decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black))),
                cursorColor: Colors.black,
              ),
            )),
            Icon(Icons.search),
            Container(
              width: 8,
            ),
            CircleAvatar(
              backgroundColor: Colors.cyan,
              child: Text(
                'G',
                style: TextStyle(color: Colors.black),
              ),
            ),
            Container(
              width: 16,
            ),
          ],
        ),
      ),
    );
  }
}

class ListItem extends StatefulWidget {
  ListItem(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.date,
      required this.avatarText});

  String title;
  String subtitle;
  String date;
  String avatarText;

  @override
  State<ListItem> createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool favourite = true;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.blueGrey,
        child: Text(widget.avatarText,style: TextStyle(color: Colors.black),),
      ),
      title: Text(widget.title),
      subtitle: Text(widget.subtitle),
      isThreeLine: true,
      trailing: FittedBox(
          child: Column(
        children: [
          Text(widget.date),
          IconButton(onPressed: () {
            setState(() {
              favourite = !favourite;
            });
          }, 
          icon: Icon(favourite ? Icons.star_outline : Icons.star))
          // icon: Icon(Icons.star_outline))
        ],
      )),
    );
  }
}
