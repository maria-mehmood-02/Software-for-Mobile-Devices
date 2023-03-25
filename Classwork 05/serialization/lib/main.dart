import 'dart:convert';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'album.dart';

Future<Album> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

void main() {
  runApp(const MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Auto Generated Searialization"),
        ),
        body: Center(
        child: FutureBuilder<Album>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Text(
                    'User Id: ${snapshot.data!.userId}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurpleAccent,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    'Id: ${snapshot.data!.id}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurpleAccent,
                        decoration: TextDecoration.none),
                  ),
                  Text(
                    'Title: ${snapshot.data!.title}',
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.deepPurpleAccent,
                        decoration: TextDecoration.none),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text('Error ${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
      ),
    );
  }
}