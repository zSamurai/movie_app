import 'package:http/http.dart';

import 'package:movie_app/data/planet.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/logic/api.dart';

class Detail extends StatefulWidget {
  final String url;
  const Detail({Key? key, required this.url}) : super(key: key);
  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<Planet> people;

  @override
  void initState() {
    super.initState();
    people =
        API.getPlanetByURL(Client(), widget.url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
      ),
      body: FutureBuilder<Planet>(
        future: people,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Text("WAIT");
          }
          return
          Center(
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(
                    width: 300,
                    child: Column(
                        children: [
                          Center(
                              child:
                              Text(
                                snapshot.data!.name,
                                style: const TextStyle(fontSize: 35.0,),
                              )
                          ),
                        ]
                    ),
                  ),
                  SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Diameter", textAlign: TextAlign.center,
                            ),
                            Text(
                              snapshot.data!.diameter,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Climate", textAlign: TextAlign.center,
                            ),
                            Text(
                              snapshot.data!.climate,
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Gravity", textAlign: TextAlign.center,
                            ),
                            Text(
                              snapshot.data!.gravity,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Terrain", textAlign: TextAlign.center,
                            ),
                            Text(
                              snapshot.data!.terrain,
                            ),
                          ],
                        ),
                      )
                  ),
                  SizedBox(
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            const Text("Population", textAlign: TextAlign.center,
                            ),
                            Text(
                              snapshot.data!.population,
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      )
                  )
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
