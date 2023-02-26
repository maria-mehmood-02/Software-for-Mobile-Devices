import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const MyForm(),
    );
  }
}

class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<StatefulWidget> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final textController = TextEditingController();
  bool _isVisible = false;

  List<Widget> list = [
    Container(
      height: 32.0,
    )
  ];

  @override
  void dispose() {
    // TODO: implement dispose
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do List'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: 500,
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: textController,
                  )),
              ButtonTheme(
                  minWidth: 200,
                  height: 100,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        list.add(Padding(
                          padding: const EdgeInsets.only(left: 400),
                          child: ListTile(
                            leading: Icon(Icons.circle),
                            title: Text("textController.text"),
                          ),
                        ));
                        _isVisible = true;
                      });
                    },
                    label: Text("Add"),
                    icon: Icon(Icons.add),
                  )),
            ],
          ),
          Visibility(
              visible: _isVisible,
              child: Column(
                children: _myList(),
              ))
        ],
      ),
    );
  }

  List<Widget> _myList() {

    for (var i = 0; i < list.length; i++) {
      list.elementAt(i);
    }

    return list;
  }
}
