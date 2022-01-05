import 'package:movie_app/data/character.dart';
import 'package:movie_app/logic/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'detail.dart';

class HomeScreen extends StatefulWidget {
  final String title;

  const HomeScreen({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Character>> people;

  @override
  void initState() {
    super.initState();
    people =
        API.getCharacters(Client());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Character>>(
        future: people,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text("WAIT");
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                elevation: 5,
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: ListTile(
                  title: Text(
                    snapshot.data![index].name,
                  ),
                  subtitle: Text(snapshot.data![index].homeWorld,
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail(url: snapshot.data![index].homeWorld)));
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}