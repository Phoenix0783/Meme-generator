import 'package:flutter/material.dart';
import 'dart:math';

class RandomMeme extends StatefulWidget {
  const RandomMeme({super.key});

  @override
  State<RandomMeme> createState() => _RandomMemeState();
}

class _RandomMemeState extends State<RandomMeme> {
  void _changeRandonNumber() {
    var Newrand = Random().nextInt(6) + 1;
    setState(() {
      rand = Newrand;
    });
  }

  var rand = Random().nextInt(7) + 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Random meme generator')),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.all(16.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/meme/$rand.jpg',
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
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
                  onPressed: _changeRandonNumber,
                  child: const Text(
                    'Generate Meme',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
