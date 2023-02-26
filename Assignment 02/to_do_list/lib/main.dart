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
  late String text;

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
                      print(textController.text);
                      text = textController.text;
                    },
                    // onPressed: () => {
                    //   print(textController.text),
                    // },
                    label: Text("Add"),
                    icon: Icon(Icons.add),
                  )),
            ],
          ),
          Expanded(
              child: ListView(
            children: const [
              ListTile(
                title: Text(text),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
