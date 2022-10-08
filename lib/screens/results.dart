import 'package:flutter/material.dart';
import 'dart:math';

class Results extends StatefulWidget {
  final String line1;
  final String line2;

  const Results(this.line1, this.line2, {super.key});

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  var rando = Random().nextInt(2) + 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Meme')),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'lib/images/$rando.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Column(
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Stack(
                        children: <Widget>[
                          Text(
                            widget.line2,
                            style: TextStyle(
                              fontSize: 30,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 5
                                ..color = Colors.black,
                            ),
                          ),
                          // The text inside
                          Text(
                            widget.line2,
                            style: const TextStyle(
                              fontSize: 30,
                              letterSpacing: 5,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
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
                onPressed: () {},
                child: const Text(
                  'Download',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
