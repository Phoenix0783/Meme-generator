import 'dart:ui';

import 'package:flutter/material.dart';
import '../screens/random_meme.dart';
import '../screens/results.dart';

import 'package:page_transition/page_transition.dart';

class InputForm extends StatelessWidget {
  const InputForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController heightController = TextEditingController();
    TextEditingController weightController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Meme Creator'),
      ),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Meme Generator',
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                color: Colors.pink,
              ),
              title: const Text(
                'Create meme',
                style: TextStyle(color: Colors.pink),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InputForm()),
                );
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.circle,
                color: Colors.pink,
              ),
              title: const Text(
                'Generate Meme',
                style: TextStyle(color: Colors.pink),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const RandomMeme()),
                );
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Align(
                  alignment: Alignment.topLeft,
                  // ignore: avoid_unnecessary_containers
                  child: Row(
                    children: const <Widget>[
                      Text(
                        'Meme line',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: TextField(
                  controller: heightController,
                  textCapitalization: TextCapitalization.characters,
                  decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: "Enter your meme line"),
                ),
              ),

              // Weight input

              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 240,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 20,
                      primary: Colors.pink,
                      fixedSize: const Size(300, 100),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50))),
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            child: Results(
                                weightController.text, heightController.text),
                            type: PageTransitionType.fade));
                  },
                  child: const Text(
                    'Create my Meme',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
              const SizedBox(
                height: 120,
              ),

              Image.asset(
                'assets/images/meme.png',
                width: double.infinity,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}
